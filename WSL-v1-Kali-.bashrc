# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@WSL-Kali\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###############################################################################################################
# WSL v1 Kali Linux: Default Aliases                # Targeted at Debian-Based Linux OS'es           	        #
###############################################################################################################
alias ll='ls -lh'				                            # long-listing of files with human-readable sizes	        #
alias la='ls -lha'				                          # long-listing of files with human-readable sizes incl    #
#						                                        # hidden files/folders 				                            #
alias l='ls -CF'				                            # long-listing of files/folders with entries by columns   #
#						                                        # also classifies them by indicator			                  #
alias em='emacs -nw'				                        # Launches Emacs text editor without a GUI frame	        #
alias dd='dd status=progress'			                  # dd shows a status bar so you can keep track of a .img   #
alias _='sudo'					                            # '_' runs the sudo command as a shortcut		              #
alias _i='sudo -i'				                          # '_i'  runs the sudo command as a shortcut as a login    #
#						                                        # shell						                                        #
###############################################################################################################

###############################################################################################################
# WSL v1 Kali Linux Aliases  			                  # Ad-Ons	                    			                      #
###############################################################################################################
# Update/Upgrade/Autoclean/Clean the System         #							                                            #
alias uu='sudo apt update;
sudo apt dist-upgrade --allow-downgrades -y;
sudo apt autoremove -y;
sudo apt clean -y'
alias install='sudo apt install -y '		            # Install without the fuss of typing.		                  #
alias search='apt-cache search '		                # Easily search Apt for packages			                    #
alias syn='sudo synaptic'			                      # Launch synaptic quickly				                          #
alias ninjpwn='sudo chown -Rv ninjitsu:ninjitsu '   # chown recursinvely as ninjitsu:ninjitsu 		            #
alias supwn='sudo chown -Rv root:root '	  	        # chown recursinvely as root:root	 		                    #
alias chx='sudo chmod -v +x '			                # chmod	to executable                                     #
alias chsu='sudo chmod -v u+s '			                # set suid  			                                        #
# Quicklhy remove the lock files from dpkg and apt # 							                                            #
alias aptul='sudo rm -fv /var/cache/apt/archives/lock* /var/cache/apt/archives/lock* /var/lib/dpkg/lock*'     #
# Quicklhy remove the lock files from dpkg and apt # 							                                            #
alias dpkgul='sudo rm -fv /var/cache/apt/archives/lock* /var/cache/apt/archives/lock* /var/lib/dpkg/lock*'    #
# Quicklhy remove the lock files from dpkg and apt # 							                                            #
alias fixapt='sudo apt -fy install; sudo dpkg --configure -a; sudo apt autoremove -y; sudo apt clean -y'      #
# Quicklhy remove the lock files from dpkg and apt # 							                                            #
alias fixdpkg='sudo apt -fy install; sudo dpkg --configure -a; sudo apt autoremove -y; sudo apt clean -y'     #
#						                                       # Repair apt and dpkg in one foul swoop.        	          #
alias debfix='sudo rm -fv /var/lib/dpkg/lock*;
	      sudo dpkg --configure -a;
	      sudo apt -fy install;
	      sudo apt update;
	      sudo apt dist-upgrade -y --allow-downgrades;
	      sudo apt autoremove -y;
	      sudo apt clean -y;
	      sudo grub-mkconfig'		                     #				                                       			      #
# Repair Bluetooth					                       #                                                          #
alias btrefresh='sudo systemctl stop bluetooth;
                 sudo systemctl start bluetooth;
                 sudo systemctl status bluetooth;
                 sudo btman;'
###############################################################################################################

###############################################################################################################
# Bourne Again Shell (B.A.S.H.): Essentials        #           (For Any Nix Box w/BASH)            	      #
###############################################################################################################
# List all files (incl hidden... human-readable size formatting)                                              #
alias l='ls -hla'				   #						              #
alias tx='tmux new -s Multiplex-1'		   # start a new tmux session named 'Multiplexed'	      #
alias tx2='tmux new -s Multiplex-2'	 	   # start a new tmux session named 'Multiplexed'	      #
alias tx3='tmux new -s Multiplex-3'		   # start a new tmux session named 'Multiplexed'	      #
alias att='tmux attach -t Multiplex-1'		   # Attach to Multiplex 1 session	                      #
alias att2='tmux attach -t Multiplex-2'		   # Attach to Multiplex 1 session	                      #
alias att3='tmux attach -t Multiplex-3'		   # Attach to Multiplex 1 session	                      #
alias lstmux='tmux ls'				   # List existing tmux sessions	                      #
alias sun='su ninjitsu'			           # switch to ninjitsu			                      #
alias susu='sudo su'				   # switch to root	                                      #
###############################################################################################################


###############################################################################################################
# .bashrc: Special Addition(s)			               #	   For your bashrc pleasure  			                      #
###############################################################################################################
alias e='sudo nano /home/ninjitsu/.bashrc'         #	< << Quick & Dirty Edit for>> > 		                    #
#						                                       #	          (THIS) 				                                #
#						                                       # 		       '.bashrc'			 	                              #
#						                                       #		          File					                              #
alias eg='sudo gedit /home/ninjitsu/.bashrc'       #  < << GTK-Edit This File!!! >> >                         #
###############################################################################################################

###############################################################################################################
# Custom Essentials: Aliases for most Linux(es)	   #     		(For Any Nix Box) 	                              #
###############################################################################################################
#(0)#													                     #                                                          #
#													                         #                                                          #
alias s0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak;
	  echo  "The suctl nullification phase is now complete."'					                                          #
#													                         #                                                          #
#(1)#													                     #                                                          #
#													                         #                                                          #
alias s1='sudo cp -vr /etc/sudoers /etc/sudoers.bak;sudo cp -vr /etc/sudoers /etc/sudoers.tmp;
gedit /etc/sudoers.tmp'		    								     #                                                          #
													                         #                                                          #
#													                         #                                                          #
#(2)#													                     #                                                          #
#													                         #                                                          #
alias s2='sudo cp -vr /etc/sudoers /etc/sudoers.bak;
	  sudo cp -vr /etc/sudoers /etc/sudoers.tmp;
          sudo gedit /etc/sudoers.tmp;
	  echo  "--- Phase 1: sudoers-configuration has completed. ---";
 	  sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
	  echo  "--- Phase 2: sudoers-configuration has Completed. ---"'
#													                          #                                                         #
#(3)#													                      #                                                         #
#													                          #                                                         #
alias s3='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'		            #
#-------------------------------------------------------------------------------------------------------------#
# Here, we have the same cmds in a human-comprehensable 'cmdlet-style' contextual nomenclature	              #
#										                                #                                                         #
##													                        #                                                         #
#(0)#													                      #                                                         #
##												                          #                                                         #
#													                          #                                                         #
alias sucfg-0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak;
               echo  "The suctl nullification phase is now complete."'                                        #
#										                                #                                                         #
##													                        #                                                         #
#(1)#													                      #                                                         #
##												                          #                                                         #
#													                          #                                                         #
alias sucfg-cp='sudo cp -vr /etc/sudoers /etc/sudoers.bak;sudo cp -vr /etc/sudoers /etc/sudoers.tmp;
          	sudo gedit /etc/sudoers.tmp;
	  	echo  "--- Phase 1: sudoers-configuration has completed. ---";
 	  	sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
	  	echo  "--- sucfg Phase 2 Completed. ---"'     #                                                         #
#										                                #                                                         #
##													                        #                                                         #
#(2)#													                      #                                                         #
##												                          #                                                         #
#													                          #                                                         #
alias sucfg-fi='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'	        #
#-------------------------------------------------------------------------------------------------------------#
# I designed a short group of aliases named sucfg, short for sudoers configuration...			                    #
# It is designed to protect against errors that may happen when directly editing the sudoers                  #
# file. I have been using nano directly on it for quite some time now, but know that's dangerous	            #
# I don't like to use visudo. I find Vim atrocious to use. I designed this alternative to be a better         #
# solution. Hopefully, for you too, this can be that. Cheers and have fun!!!				                          #
#													                          #                                                         #
#	 				Welcome to sucfg!!!						            #                                                         #
#													                          #                                                         #
#				  	   Please Read:							            #                                                         #
#													                          #                                                         #
# (0) - sucfg-0 - Clears previous sudoers.tmp and sudoers.bak files - BE CAUTIOUS WITH THIS!!!	              #
# (1) - sucfg-cp - (short for sudoers configuration copy):					                                          #
#       This cmd copies the original /etc/sudoers file to two files:			                                    #
#	* /etc/sudoers.bak									              #                                                         #
#		 &										                          #                                                         #
#	* /etc/sudoers.tmp									              #                                                         #
#							 					                            #                                                         #
#	It then opens the new /etc/sudoers.tmp file for editing with gedit.			                                    #
# (2) - sucfg-fi - (short for sudoers configuration finalization) - Copies your freshly edited                #
#       /etc/sudoers.tmp file to the real /etc/sudoers file.	 				                                        #
###############################################################################################################
# System Aliases:				                        # These Make your BASH shell & Software Experience Nice       #
###############################################################################################################
alias c='rsync --info=progress2 -avz '          # copy src to dir w/progress bar verbosely      	            #
alias r='rm -rvf '                              # remove dir or file(s) recursive/verbose(ly)   	            #
alias mdir='mkdir -vp '                         # mkdir w/parents verbosely                     	            #
alias t='touch '                                # touch a file without typing touch             	            #
alias sc='sudo rsync --info=progress2 -avz '    # copy src to dir w/progress bar verbosely     	              #
alias mpar='mkdir -vp '                         # mkdir w/parents verbosely                     	            #
alias t='touch '                                # touch a file without typing touch             	            #
alias cdsu='cd /etc/sudoers.d/;
sudo ls -l'			                                # enter the sudoers.d directory			                          #
alias restart='sudo reboot'                     # reboot or restart, doesn't matter			                      #
alias sucaja='gksudo caja'			                # run caja file explorer as root			                        #
alias cajasu='gksudo caja'			                # run caja file explorer as root			                        #
###############################################################################################################

###############################################################################################################
# Software Aliases:				                       # Adding Cushion to your Fingers			                        #
###############################################################################################################
# Changes directory to C:\Users\Ninjitsu\Music & downloads + extracts audio from YouTube + converts it into   #
# mp3 format.				      								       #                                                            #
alias y='cd "/mnt/c/Users/Ninjitsu/Music"; youtube-dl -x --audio-format=mp3 '                                 #
# Test out the aria2c downloader with youtube-dl:							                                                #
alias y2='cd "/mnt/c/Users/Ninjitsu/Music"; youtube-dl -x --audio-format=mp3 --external-downloader aria2c '   #
# Launch Grub-Customizer										     #                                                            #
alias gc='sudo grub-customizer'				      	   #                                                            #
# Download one track/playlist from  soundcloud   #                                                            #
alias dlmysc='scdl -a  --path "/mnt/c/Users/Ninjitsu/Music" --onlymp3 -l https://soundcloud.com/user2412129'  #
# Download a playlist from SoundCloud 	 	       # download a user's songs from SoundCloud		                #
alias dlusrsc='scdl -a  --path "/mnt/c/Users/Ninjitsu/Music" --onlymp3 -l '                                   #
# Download a playlist from a SoundCloud user 	   # download a playlist from a SoundCloud user	 	              #
alias dlscpl='scdl -p --path "/mnt/c/Users/Ninjitsu/Music"--onlymp3 -l '                                      #
# Download a user stream from SoundCloud 	       # download a user stream SoundCloud			                    #
alias dlscuserstream='scdl -s --onlymp3  --path "/mnt/c/Users/Ninjitsu/Music" -l '                            #
# Download a playlist from SoundCloud 	 	       # download user tracks SoundCloud			                      #
alias dlscusertracks='scdl -t --onlymp3 --path "/mnt/c/Users/Ninjitsu/Music" -l '                             #
# Download a user favs from SoundCloud 	         # download user favs from SoundCloud			                    #
alias dlscuserfavs='scdl -f --onlymp3 --path "/mnt/c/Users/Ninjitsu/Music" -l '                               #
# Download a playlist from SoundCloud 	 	       # download from user comments on SoundCloud		              #
alias dlscusercomments='scdl -C --onlymp3 --path "/mnt/c/Users/Ninjitsu/Music" -l '                           #
###############################################################################################################

###############################################################################################################
# Aliases for WSL(1/2) Kali Linux		             #             • Smoothly run your machine		                #
###############################################################################################################
# Install with one letter!										                                                                #
alias I='sudo apt install -y '
# One letter search...											                                                                  #
alias S='apt-cache search '
# Quick synaptic install launcher									                                                            #
alias syn='sudo synaptic'
# Quick synaptic gksudo launcher                                                                              #
alias gsyn='gksudo synaptic'
# Quickly configure all packages to fix dpkg                                                                  #
alias da='sudo dpkg --configure -a'
# Quickly configure all packages to fix dpkg alternate                                                        #
alias fixdpkg='sudo dpkg --configure -a'
# Quickly configure all packages to fix dpkg other alternative (easy to forget aliases and get confused!)     #
alias dpkgfix='sudo dpkg --configure -a'
# Clean apt                                                                                                   #
alias ccapt='sudo apt autoremove -y; sudo apt clean; sudo dpkg --configure -a; sudo apt -fy install'
alias cc='sudo apt autoremove -y; sudo apt clean; sudo dpkg --configure -a; sudo apt -fy install'
# Fix Apt                                                                                                     #
alias fa='sudo apt -fy install'
alias fixapt='sudo apt -f install'
alias aptfix='sudo apt -f install'
# Unlock Apt/dpkg                                                                                             #
alias ul='sudo rm /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock'
alias unlockapt='sudo rm /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock'
alias dpkgul='sudo rm /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock'
alias dpkgunlock='sudo rm /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock'
alias aptunlock='sudo rm /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock'
# Apt autoremove                                                                                              #
alias ar='sudo apt autoremove -y'
# Remove a broken package via the following command:                                                          #
alias remove='sudo dpkg --remove --force-remove-reinstreq '
# Cheat and see your aliases                                                                                  #
alias cheat='less /home/ninjitsu/.bashrc'
###############################################################################################################
# youtube-dl Tricks											                                                                      #
###############################################################################################################
# Auto-Install youtube-dl and deps                                                                            #
alias ytdl='sudo rm /usr/local/bin/youtube-dl;
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl;
sudo chmod a+rx /usr/local/bin/youtube-dl;
sudo apt install -y aria2 ffmpeg'
# Download a playlist with youtube-dl                                                                         #
alias p='cd "/mnt/c/Users/Ninjitsu/Music"; youtube-dl --yes-playlist -x --audio-format mp3 '
###############################################################################################################
# GitHub Tricks												                                                                        #
###############################################################################################################
#
# Add commit to GitHub... enter comment and finish with "                                                     #
alias gitcommit='cd /home/ninjitsu/GitHub/ninjitsu;
                 git init;
	               git add .;
                 git commit -m "Latest Auto-Commit < [ WSL v1 Kali Linux ] > .bashrc"'
# Add Commit to Relative Refractions GitHub								                                                    #
alias gitRR='cd /home/ninjitsu/GitHub/ninjitsu;
             git remote add origin https://github.com/relativerefractions/ninjitsu.git;
             git pull https://github.com/relativerefractions/ninjitsu.git;
             git push -u origin master;'
# Copy latest .bashrc to the current directory saved as WSL-v1-Kali-.bashrc										                #
alias cpbashrc='sudo cp /home/ninjitsu/.bashrc /home/ninjitsu/GitHub/ninjitsu/WSL-v1-Kali-.bashrc;'
# Copy latest .bashrc to GitHub all-in-one                                                                    #
alias b2rr='sudo cp /home/ninjitsu/.bashrc /home/ninjitsu/GitHub/ninjitsu/WSL-v1-Kali.bashrc;
	          cd /home/ninjitsu/GitHub/ninjitsu;
            git init;
            git add .;
            git commit -m "Latest Auto-Commit < [ WSL v1 Kali Linux ] > .bashrc";
            git remote add origin https://github.com/relativerefractions/ninjitsu.git;
            git pull https://github.com/relativerefractions/ninjitsu.git;
            git push -u origin master;'
# Copy WSL v1 Kali .bashrc to .bashrc                                                                    #
alias rr2b='sudo cp /home/ninjitsu/.bashrc /home/ninjitsu/GitHub/ninjitsu/WSL-v1-Kali.bashrc;'
# Configure GitHub Login Credentials                                                                          #
alias gitcfg="git config --global credential.helper 'store --file ~/.my-credentials'"                         #
################################################################################################################Cheat and see your aliases!!!                                                                                #
alias cheat='less /home/ninjitsu/.bashrc'                                                                     #
###############################################################################################################
# Special Thanks: To all you Linux users, developers, & hackers,					         #                          #
# without which, Linux, in all its complexity and awe would not be possible,				      #                   #
# be free, inspire others, or even exist at all.					        	      #                                   #
###############################################################################################################
#   By: Ninjitsu          |_______|_____________________________|_______________________________|	      #     #
#    - a.k.a.- 		  |			|				|			      #                                                               #
# Joel MatthewGrant       |===================================================================================#
# Email: refract@pm.me	  |	  |				|				|	      #                                                       #
###############################################################################################################

###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
# Pro-Tip: (kinda risky, but handy): I suggest you delete your root's .bashrc and hard-link your	            #
# administrative account's .bashrc where the root's used to be. This way you only have to update one	        #
# .bashrc file and thanks to these aliases, it's super easy. Stay fresh!    = )    = )    = )    = )          #
# Example Command: sudo rm -vf /root/.bashrc; sudo ln -v /home/ninjitsu/.bashrc /root/.bashrc		              #
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################

###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
# 01001010 01101111 01100101 01101100 00100000 01001101 01100001 01110100 01110100 01101000 01100101	        #
# 			01110111 00100000 01000111 01110010 01100001 01101110 01110100			                                  #
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################
# Alias definitions.											                                                                    #
# You may want to put all your additions into a separate file like					                                  #
# ~/.bash_aliases, instead of adding them here directly.						                                          #
# See /usr/share/doc/bash-doc/examples in the bash-doc package.						                                    #
###############################################################################################################

export DISPLAY=:0