###############################################################################################################
#[+]WSL(v2): <  < << - BlackArch Linux __- >> >   >WSL(v2):[-]       o . O . o . o . o . o   	              #
###############################################################################################################
alias cp="cp -i"                                  # confirm before overwriting something                      #
alias df='df -h'                                  # human-readable sizes                                      #
alias free='free -g'                              # free size in GB                       		      #
alias free='free -m'                              # show sizes in MB                                          #
alias np='nano -w PKGBUILD'                       # nano with PKGBUILD                                        #
alias more=less                                   # 'more' == 'less' pager                                    #
###############################################################################################################
                                                                                                                                                                                                                                   
																												   
																												   
###############################################################################################################
# >_< < _ > . o . < . < . ]|[ WSL (v2) BlackArch Linux ]|[ - = -  >>>  -   >>  >  >>    >       >>     > >>>  #                                                                                                                    
###############################################################################################################
# Install a package with Pacman
alias I='sudo pacman -S '
# Search for packages
alias S='sudo pacman -Ss '
# Build packages from source
alias mk='makepkg --noconfirm -si '
# Build packages from source a different way
alias MK='makepkg --noconfirm -Ssci '
# Update/Upgrade Pacman & Sync
alias uu='sudo pacman -Syyu --force'
# Remove the lock from pacman
alias ul='sudo rm /var/lib/pacman/db.lck'
# Fix problems with GPG keys
alias fixgpg='I gpgme archlinux-keyring; pacman-key --init; pacman-key --populate;
pacman-key --refresh-keys; gpg --refresh-keys; pacman -Syyu --needed'
# Remove packages without the fuss of typing
alias R='sudo pacman -R '
# Install from a local file (packagename.tar.gz)
alias IL='sudo pacman -U '
# List all installed packages
alias L='pacman -Qqe '
# Search for package file names in remote packages
alias RQ='sudo pacman -Fs '
# Display extensive information about a given package
alias PI='sudo pacman -Si package_name '
# Display information about locally installed packages
alias LP='sudo pacman -Qi '
# Display the list of backup files and their modification states
alias LB='sudo pacman -Qii package_name '
# Retrieve a list of the files installed by a remote package
alias LR='sudo pacman -Fl '
# Verify the presence of the files installed by a package
alias VF='sudo pacman -Qk '
# Verify the presence of the files installed by a package more thoroughly
alias VFV='sudo pacman -Qkk '
# Query the database to know which package a file in the file system belongs to
alias QB='sudo pacman -Qo '
# Query the database to know which remote package a file belongs to
alias QR='sudo pacman -Fo '
# List all packages no longer required as dependencies (orphans)
alias LO='sudo pacman -Qdt '
# List all packages explicitly installed and not required as dependencies
alias LE='sudo pacman -Qet '
# To view the dependency tree of a package
alias T='sudo pactree '
# Install all of the BlackArch tools, the blackman package manager, & the BlackArch Installer
alias blackarch='pacman -S blackarch blackman blackarch-installer --needed --force'
# chown recursively as ninjitsu:ninjitsu
alias ninjpwn='sudo chown -R ninjitsu:ninjitsu '
# chown recursinvely as root:root
alias supwn='sudo chown -R root:root '
# chmod to executable
alias chx='sudo chmod +x '
# chmod to set suid bit
alias chus='sudo chmod u+s '
# cd to Ninjitsu's Downloads
alias ninjdl='cd /home/ninjitsu/Downloads'
# cd to Root's Downloads
alias sudl='sudo cd /root/Downloads'
# cd to /home/ninjitsu/GitHub/ninjitsu
alias -='cd /home/ninjitsu/GitHub/ninjitsu'
# cd to /mnt/c/Users/Ninjitsu/Music
alias +='cd /mnt/c/Users/Ninjitsu/Music'
# Simplified Pacman Frontend GTK Installer	  # Run as Ninjitsu
alias appinstall='mkdir -p /home/ninjitsu/GitHub; cd /home/ninjitsu/GitHub;
git clone https://github.com/relativerefractions/ninjitsu.git; cd ./ninjitsu;
sudo pacman -S git --needed --noconfirm; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si;
cd ..; rm -rf yay; sudo strip --remove-section=.note.ABI-tag /usr/lib64/libQt5Core.so.5;
yay -S tkpacman octopi pamac-aur trizen; sudo passwd root; echo "Mission Complete!";
echo "Run tkpacman or octopi for GTK... yay, trizen, or pamac to stay shellbound."'
#####################################################################################################################
																													
#####################################################################################################################
# Bourne Again Shell (B.A.S.H.): Essentials        #           (For Any Nix Box w/BASH)            	            #
#####################################################################################################################
# List all files (incl hidden... human-readable size formatting)                                                    #
alias l='ls -hla'								   				    #																#
alias txa='tmux new -s Multiplex-1'		   # Start a new tmux session named 'Multiplexed'         	    #
alias txb='tmux new -s Multiplex-2'	 	   # Start a new tmux session named 'Multiplexed'         	    #
alias txc='tmux new -s Multiplex-3'		   # Start a new tmux session named 'Multiplexed'         	    #
alias atta='tmux attach -t Multiplex-1'		   # Attach to Multiplex 1 session		            	    #
alias attb='tmux attach -t Multiplex-2'		   # Attach to Multiplex 1 session		            	    #
alias attc='tmux attach -t Multiplex-3'		   # Attach to Multiplex 1 session		            	    #
alias lstmux='tmux ls'				   # List existing tmux sessions		        	    #
alias sun='su ninjitsu'			           # Switch to ninjitsu					            #
alias susu='sudo su'				   # Switch to root					            #
#####################################################################################################################

#####################################################################################################################
# .bashrc: Special Addition(s)			   #	              For your bashrc pleasure  	            #
#####################################################################################################################
alias e='sudo nano /home/ninjitsu/.bashrc'         # 	           < << Quick & Dirty Edit for>> >                  #
						   #			        (THIS)            	            #
						   #	                       .bashrc  			    #
						   #			         File	                    	    #
						   #						   		    #				            						#                                      
alias eg='sudo gedit /home/ninjitsu/.bashrc'       #               < << GTK-Edit This File!!! >> >                  #
#####################################################################################################################

#####################################################################################################################
# Custom Essentials: Aliases for most Linux(es)	   #     		(For Any Nix Box) 	                    #			#
#####################################################################################################################
#(0)#													            #												#
#														    #														#
alias s0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak; echo  "The suctl nullification phase is now complete."'    #				            						
#													            #													#
#(1)#													            #												#
#													            # 													#
alias s1='sudo cp -vr /etc/sudoers /etc/sudoers.bak;
	  sudo cp -vr /etc/sudoers /etc/sudoers.tmp; gedit /etc/sudoers.tmp'		    								    	            								#
													            #													#
#													            #													#
#(2)#													            #												#
#													            #													#
alias s2="sudo cp -vr /etc/sudoers /etc/sudoers.bak; sudo cp -vr /etc/sudoers /etc/sudoers.tmp;
		  sudo gedit /etc/sudoers.tmp; echo  '--- Phase 1: sudoers-configuration has completed. ---';
		  sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
		  echo  '--- Phase 2: sudoers-configuration has Completed. ---'"  				    #
#													            #													#
#(3)#													            #												#
##													            #													#
#														    #
alias s3='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'		            #
#-------------------------------------------------------------------------------------------------------------------#
# Here, we have the same cmds in a human-comprehensable 'cmdlet-style' contextual nomenclature	                    #
#										                                    #										#
##													            #													#
#(0)#													            #												#
##												                    #												#
#													            #													#
alias sucfg-0='sudo rm -vf /etc/sudoers.tmp /etc/sudoers.bak;
               echo  "The suctl nullification phase is now complete."'						    #
#										                                    #										#
##													            #													#
#(1)#													            #												#
##												                    #												#
#													            #													#
alias sucfg-cp='sudo cp -vr /etc/sudoers /etc/sudoers.bak;sudo cp -vr /etc/sudoers /etc/sudoers.tmp;
          	sudo gedit /etc/sudoers.tmp;
	  	echo  "--- Phase 1: sudoers-configuration has completed. ---";
 	  	sudo cp -rv /etc/sudoers.tmp /etc/sudoers;
	  	echo  "--- sucfg Phase 2 Completed. ---"'							    #
#										                                    										#
##													            #													#
#(2)#													            #												#
##												                    #												#
#													            #													#
alias sucfg-fi='sudo cp -rv /etc/sudoers.tmp /etc/sudoers;  echo  "--- sucfg Phase 2 Completed. ---"'	            #
#-------------------------------------------------------------------------------------------------------------------#
# I designed a short group of aliases named sucfg, short for sudoers configuration...			            #
# It is designed to protect against errors that may happen when directly editing the sudoers                        #
# file. I have been using nano directly on it for quite some time now, but know that's dangerous	            #
# I don't like to use visudo. I find Vim atrocious to use. I designed this alternative to be a better               #
# solution. Hopefully, for you too, this can be that. Cheers and have fun!!!				            #			#
#													            #													#
#	 				Welcome to sucfg!!!						            #											#
#													            #													#
#				  	   Please Read:							            #											#
#													            #													#
# (0) - sucfg-0 - Clears previous sudoers.tmp and sudoers.bak files - BE CAUTIOUS WITH THIS!!!	                    #
# (1) - sucfg-cp - (short for sudoers configuration copy):					                    #					#
#       This cmd copies the original /etc/sudoers file to two files:			                            #			#
#	* /etc/sudoers.bak									                    #										#
#		 &										                    #													#
#	* /etc/sudoers.tmp									                    #										#
#							 					                    #												#
#	It then opens the new /etc/sudoers.tmp file for editing with gedit.			                    #				#
# (2) - sucfg-fi - (short for sudoers configuration finalization) - Copies your freshly edited               	    #
#       /etc/sudoers.tmp file to the real /etc/sudoers file.	 				                    #					#
#####################################################################################################################
# System Aliases:				# These Make your BASH shell & Software Experience Nice             #
#####################################################################################################################
alias c='rsync --info=progress2 -avz '          # copy src to dir w/progress bar verbosely      	            #
alias r='rm -rvf '                              # remove dir or file(s) recursive/verbose(ly)   	            #
alias mdir='mkdir -vp '                         # mkdir w/parents verbosely                     	            #
alias t='touch '                                # touch a file without typing touch             	            #
alias sc='sudo rsync --info=progress2 -avz '    # copy src to dir w/progress bar verbosely     	                    #
alias mpar='mkdir -vp '                         # mkdir w/parents verbosely                     	            #
alias t='touch '                                # touch a file without typing touch             	            #
alias cdsu='cd /etc/sudoers.d/;'		#								    #									#
sudo ls -l'			                # enter the sudoers.d directory			                    #
alias restart='sudo reboot'                     # reboot or restart, doesn't matter			            #			#		
alias searchalias='grep -rnIi --color '	        #                          					    #					#
alias sucaja='gksudo caja'			# run caja file explorer as root			  	    #					#
alias cajasu='gksudo caja'			# run caja file explorer as root			  	    #					#
#####################################################################################################################

#####################################################################################################################
# Software Aliases:				  #               Adding Cushion to your Fingers       		    #
#####################################################################################################################
# Changes directory to C:\Users\Ninjitsu\Music & downloads + extracts audio from YouTube + converts it into         #
# mp3 format.				      								            										#
alias y='cd "/mnt/c/Users/Ninjitsu/Music"; youtube-dl -x --audio-format=mp3 '                                       #
# Test out the aria2c downloader with youtube-dl:							            							#
alias y2='cd "/mnt/c/Users/Ninjitsu/Music"; youtube-dl -x --audio-format=mp3 --external-downloader aria2c '         #
# Launch Grub-Customizer										            										#
alias gc='sudo grub-customizer'				      	                                                    			#
# Download one track/playlist from  soundcloud                                                                      #
# Download a playlist from SoundCloud									            								#
alias dlmysc='scdl -a  --path "/mnt/c/Users/Ninjitsu/Music" --onlymp3 -l https://soundcloud.com/user2412129'        #
# Download a user's songs from SoundCloud              							            						#
alias dlusrsc='scdl -a  --path "/mnt/c/Users/Ninjitsu/Music" --onlymp3 -l '				            				#
# Download a playlist from a SoundCloud user 	   # download a playlist from a SoundCloud user	 	            #
alias dlscpl='scdl -p --path "/mnt/c/Users/Ninjitsu/Music"--onlymp3 -l '				            				#
# Download a user stream from SoundCloud 	   # download a user stream SoundCloud		            	    #
alias dlscuserstream='scdl -s --onlymp3  --path "/mnt/c/Users/Ninjitsu/Music" -l '		                    #
# Download a playlist from SoundCloud 	 	   # download user tracks SoundCloud		      	    	    #
alias dlscusertracks='scdl -t --onlymp3 --path "/mnt/c/Users/Ninjitsu/Music" -l '			      	    			#
# Download a user favs from SoundCloud 	           # download user favs from SoundCloud			      	    #
alias dlscuserfavs='scdl -f --onlymp3 --path "/mnt/c/Users/Ninjitsu/Music" -l '				      	    			#
# Download a playlist from SoundCloud 	 	   # download from user comments on SoundCloud	      	            #
alias dlscusercomments='scdl -C --onlymp3 --path "/mnt/c/Users/Ninjitsu/Music" -l '			      	    			# 
#####################################################################################################################

#####################################################################################################################
# GitHub Tricks												            											#
#####################################################################################################################
# Add commit to GitHub... enter comment and finish with "                                                           #
alias gitcommit='git init;
	         git add .;
                 git commit -m "Latest Auto-Commit < [ BlackArch Linux - WSL2 ] > .bashrc"'
# Add Commit to Relative Refractions GitHub									    #								            								#
alias gitRR='git remote add origin https://github.com/relativerefractions/ninjitsu.git;
             git pull https://github.com/relativerefractions/ninjitsu.git;
             git push -u origin master;'
# Copy latest .bashrc to .											    #										            										#
alias cpbashrc='sudo cp /home/ninjitsu/.bashrc /home/ninjitsu/GitHub/ninjitsu/BlackArch-WSL.bashrc;'
# Copy latest .bashrc to GitHub all-in-one                                                                          #
alias b2rr='sudo cp /home/ninjitsu/.bashrc /home/ninjitsu/GitHub/ninjitsu/BlackArch-WSL.bashrc;
	    cd /home/ninjitsu/GitHub/ninjitsu;
            git init;
            git add .;
            git commit -m "Latest Auto-Commit < [ BlackArch Linux - WSL2 ] > .bashrc"
            git remote add origin https://github.com/relativerefractions/ninjitsu.git;
            git pull https://github.com/relativerefractions/ninjitsu.git;
            git push -u origin master;'
# Copy BlackArch-WSL.bashrc to .bashrc                                                                              #
alias rr2b='sudo cp ./BlackArch-WSL.bashrc /home/ninjitsu/.bashrc'						    #
# Configure GitHub Login Credentials                                                                                #
alias gitcfg="git config --global credential.helper 'store --file ~/.my-credentials'"                               #
#####################################################################################################################
#Cheat and see your aliases                                                                                         #
alias cheat='less /home/ninjitsu/.bashrc'                                                                           #
#####################################################################################################################
# Special Thanks: To all you Linux users, developers, & hackers,					            					#
# without which, Linux, in all its complexity and awe would not be possible,				            			#
# be free, inspire others, or even exist at all.					        	            						#
#####################################################################################################################
#   By: Ninjitsu          |_______|_____________________________|_______________________________|	            #
#    - a.k.a.- 		  |			|				|			            #											#
# Joel MatthewGrant       |=========================================================================================#
# Email: refract@pm.me	  |	  |				|				|	            										#
#####################################################################################################################

#####################################################################################################################
#-------------------------------------------------------------------------------------------------------------------#
# Pro-Tip: (kinda risky, but handy): I suggest you delete your root's .bashrc and hard-link your	            #
# administrative account's .bashrc where the root's used to be. This way you only have to update one	            #
# .bashrc file and thanks to these aliases, it's super easy. Stay fresh!    = )    = )    = )    = )                #
# Example Command: sudo rm -vf /root/.bashrc; sudo ln -v /home/ninjitsu/.bashrc /root/.bashrc		            #
#-------------------------------------------------------------------------------------------------------------------#
#####################################################################################################################

#####################################################################################################################
#-------------------------------------------------------------------------------------------------------------------#
# 01001010 01101111 01100101 01101100 00100000 01001101 01100001 01110100 01110100 01101000 01100101	            #
# 			01110111 00100000 01000111 01110010 01100001 01101110 01110100			                                #
#-------------------------------------------------------------------------------------------------------------------#
#####################################################################################################################
# Alias definitions.											            											#
# You may want to put all your additions into a separate file like					            					#
# ~/.bash_aliases, instead of adding them here directly.						            						#
# See /usr/share/doc/bash-doc/examples in the bash-doc package.						            					#
#####################################################################################################################
