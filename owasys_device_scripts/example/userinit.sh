#! /bin/sh                                                                                               
# /etc/userinit.sh                                                                                       
# Automatic execution of owastart.sh from the SD card,                                                   
# this can be used to automatically copy the user                                                        
# application files to /home using a SD card in a                                                        
# new device.                                                                                            
# CYA 000_0352                                                                                           
# Version R1B                                                                                            
#                                                                                                        
                                                                                                         
/usr/sbin/mountsd                                                                                        
/mnt/sd/owastart.sh                                                                                      
                                                                                                         
# Call to upgrade.sh for a possible FW upgrade                                                           
# /usr/bin/upgrade.sh                                                                                    
                                                                                                         
/usr/sbin/umountsd

cd /home/scripts
./init_libs.sh

/home/bin/dropbear &                                                                                     
cd /home                                                                                                 
./scripts/setup_wifi.sh 
 
