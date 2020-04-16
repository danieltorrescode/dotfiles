#!/bin/bash
echo "###########################################" 
echo "installing containers and virtual machine tools" 
echo "###########################################" 

aptitude install -y qemu qemu-kvm docker.io docker-compose  
#aptitude install -y ufw gufw firejail apparmor lxc
#aptitude install -y i3-wm i3blocks i3lock 

