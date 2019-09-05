#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/mount.h>
#include <sys/sysmacros.h>
#include <fcntl.h>
#include <sched.h>
#include <signal.h>
#include <unistd.h>
#include <array>
#include <fstream>
#include <iostream>
#include <regex>

constexpr int STACK_SZ = 1024*1024;
static char tubstack[STACK_SZ];

struct TubParams
{
    int argc_;
    const char* const* argv_;
    std::string root_path_;
    std::string tty_path_;
};

const char* child_args[] = {
    "/bin/bash",
    //"./hello",
    //"./myinit",
    //"/home/ken/systemd/lib/systemd/systemd",
    //"/lib/systemd/systemd",
    //"--unit=emergency.target",
    //"--unit=wsl2.target",
    //"--unit=basic.target",
    //"--default-standard-output=tty",
    //"--default-standard-error=tty",
    //"--log-target=journal",
    //"--log-level=info",
    //"--machine-id=99999c95f1844071b47b20d3b0933da8",
    NULL
};

const char* envp[] = {
    "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    "TERM=xterm-256color",
    "debian_chroot=wsltub",
    "container=lxc",
    //"LD_PRELOAD=/home/ken/Devel/wsltub/build/out/lib/libwslshim.so",
    //"LD_PRELOAD=/home/ken/Devel/xenial/home/ken/Devel/wsltub/build/out/lib/libwslshim.so",
    NULL
};


static int chk(const std::string &label, int ret)
{
    if (ret < 0) {
        perror(label.c_str());
        _exit(1);
    }
    return 0;
}

constexpr uint32_t DEV_MAJ_MEM = 1;
constexpr uint32_t DEV_MAJ_TTYALT = 5;

constexpr uint32_t DEV_MIN_NULL = 2;
constexpr uint32_t DEV_MIN_ZERO = 5;
constexpr uint32_t DEV_MIN_FULL = 7;
constexpr uint32_t DEV_MIN_RANDOM = 8;
constexpr uint32_t DEV_MIN_URANDOM = 9;
constexpr uint32_t DEV_MIN_TTY = 0;
constexpr uint32_t DEV_MIN_CONSOLE = 1;
constexpr uint32_t DEV_MIN_PTMX = 2;

struct DevNod 
{
    unsigned int maj;
    unsigned int min;
    mode_t mode;
    const char *name;
};

static const DevNod nods[] = {    
    { DEV_MAJ_MEM, DEV_MIN_NULL, 0666, "null"},
    { DEV_MAJ_MEM, DEV_MIN_ZERO, 0666, "zero"},
    { DEV_MAJ_MEM, DEV_MIN_FULL, 0666, "full"},
    { DEV_MAJ_MEM, DEV_MIN_RANDOM, 0666, "random"},
    { DEV_MAJ_MEM, DEV_MIN_URANDOM, 0666, "urandom"},
    { DEV_MAJ_TTYALT, DEV_MIN_TTY, 0666, "tty"},
    { DEV_MAJ_TTYALT, DEV_MIN_PTMX, 0666, "ptmx"}
};
constexpr size_t numnods = sizeof(nods)/sizeof(DevNod);

static int mk_devnods(const std::string &dir, const DevNod *nods, size_t n)
{
    int ret = 0;
    for (int i = 0; i < n; i++) {
        const DevNod &nod = nods[i];
        std::string path = dir + nod.name;
        if ((ret = mknod(path.c_str(), nod.mode, makedev(nod.maj, nod.min))) != 0) {
            return ret;
        }
    }
    return ret;
}

static std::string ttyname_str()
{
    char buf[1024];
    return (ttyname_r(0, buf, sizeof(buf)) == 0) ? buf : "ttynamefailed";
}

static void preliminaries(const std::string &root_path, const std::string &tty_path)
{
    auto mount_rel = [&root_path](const char *src, const char *target, const char *type, unsigned long flags = 0) {
        std::string path = root_path + target;
        std::string label = std::string("mount ") + (target ? target : "null");
        return chk(label, mount(src, path.c_str(), type, flags, NULL));
    };

    std::cout << "wsltub: Mounting preliminary filesystems\n";
    mkdir(root_path.c_str(), 0755);
    //int mnt_flags = MS_BIND | MS_REC | MS_PRIVATE;
    int mnt_flags = MS_BIND | MS_PRIVATE;
    chk("bind mount " + root_path, mount("/", root_path.c_str(), root_path.c_str(), 
        mnt_flags, NULL));    
    mount_rel("tmpfs", "/dev", "tmpfs");
    chk("mkdir", mkdir((root_path + "/dev/pts").c_str(), 0755));
    chk("mk_devnods", mk_devnods((root_path + "/dev/").c_str(), nods, numnods));
    mount_rel("devpts", "/dev/pts", "devpts", MS_NOSUID|MS_NOEXEC);
    mount_rel("sysfs", "/sys", "sysfs");
    mount_rel("proc", "/proc", "proc");
 
    // bind mount our tty over /dev/console
    const std::string conpath = "/dev/console";
    unlink((root_path + conpath).c_str());
    int fd = open((root_path + conpath).c_str(), O_CREAT, 0600);
    chk("open " + conpath, fd);
    close(fd);
    mount_rel(tty_path.c_str(), "/dev/console", NULL, MS_BIND);

    // bind mount wslhostname over /etc/hostname to leave the original intact
    const std::string hostname = "inthetub\n";
    std::cout << "Changing hostname to: " << hostname;
    const std::string host_name_path = root_path + "/wslhostname";
    unlink(host_name_path.c_str());
    fd = open(host_name_path.c_str(), O_WRONLY|O_NOFOLLOW|O_CREAT|O_TRUNC, 0644);
    chk("open " + host_name_path, fd);
    chk("write " + host_name_path, write(fd, hostname.c_str(), hostname.length()));
    close(fd);
    mount_rel(host_name_path.c_str(), "/etc/hostname", NULL, MS_BIND);

    std::cout << "Changing root to: " << root_path << "\n";
    chk("chroot", chroot(root_path.c_str()));
    chk("chdir", chdir("/"));
}

static int tub(void *pvtp)
{
    TubParams &tp = *static_cast<TubParams*>(pvtp);
    preliminaries(tp.root_path_, tp.tty_path_);

    std::cout << "wsltub: Stepping into the tub: "<< child_args[0] << "\n";
    unshare(CLONE_NEWCGROUP);
    execve(child_args[0], 
        const_cast<char* const*>(child_args),  
        const_cast<char* const*>(envp));

    std::cout << "oops, execve() on systemd failed\n";

    return 0;
}

static bool in_wsl()
{
    std::ifstream ifs;
    ifs.open("/proc/version");
    constexpr size_t bufsz = 16384;
    std::array<char, bufsz> buf;
    ifs.getline(buf.data(), bufsz, '\n');
    std::string ver = buf.data();
    //std::regex rx("\\/proc\\/(self|[0-9]+)\\/cgroup");
    std::regex rx("Linux version [0-9]+\\.[0-9]+.[0-9]+-([0-9]+)-Microsoft");
    std::smatch match;
    if (std::regex_search(ver, match, rx)) {
        std::cout << "wsltub: WSL version " << match[1] << "\n";
    } else {
        std::cout << "wsltub: " << ver << "\n";
    }
    return true;
}

int main(int argc, const char *argv[])
{
    //const string root = "/home/ken/Devel/xenial";
    //const std::string root_path = "/tmp/wslroot";
    const std::string root_path = "/var/lib/lxc/ubuntu1804/rootfs";
    std::string tty_path = ttyname_str();
    std::cout << "wsltub: starting on " << tty_path << "\n";

    chk("mount /", mount("none", "/", NULL, MS_REC|MS_PRIVATE, NULL));

    TubParams tp = {argc, argv, root_path, tty_path};
    int flags = CLONE_VFORK | SIGCHLD |
        CLONE_NEWNS | CLONE_NEWUTS | CLONE_NEWIPC | CLONE_NEWPID;
    int extflags = CLONE_NEWNET;
#ifdef CLONE_NEWCGROUP
    // CLONE_NEWCGROUP is relatively new and not avaiable on
    // stock Ubuntu 16.04.
    std::cout << "using CLONE_NEWCGROUP\n";
    extflags |= CLONE_NEWCGROUP;
#endif
    if (!in_wsl()) {
        flags |= extflags;
    }
    int child_pid = clone(tub, tubstack+STACK_SZ, flags, &tp);
    chk("clone", child_pid);
    waitpid(child_pid, NULL, 0);
    std::cout << "wsltub: exiting.\n";
    return 0;
}

