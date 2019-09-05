
###############################################################################################################
# Debian-Based Linux: Default Aliases              # Targeted at Debian-Based Linux OS'es           	      #
###############################################################################################################
#alias ll='ls -lh'				   # long-listing of files with human-readable sizes	      #
#alias la='ls -lha'				   # long-listing of files with human-readable sizes incl     #
#						   # hidden files/folders 				      #
#alias l='ls -CF'				   # long-listing of files/folders with entries by columns    #
#						   # also classifies them by indicator			      #
#alias em='emacs -nw'				   # Launches Emacs text editor without a GUI frame	      #
#alias dd='dd status=progress'			   # dd shows a status bar so you can keep track of a .img    #
#alias _='sudo'					   # '_' runs the sudo command as a shortcut		      #
#alias _i='sudo -i'				   # '_i'  runs the sudo command as a shortcut as a login     #
#						   # shell						      #
###############################################################################################################

###############################################################################################################
# Debian-Based: Alias' 				   #			Ad-Ons				      #
###############################################################################################################
# Update/Upgrade/Autoclean/Clean the System        #							      #
#alias uu='sudo apt update;										      #
#sudo apt dist-upgrade --allow-downgrades -y;								      #
#sudo apt autoremove -y;										      #
#sudo apt clean -y'     				 						      #
#alias install='sudo apt install -y '		   # Install without the fuss of typing.		      #
#alias search='apt-cache search '		   # Easily search Apt for packages			      #
#alias lsn='sudo synaptic'			   # Launch synaptic quickly				      #
#alias ninjpwn='sudo chown -Rv ninjitsu:ninjitsu ' # chown recursinvely as ninjitsu:ninjitsu 		      #
#alias supwn='sudo chown -Rv root:root '	   # chown recursinvely as root:root	                      #
#alias chmx='su#do chmod -v +x '		   # chmod						      #
# Quicklhy rem#ove the lock files from dpkg and apt # 							      #
#alias aptul='s#udo rm -fv /var/cache/apt/archives/lock* /var/cache/apt/archives/lock* /var/lib/dpkg/lock*'   #
# Quicklhy remove the lock files from dpkg and apt # 							      #
#alias dpkgul='sudo rm -fv /var/cache/apt/archives/lock* /var/cache/apt/archives/lock* /var/lib/dpkg/lock*'   #
# Quicklhy remove the lock files from dpkg and apt # 							      #
#alias fixapt='sudo apt -fy install; sudo dpkg --configure -a; sudo apt autoremove -y; sudo apt clean -y'     #
# Quicklhy remove the lock files from dpkg and apt # 							      #
#alias fixdpkg='sudo apt -fy install; sudo dpkg --configure -a; sudo apt autoremove -y; sudo apt clean -y'    #
#						   # Repair apt and dpkg in one foul swoop.        	      #
#alias debfix='sudo rm -fv /var/lib/dpkg/lock*;								      #
#	      sudo dpkg --configure -a; 								      #
#	      sudo apt -fy install;									      #
#	      sudo apt update;										      #
#	      sudo apt dist-upgrade -y --allow-downgrades;						      #
#	      sudo apt clean -y;									      #
#	      sudo grub-mkconfig'		   #				  			      #
#						   # Repair Bluetooth					      #
#alias btrefresh='sudo systemctl stop bluetooth;							      #
#                 sudo systemctl start bluetooth;							      #
#                 sudo systemctl status bluetooth;							      #
#                 sudo btman;' 			   							      # 
###############################################################################################################

###############################################################################################################
# Arch Linux: Default Aliases                     # Targeted for Arch Linux Based OS'es           	      #
###############################################################################################################                                                                                        
alias cp="cp -ivr"                                # confirm before overwriting something          	      #
alias df='df -h'                                  # human-readable sizes                          	      #
alias free='free -g'		 	          # free size in GB					      #
#alias free='free -m'                             # show sizes in MB                              	      #
alias np='nano -w PKGBUILD'                       # nano with PKGBUILD                            	      #  
# USE jctl to check journalctl for errors         # need to make a grep-able version/script		      #
alias jctl='journalctl -xe | grep '		  #							      #
#        'more' == 'less' pager    		  #							      #
alias more=less                                   
alias refreshbt='sudo systemctl stop bluetooth;
		 sudo systemctl start bluetooth;
		 sudo systemctl status bluetooth;'
###############################################################################################################

###############################################################################################################
# Arch Linux: Aliases Ad-Ons  										      #
###############################################################################################################
alias uu='sudo pacman -Syyu --noconfirm '          # Update/Upgrade Pacman & Sync	                      #
alias search='sudo pacman -Ss ' 	           # Search the pacman sync DB for packages            	      #
alias install='sudo pacman -S --noconfirm '        # Install a package with Pacman                	      #
alias mk='makepkg --noconfirm -Ssci '		   # Build packages from source without a bother  	      #
###############################################################################################################

###############################################################################################################
# Bourne Again Shell (B.A.S.H.): Essentials        #           (For Any Nix Box w/BASH)            	      #
###############################################################################################################
#			       	     					      		      		      #
# 		List all files:			   & 		Human-Readable Size Formatting		      #
#													      #
#	         (incl hidden)                           				                      #
###############################################################################################################
alias l='ls -hla'				   # 							      #
alias tx1='tmux new -s multiplex-1'		   # Start a new tmux session named 'multiplex-1'	      #
alias tx2='tmux new -s multiplex-2'	 	   # Start a new tmux session named 'multiplex-2              #
alias tx3='tmux new -s multiplex-3'		   # Start a new tmux session named 'multiplex-3'             #
alias att1='tmux attach -t multiplex-1'		   # Attach to Multiplex 1 session			      #
alias att2='tmux attach -t multiplex-2'		   # Attach to Multiplex 1 session			      #
alias att3='tmux attach -t multiplexc-3'	   # Attach to Multiplex 1 session			      #
alias lstmux='tmux ls'				   # List existing tmux sessions			      #
alias sun='su ninjitsu'				   # Switch to ninjitsu					      #
alias susu='sudo su'				   # Switch to root					      #
###############################################################################################################

###############################################################################################################
# .bashrc: Special Addition(s)			   #	   for your bashrc pleasure  			      #
###############################################################################################################
alias e='sudo gedit /home/ninjitsu/.bashrc'        #	< << Quick & Dirty Edit for>> > 		      #
#						   #	          (THIS) 				      #
#						   # 		 '.bashrc'			 	      #
#						   #		   File					      #
###############################################################################################################

###############################################################################################################
# Custom Essentials: Aliases for most Linux(es)	   #     		(For Any Nix Box) 	              #
###############################################################################################################
#(0)#													      #
#													      #
alias s0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak;	
	  echo  "The suctl nullification phase is now complete."'					      #
#													      #												
#(1)#													      #
#													      #    
alias s1='sudo cp -vr /etc/sudoers /etc/sudoers.bak;sudo cp -vr /etc/sudoers /etc/sudoers.tmp;     	 
gedit /etc/sudoers.tmp'		    								    	      #
													      #
#													      #
#(2)#													      #
#													      #
alias s2='sudo cp -vr /etc/sudoers /etc/sudoers.bak;
	  sudo cp -vr /etc/sudoers /etc/sudoers.tmp;							
          sudo gedit /etc/sudoers.tmp;
	  echo  "--- Phase 1: sudoers-configuration has completed. ---";
 	  sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
	  echo  "--- Phase 2: sudoers-configuration has Completed. ---"'
#													      #
#(3)#													      #
#													      #
alias s3='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'		      #										
#-------------------------------------------------------------------------------------------------------------#
# Here, we have the same cmds in a human-comprehensable 'cmdlet-style' contextual nomenclature	              #												         													      	      #
#										                              #
##													      #
#(0)#													      #
##												              #
#													      #
alias sucfg-0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak;
               echo  "The suctl nullification phase is now complete."'												
#										                              #
##													      #
#(1)#													      #
##												              #
#													      #
alias sucfg-cp='sudo cp -vr /etc/sudoers /etc/sudoers.bak;sudo cp -vr /etc/sudoers /etc/sudoers.tmp;
          	sudo gedit /etc/sudoers.tmp;
	  	echo  "--- Phase 1: sudoers-configuration has completed. ---";
 	  	sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
	  	echo  "--- sucfg Phase 2 Completed. ---"'
#										                              #
##													      #
#(2)#													      #
##												              #
#													      #    
alias sucfg-fi='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'	      #													
#-------------------------------------------------------------------------------------------------------------#
# I designed a short group of aliases named sucfg, short for sudoers configuration...			      #
# It is designed to protect against errors that may happen when directly editing the sudoers                  #
# file. I have been using nano directly on it for quite some time now, but know that's dangerous	      #
# I don't like to use visudo. I find Vim atrocious to use. I designed this alternative to be a better         #
# solution. Hopefully, for you too, this can be that. Cheers and have fun!!!				      #
#													      #
#	 				Welcome to sucfg!!!						      #
#													      #
#				  	   Please Read:							      #
#													      #
# (0) - sucfg-0 - Clears previous sudoers.tmp and sudoers.bak files - BE CAUTIOUS WITH THIS!!!	              #
# (1) - sucfg-cp - (short for sudoers configuration copy):					              #
#       This cmd copies the original /etc/sudoers file to two files:			                      #
#	* /etc/sudoers.bak									              #
#		 &										              #
#	* /etc/sudoers.tmp									              #
#							 					              #
#	It then opens the new /etc/sudoers.tmp file for editing with gedit.			              #
# (2) - sucfg-fi - (short for sudoers configuration finalization) - Copies your freshly edited                # 
#       /etc/sudoers.tmp file to the real /etc/sudoers file.	 				              #
###############################################################################################################
# System Aliases:				# These Make your BASH shell & Software Experience Nice       #
###############################################################################################################
alias c='rsync --info=progress2 -avz '          # copy src to dir w/progress bar verbosely      	      #
alias r='rm -rvf '                              # remove dir or file(s) recursive/verbose(ly)   	      #
alias mdir='mkdir -vp '                         # mkdir w/parents verbosely                     	      #
alias t='touch '                                # touch a file without typing touch             	      #
alias c='rsync --info=progress2 -avz '          # copy src to dir w/progress bar verbosely     		      #
alias sc='sudo rsync --info=progress2 -avz '    # copy src to dir w/progress bar verbosely     	 	      #  
alias mpar='mkdir -vp '                         # mkdir w/parents verbosely                     	      #
alias t='touch '                                # touch a file without typing touch             	      #
alias cdsu='cd /etc/sudoers.d/;			
sudo ls -l'			                # enter the sudoers.d directory				      #
alias restart='sudo reboot'                     # reboot or restart, doesn't matter			      #
# 						# search aliases with grep				      #
alias searchalias='grep -rnIi --color '		#
alias sucaja='gksudo caja'			# run caja file explorer as root			      #
alias cajasu='gksudo caja'			# run caja file explorer as root			      #
###############################################################################################################

###############################################################################################################
# Software Aliases:				 # Adding Cushion to your Fingers			      #
###############################################################################################################

# Downloads & extracts audio from YouTube and converts it into mp3 format.				      #
alias y='youtube-dl -x --audio-format=mp3 '       # download audio mp3 from youtube link         	      #

# Test out the aria2c downloader with youtube-dl:							      #
alias ytest='youtube-dl -x --audio-format=mp3 --external-downloader aria2c '				      #
alias gc='sudo grub-customizer'			  # Launch Grub-Customizer				      #

# download one track/playlist from  soundcloud 	  # download from soundcloud				      #
alias dlmysc='scdl -a  --path /home/ninjitsu/Music --onlymp3 -l https://soundcloud.com/user2412129'  				
# download a playlist from soundcloud 	 	  # download a user's songs from soundcloud		      #
alias dlusrsc='scdl -a  --path /home/ninjitsu/Music --onlymp3 -l '  				

# download a playlist from a soundcloud user 	  # download a playlist from a soundcloud user	 	      #
alias dlscpl='scdl -p --path /home/ninjitsu/Music --onlymp3 -l '

# download a user stream from soundcloud 	  # download a user stream soundcloud			      #
alias dlscuserstream='scdl -s --onlymp3  --path /home/ninjitsu/Music -l '

# download a playlist from soundcloud 	 	  # download user tracks soundcloud			      #
alias dlscusertracks='scdl -t --onlymp3 --path /home/ninjitsu/Music -l '

# download a user favs from soundcloud 	 	  # download user favs from soundcloud			      #
alias dlscuserfavs='scdl -f --onlymp3 --path /home/ninjitsu/Music -l '

# download a playlist from soundcloud 	 	  # download from user comments on soundcloud		      #
alias dlscusercomments='scdl -C --onlymp3 --path /home/ninjitsu/Music -l '

# copy music from Ninjitsu's Music dir to         # the WINEPREFIX dir = ~/.wine 
alias cpmusic2wine='sudo cp -rav /home/ninjitsu/Music /home/ninjitsu/.wine/drive_c/users/ninjitsu/My\ Music;\
sudo chown -Rv ninjitsu:ninjitsu /home/ninjitsu'
					         ##############################################################
################################################### 							      #
#						  # Mission: Ninj's music dir cp'd to WINE the music dir      #
# Skip half of the command for ntfs-3g	          # 	     						      #	
# fill in the block dev & mnt-point.		  #  	               					      #	
#						  #       ( Save typing  & automate it as a cronjob. )        #
alias 3gmt='sudo ntfs-3g -o rw '		  #							      #
# 						  # 							      #
###############################################################################################################

alias winecfg='sudo cp -var /root/Downloads/ 			   /home/ninjitsu/WINE-Cask;
	       sudo cp -var /home/ninjitsu/Downloads/   	   /home/ninjitsu/WINE-Cask;			
	sudo cp -var /home/ninjitsu/WINE-Cask/	      /home/ninjitsu/.wine/drive_c/users/ninjitsu/Downloads/;	      
      sudo chown -Rv ninjitsu:ninjitsu /home/ninjitsu/             /mnt/home/ninjitsu/;'

alias music2wine='sudo cp -var /home/ninjitsu/Music/  /home/ninjitsu/.wine/drive_c/users/ninjitsu/My Music;
		     sudo chown -Rv ninjitsu:ninjitsu /home/ninjitsu/  /mnt/home/ninjitsu/;'
###############################################################################################################
#					  	  #							      #
#   if /dev/sdbXx is mounted at /mnt/, it's /home/ninjitsu/ will be recursively and verbosely chowned to:     #
#			      										      #
#				       #  ninjitsu:ninjitsu    #					      #
#													      #
#						  #							      #
###############################################################################################################

###############################################################################################################
# Special Thanks: To all you Linux users, developers, & hackers,					      #
# without which, Linux, in all its complexity and awe would not be possible,				      #
# be free, inspire others, or even exist at all.					        	      #
###############################################################################################################
#   By: Ninjitsu          |_______|_____________________________|_______________________________|	      #
#    - a.k.a.- 		  |			|				|			      #
# Joel MatthewGrant       |===================================================================================#
# Email: refract@pm.me	  |	  |				|				|	      #
###############################################################################################################

###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
# Pro-Tip: (kinda risky, but handy): I suggest you delete your root's .bashrc and hard-link your	      #
# administrative account's .bashrc where the root's used to be. This way you only have to update one	      #
# .bashrc file and thanks to these aliases, it's super easy. Stay fresh!    = )    = )    = )    = )          #
# Example Command: sudo rm -vf /root/.bashrc; sudo ln -v /home/ninjitsu/.bashrc /root/.bashrc		      #
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################

###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
# 01001010 01101111 01100101 01101100 00100000 01001101 01100001 01110100 01110100 01101000 01100101	      #
# 			01110111 00100000 01000111 01110010 01100001 01101110 01110100			      #
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################
# Debian-Based Linux: Default Aliases            # Targeted at Debian-Based Linux OS'es           	      #
###############################################################################################################
#alias ll='ls -lh'				   # long-listing of files with human-readable sizes	      #
#alias la='ls -lha'				   # long-listing of files with human-readable sizes incl     #
#						   # hidden files/folders 				      #
#alias l='ls -CF'				   # long-listing of files/folders with entries by columns    #
#						   # also classifies them by indicator			      #
#alias em='emacs -nw'				   # Launches Emacs text editor without a GUI frame	      #
#alias dd='dd status=progress'			   # dd shows a status bar so you can keep track of a .img    #
#alias _='sudo'					   # '_' runs the sudo command as a shortcut		      #
#alias _i='sudo -i'				   # '_i'  runs the sudo command as a shortcut as a login     #
#						   # shell						      #
# Note: I'd like to get a cheat grep function working to search for the name of the different aliases 	      #
###############################################################################################################

###############################################################################################################
# Debian-Based: Aliases				   #			Ad-Ons				      #
###############################################################################################################
#alias uu='sudo apt update;										
#sudo apt dist-upgrade --allow-downgrades -y;
#sudo apt autoremove -y;
#sudo apt clean -y'     			   # Update/Upgrade/Autoclean/Clean the System with Apt       #
#alias install='sudo apt install -y '		   # Install without the fuss of typing.		      #
#alias search='apt-cache search '		   # Easily search Apt for packages			      #
#alias lsn='sudo synaptic'			   # Launch synaptic quickly				      #
#alias ninpwn='sudo chown -Rv ninjitsu:ninjitsu '  # chown recursinvely as ninjitsu:ninjitsu 		      #
#alias supwn='sudo chown -Rv root:root '	   # chown recursinvely as root:root	 		      #    
#alias btrefresh='sudo systemctl stop bluetooth;
#                 sudo systemctl start bluetooth;
#                 sudo systemctl status bluetooth;
#                 sudo btman;' 			   # Repair Bluetooth					      #
#alias reupbt='sudo apt install bluetooth

#bluez blueman -y;'				   # Reinstall BT Components      			      #
#alias btrefresh='sudo systemctl stop bluetooth;
#                 sudo systemctl start bluetooth;
#                 sudo systemctl status bluetooth;
#                 sudo btman;' 			   # Repair Bluetooth					      #
#alias btreinstall='sudo apt install bluetooth
#bluez blueman -y;'				   # Reinstall BT Components				      #
#alias apthist='grep "install " /var/log/dpkg.log' # Read the Package Log for Apt			      #
#alias fixapt='sudo apt -yf install'	           # fix apt quick n easy				      #
#alias fixdpkg='sudo dpkg --configure -a'	   # repair dpkg					      #
###############################################################################################################

###############################################################################################################
# Arch Linux: Default Aliases                      # Targeted for Arch Linux Based OS'es           	      #
###############################################################################################################                                                                                         
#alias i='sudo pacman -S '                         # Install a package with Pacman                	      #
#alias cp="cp -i"                                  # confirm before overwriting something          	      #
#alias df='df -h'                                  # human-readable sizes                          	      #
#alias free='free -g'				   # free size in GB					      #
#alias free='free -m'                              # show sizes in MB                              	      #
#alias np='nano -w PKGBUILD'                       # nano with PKGBUILD                            	      #      
#alias more=less                                   # 'more' == 'less' pager                        	      #
###############################################################################################################

###############################################################################################################
# Arch Linux: Alias' Ad-Ons     									      #
###############################################################################################################
#alias p='sudo pacman -Syyu'                       # Update/Upgrade Pacman & Sync	                      #
#alias i='sudo pacman -S '                         # Install a package with Pacman                	      #
#alias mk='makepkg --noconfirm -Ssci '		   # Build packages from source without a bother  	      #
###############################################################################################################

###############################################################################################################
# Bourne Again Shell (B.A.S.H.): Essentials        #           (For Any Nix Box w/BASH)            	      #
###############################################################################################################
alias l='ls -hla'                                  # List all files:					      #
				                   # (incl hidden)					      #
		                                   #  &							      #
		                                   # human-readable size				      #
                                                   # formatting						      #
alias tx='tmux new -s Multiplex-1'		   # start a new tmux session named 'multiplex'	              #
alias tx='tmux new -s Multiplex-2'	 	   # start a new tmux session named 'multiplex'	              #
alias tx='tmux new -s Multiplex-3'		   # start a new tmux session named 'multiplex'	              #
alias sun='su ninjitsu'				   # switch to ninjitsu					      #
alias susu='sudo su'				   # switch to root					      #
alias mntexthdd='ntfs-3g -o rw /dev/sdd /home/ninjitsu/media/3TB'					      #
alias ntfs3g='sudo ntfs-3g -o rw '		   # Types half of the command for you for ntfs-3g mounts     #
						   # Just specify block device then mount point.	      #
###############################################################################################################

###############################################################################################################
# .bashrc: Special Addition(s)			   #	   For your bashrc pleasure  			      #
###############################################################################################################
alias e='sudo gedit /home/ninjitsu/.bashrc'        #	< << Quick & Dirty Edit for>> > 		      #
#						   #	          (THIS) 				      #
#						   # 		 '.bashrc'			 	      #
#						   #		   File					      #
###############################################################################################################

###############################################################################################################
# Custom Essentials: Aliases for most Linux(es)	   #     		(For Any Nix Box) 	              #
###############################################################################################################
#(0)#													      #
#													      #
alias s0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak;	
	  echo  "The suctl nullification phase is now complete."'					      #
#													      #												
#(1)#													      #
#													      #
alias s1='sudo cp -vr /etc/sudoers /etc/sudoers.bak;sudo cp -vr /etc/sudoers /etc/sudoers.tmp;     	     
gedit /etc/sudoers.tmp'		    								    	      #
													      #
#													      #
#(2)#													      #
#													      #
alias s2='sudo cp -vr /etc/sudoers /etc/sudoers.bak;
	  sudo cp -vr /etc/sudoers /etc/sudoers.tmp;							
          sudo gedit /etc/sudoers.tmp;
	  echo  "--- Phase 1: sudoers-configuration has completed. ---";
 	  sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
	  echo  "--- Phase 2: sudoers-configuration has Completed. ---"'
#													      #
#(3)#													      #
#													      #
alias s3='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'		      #									    	
#-------------------------------------------------------------------------------------------------------------#
# Here, we have the same cmds in a human-comprehensable 'cmdlet-style' contextual nomenclature	              #												         													              #
#										                              #
##													      #
#(0)#													      #
##												              #
#													      #
alias sucfg-0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak;
               echo  "The suctl nullification phase is now complete."'												
#										                              #
##													      #
#(1)#													      #
##												              #
#													      #
alias sucfg-cp='sudo cp -vr /etc/sudoers /etc/sudoers.bak;sudo cp -vr /etc/sudoers /etc/sudoers.tmp;
          	sudo gedit /etc/sudoers.tmp;
	  	echo  "--- Phase 1: sudoers-configuration has completed. ---";
 	  	sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
	  	echo  "--- sucfg Phase 2 Completed. ---"'
#										                              #
##													      #
#(2)#													      #
##												              #
#													      #
alias sucfg-fi='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'	      #    													
#-------------------------------------------------------------------------------------------------------------#
# I designed a short group of aliases named sucfg, short for sudoers configuration...			      #
# It is designed to protect against errors that may happen when directly editing the sudoers                  #
# file. I have been using nano directly on it for quite some time now, but know that's dangerous	      #
# I don't like to use visudo. I find Vim atrocious to use. I designed this alternative to be a better         #
# solution. Hopefully, for you too, this can be that. Cheers and have fun!!!				      #
#													      #
#	 				Welcome to sucfg!!!						      #
#													      #
#				  	   Please Read:							      #
#													      #
# (0) - sucfg-0 - Clears previous sudoers.tmp and sudoers.bak files - BE CAUTIOUS WITH THIS!!!	              #
# (1) - sucfg-cp - (short for sudoers configuration copy):					              #
#       This cmd copies the original /etc/sudoers file to two files:			                      #
#	* /etc/sudoers.bak									              #
#		 &										              #
#	* /etc/sudoers.tmp									              #
#							 					              #
#	It then opens the new /etc/sudoers.tmp file for editing with gedit.			              #
# (2) - sucfg-fi - (short for sudoers configuration finalization) - Copies your freshly edited                # 
#       /etc/sudoers.tmp file to the real /etc/sudoers file.	 				              #    
###############################################################################################################
# System Aliases:				# These Make your BASH shell & Software Experience Nice       #
###############################################################################################################
alias c='rsync --info=progress2 -avz '          # copy src to dir w/progress bar verbosely      	      #
alias r='rm -rvf '                              # remove dir or file(s) recursive/verbose(ly)   	      #
alias mdir='mkdir -vp '                         # mkdir w/parents verbosely                     	      #
alias t='touch '                                # touch a file without typing touch             	      #
alias c='rsync --info=progress2 -avz '          # copy src to dir w/progress bar verbosely     		      #
alias sc='sudo rsync --info=progress2 -avz '    # copy src to dir w/progress bar verbosely     	 	      # 
alias mpar='mkdir -vp '                         # mkdir w/parents verbosely                     	      #
alias t='touch '                                # touch a file without typing touch             	      #
alias cdsu='cd /etc/sudoers.d/;			
sudo ls -l'			                # enter the sudoers.d directory				      #
alias restart='sudo reboot'                     # reboot or restart, doesn't matter			      #
###############################################################################################################

###############################################################################################################
# Software Aliases:				# Adding Cushion to your Fingers			      #
###############################################################################################################
# Downloads & extracts audio from YouTube and converts it into mp3 format.				      #
alias y='youtube-dl -x --audio-format=mp3 '     # download audio mp3 from youtube link         		      #
# Test out the aria2c downloader with youtube-dl:							      #
alias ytest='youtube-dl -x --audio-format=mp3 --external-downloader aria2c '				      #
alias gc='sudo grub-customizer'			# Launch Grub-Customizer				      #
###############################################################################################################

###############################################################################################################
# Special Thanks: To all you Linux users, developers, & hackers,					      #
# without which, Linux, in all its complexity and awe would not be possible,				      #
# be free, inspire others, or even exist at all.					        	      #
###############################################################################################################
#   By: Ninjitsu          |_______|_____________________________|_______________________________|	      #
#    - a.k.a.- 		  |			|				|			      #
# Joel Matthew Grant      |===================================================================================#
# Email: refract@pm.me	  |	  |				|				|	      #
###############################################################################################################

###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
# Pro-Tip: (kinda risky, but handy): I suggest you delete your root's .bashrc and hard-link your	      #
# administrative account's .bashrc where the root's used to be. This way you only have to update one	      #
# .bashrc file and thanks to these aliases, it's super easy. Stay fresh!    = )    = )    = )    = )          #
# Example Command: sudo rm -vf /root/.bashrc; sudo ln -v /home/ninjitsu/.bashrc /root/.bashrc		      #
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################

###############################################################################################################
#-------------------------------------------------------------------------------------------------------------#
# 01001010 01101111 01100101 01101100 00100000 01001101 01100001 01110100 01110100 01101000 01100101	      #
# 			01110111 00100000 01000111 01110010 01100001 01101110 01110100			      #
#-------------------------------------------------------------------------------------------------------------#
###############################################################################################################
# Alias definitions.											      #
# You may want to put all your additions into a separate file like					      #
# ~/.bash_aliases, instead of adding them here directly.						      #
# See /usr/share/doc/bash-doc/examples in the bash-doc package.						      #
###############################################################################################################
