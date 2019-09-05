###############################################################################################################
# Parrot OS Linux: Default Aliases                                                                  	      #
###############################################################################################################
# Long-listing of files with human-readable sizes
alias ll='ls -lh'

# Long-listing of files with human-readable sizes including hidden files/folders
alias la='ls -lha'

# Long-listing of files/folders with entries by columns & classifies them by indicator
alias l='ls -CF'	   

# Launches Emacs text editor without a GUI frame
alias em='emacs -nw'

# dd shows a status bar so you can keep track of writing an .img
alias dd='dd status=progress'

# '_' runs the sudo command as a shortcut
alias _='sudo'

# '_i'  runs the sudo command as a shortcut as a login shell
alias _i='sudo -i'				   
###############################################################################################################


###############################################################################################################
# Parrot OS Linux: Ad-On Aliases                                     				                          #
###############################################################################################################
# Update/Upgrade/Autoclean/Clean the System
alias uu='sudo apt update;										
sudo apt dist-upgrade --allow-downgrades -y;
sudo apt autoremove -y;
sudo apt clean -y'
	 
# Install without the fuss of typing.		                                        
alias install='sudo apt install -y '

# Easily search Apt for packages
alias search='apt-cache search '

# Launch synaptic quickly
alias syn='sudo synaptic'

# chown recursively as ninjitsu:ninjitsu
alias ninjpwn='sudo chown -Rv ninjitsu:ninjitsu '

# chown recursinvely as root:root
alias supwn='sudo chown -Rv root:root '

# chmod to executable
alias chx='sudo chmod -v +x '

# chmod to executable
alias chmx='sudo chmod -v +x '

# cd to Ninjitsu's Downloads
alias ninjdl='cd /home/ninjitsu/Downloads'

# cd to Root's Downloads
alias sudl='sudo cd /root/Downloads'

# check apt history
alias apthistory='less /var/log/apt/history.log'

# Quicky remove the lock files from dpkg and apt
alias unlock='sudo rm -fv /var/cache/apt/archives/lock* /var/cache/apt/archives/lock* /var/lib/dpkg/lock*'

# Fix Apt and dpkg
alias fixpkg='sudo apt -fy install; sudo dpkg --configure -a; sudo apt autoremove -y; sudo apt clean -y'

# Repair apt and dpkg in one foul swoop.
alias debfix='sudo rm -fv /var/cache/apt/archives/lock* /var/cache/apt/archives/lock* /var/lib/dpkg/lock*;
	      sudo dpkg --configure -a; 
	      sudo apt -fy install;
	      sudo apt update;
	      sudo apt dist-upgrade -y --allow-downgrades;
	      sudo apt autoremove -y;
	      sudo apt clean -y;
	      sudo grub-mkconfig'

# Repair Bluetooth
alias btrefresh='sudo systemctl stop bluetooth;
                 sudo systemctl start bluetooth;
                 sudo systemctl status bluetooth;
                 sudo btman;'

alias addx86='sudo dpkg --add-architecture i386;
                sudo apt update'
# Install w/dpkg from local file                
alias dpi='sudo dpkg -i '
###############################################################################################################

###############################################################################################################
# Arch Linux: Default Aliases - Targeted at Arch Linux Based OS'es                                 	          #
###############################################################################################################                                                                                         
# Install a package with Pacman
#alias i='sudo pacman -S '
# Confirm before overwriting something
#alias cp="cp -i"
# Human-readable sizes
#alias df='df -h'
# Free size in GB
#alias free='free -g'
# Show sizes in MB
#alias free='free -m'
# nano with PKGBUILD
#alias np='nano -w PKGBUILD'
# 'more' == 'less' pager
#alias more=less
###############################################################################################################

###############################################################################################################
# Arch Linux: Alias' Ad-Ons                                                                                   #
###############################################################################################################
# Update/Upgrade Pacman & Sync
#alias p='sudo pacman -Syyu
# Install a package with Pacman
#alias i='sudo pacman -S '
# Build packages from source without a bother
#alias mk='makepkg --noconfirm -Ssci '
###############################################################################################################

###############################################################################################################
# Bourne Again Shell (B.A.S.H.): Essentials - (For Any Nix Box w/BASH)                              	      #
###############################################################################################################
# List all files (incl hidden) w/human-readable size formatting:
alias l='ls -hla'

# Start a new tmux session named 'Multiplex-1'
alias t1='tmux new -s Multiplex-1'

# Start a new tmux session named 'Multiplex-2'
alias t2='tmux new -s Multiplex-2'

# Start a new tmux session named 'Multiplex-3'
alias t3='tmux new -s Multiplex-3'

# Attach to session: Multiplex 1
alias att1='tmux attach -t Multiplex-1'

# Attach to session: Multiplex 1
alias att2='tmux attach -t Multiplex-2'

# Attach to session: Multiplex 1
alias att3='tmux attach -t Multiplex-3'

# List existing tmux sessions
alias lt='tmux ls'

# Switch to ninjitsu
alias sun='su ninjitsu'

# Switch to root
alias susu='sudo su'

###############################################################################################################

###############################################################################################################
# .bashrc: Special Addition(s) - For your bashrc pleasure                                     			      #
###############################################################################################################
#	< << Quick & Dirty Edit for >> >
#	            (THIS)
# 		       '.bashrc'
#		         File
alias e='sudo pluma /home/ninjitsu/.bashrc'

# Remove root's bashrc and link ninjitsu's
alias bashrcfix='sudo rm -v /root/.bashrc;
                 echo "Removed the root.bashrc file.";
                 sudo ln /home/ninjitsu/.bashrc /root/.bashrc
                 echo "Hard-linked "/home/ninjitsu/.bashrc" to "/root/.bashrc";
                 echo "Only one .bashrc to edit now: "/home/ninjitsu/.bashrc"'

###############################################################################################################

###############################################################################################################
# Custom Essentials: Aliases for most Linux(es)	                                                              #
###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
#	 				Welcome to sucfg!!!
#				  	   Please Read:							      
# I designed a short group of aliases named sucfg, short for sudoers configuration...
# It is designed to protect against errors that may happen when directly editing the sudoers
# file. I have been using nano directly on it for quite some time now, but know that's dangerous
# I don't like to use visudo. I find Vim atrocious to use. I designed this alternative to be a better
# solution. Hopefully, for you too, this can be that. Cheers and have fun!!!
# (0) - sucfg-0 - Clears previous sudoers.tmp file
# (1) - sucfg-1 - (short for sudoers configuration copy):
#       This cmd copies the original /etc/sudoers file to two files:
#	* /etc/sudoers.bak
#		 &
#	* /etc/sudoers.tmp
#
#	It then opens the new /etc/sudoers.tmp file for editing with pluma.
# (2) - sucfg-2 - (short for sudoers configuration finalization) - Copies your freshly edited
#       /etc/sudoers.tmp file to the real /etc/sudoers file.
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################

#
#(0)# Clear previous sudoers tmp file
#

alias s0='sudo rm -v /etc/sudoers.tmp;
	      echo  "--- Phase 1: sudoers nullification phase has completed. ---"'
#
#(1)# Create a sudoers backup and temp file and edit temp file 
#

alias s1='sudo cp -vf /etc/sudoers /etc/sudoers.bak;
          sudo cp -vf /etc/sudoers /etc/sudoers.tmp;
          sudo pluma /etc/sudoers.tmp;
	      echo  "--- Phase 1: sudoers configuration has completed. ---"'
#
#(2)# Copy the edited temp file over the original
#
								
alias s2='sudo cp -v /etc/sudoers.tmp /etc/sudoers;
          echo  "--- Phase 2: sudoers configuration has completed. ---"'
          
# Here, we have the same cmds in a human-comprehensable 'cmdlet-style' contextual nomenclature
#
##
#(0)# Clear previous sudoers backup file
##
#

alias sucfg-0='sudo rm -v /etc/sudoers.tmp /etc/sudoers.bak;
	      echo  "--- Phase 1: sudoers nullification phase has completed. ---"'											
#
##
#(1)# Create a sudoers backup and temp file and edit temp file 
##
#

alias sucfg-1='sudo cp -v /etc/sudoers /etc/sudoers.bak;
          sudo cp -v /etc/sudoers /etc/sudoers.tmp;
          sudo pluma /etc/sudoers.tmp;
	      echo  "--- Phase 1: sudoers configuration has completed. ---"'

#
##
#(2)# Copy the edited temp file over the original
##
#

alias sucfg-2='sudo cp -v /etc/sudoers.tmp /etc/sudoers;
          echo  "--- Phase 2: sudoers configuration has completed. ---"'								


###############################################################################################################
# System Aliases: - These Make your BASH shell & Software Experience Nice                                     #
###############################################################################################################
# Sudo copy from src to dir w/progress bar verbosely
alias c='sudo rsync --info=progress2 -avz '

# Sudo remove dir or file(s) recursive/verbose(ly) (forcibly)
alias r='sudo rm -rvf '

# sudo mkdir w/parents verbosely
alias mdir='sudo mkdir -vp '

# sudo touch a file without typing touch
alias t='sudo touch '

# sudo copy src to dir w/progress bar verbosely
alias sc='sudo rsync --info=progress2 -avz '

# sudo rsync backup the whole system just feed the backup dir as an arg
alias sysbak='sudo rsync -aAXvruxz --info=progress2 --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / '

# Enter the sudoers.d directory
alias cdsu='sudo cd /etc/sudoers.d/;	sudo ls -l'

# Reboot
alias restart='sudo reboot'

# Run caja file explorer as root
alias sucaja='gksudo caja'

# Run caja file explorer as root
alias cajasu='gksudo caja'

###############################################################################################################

###############################################################################################################
# Software Aliases:	- Adding Cushion to your Fingers			                                              #
###############################################################################################################
# Downloads & extracts audio from YouTube and converts it into mp3 format via youtube-dl
alias y='cd /home/ninjitsu/Music; youtube-dl -x --audio-format=mp3 '

# Launch Grub-Customizer
alias gc='sudo grub-customizer'

# Download my playlist from  Soundcloud
alias dlmysc='scdl -a  --path /home/ninjitsu/Music --onlymp3 -l https://soundcloud.com/user2412129'  				

# Download a user's songs from SoundCloud
alias dlusrsc='scdl -a  --path /home/ninjitsu/Music --onlymp3 -l '  				

# Download a playlist from a SoundCloud user
alias dlscpl='scdl -p --path /home/ninjitsu/Music --onlymp3 -l '

# Download a user stream from SoundCloud
alias dlscuserstream='scdl -s --onlymp3  --path /home/ninjitsu/Music -l '

# Download user's tracks from SoundCloud
alias dlscusertracks='scdl -t --onlymp3 --path /home/ninjitsu/Music -l '

# Download a user favs from SoundCloud
alias dlscuserfavs='scdl -f --onlymp3 --path /home/ninjitsu/Music -l '

# Download from user comments on SoundCloud
alias dlscusercomments='scdl -C --onlymp3 --path /home/ninjitsu/Music -l '

# Copy the music dir to the WINE music dir
alias cpmusic2wine='sudo cp -rav /home/ninjitsu/Music /home/ninjitsu/.wine/drive_c/users/ninjitsu/My\ Music'

# Types half of the command for you for ntfs-3g mounts
alias ntfs3g='sudo ntfs-3g -o rw '

# Copy the WINE-Cask dir to WINE's Download's dir

alias copytowine='sudo cp -var /home/ninjitsu/WINE-Cask/ /home/ninjitsu/.wine/drive_tec/users/ninjitsu/Downloads/;
                  sudo chown -Rv ninjitsu:ninjitsu /home/ninjitsu/' 
alias WINE='firejail --noprofile optirun wine '
alias WINETRICKS='firejail --noprofile optirun winetricks'
alias POL='firejail --noprofile optirun /opt/POL-POM-4/playonlinux'
###############################################################################################################

###############################################################################################################
# Special Thanks: To all you Linux users, developers, & hackers,                                              #
# without which, Linux, in all its complexity and awe would not be possible,				                  #
# be free, inspire others, or even exist at all.					        	                              #
###############################################################################################################
#   By: Ninjitsu          |_______|_____________________________|_______________________________|	          #
#    - a.k.a.- 		                    |			  |				            |                             #
# Joel MatthewGrant       |===================================================================================#
# Email: refract@pm.me	  |	                |				|				|	                              #
###############################################################################################################

###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
# 01001010 01101111 01100101 01101100 00100000 01001101 01100001 01110100 01110100 01101000 01100101	      #
# 			01110111 00100000 01000111 01110010 01100001 01101110 01110100			                          #
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################

