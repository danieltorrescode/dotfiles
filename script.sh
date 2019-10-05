#!/bin/bash
## enter su mode
## chmod 766 script.sh
echo "###########################################" 
echo "script.sh start" 
date +'%d/%m/%Y %I:%M:%S'
echo "###########################################" 

echo "###########################################" 
echo "updating repositories and installing essentials" 
echo "###########################################" 
apt-get update
apt-get install -y aptitude
aptitude install -y git screen curl htop
aptitude install -y vim emacs emacs emacs-goodies-el
aptitude install -y ufw gufw firejail apparmor
aptitude install -y i3-wm i3blocks i3lock i3status
aptitude install -y qemu qemu-kvm docker.io docker-compose lxc 
aptitude install -y python-pip python3-pip virtualenv
echo "###########################################" 
echo "changing user and coping config files" 
echo "###########################################" 

su daniel -c "cp .vimrc /home/daniel/"
su daniel -c "cp .vimrc-plugins /home/daniel/"
su daniel -c "cp -r .config /home/daniel/"
su daniel -c "cat .bashrc >> /home/daniel/.bashrc"
su daniel -c "cat .bash_history >> /home/daniel/.bash_history"
su daniel -c "git clone https://gitlab.com/danieltorresgitlab/emacs.git"
su daniel -c "mv emacs/ /home/daniel/.emacs.d/"

echo "###########################################" 
echo "creating virtualenv for python" 
echo "###########################################" 

su daniel -c "virtualenv -p python3 /home/daniel/.venv/python"
su daniel -c "pip install --upgrade pip"
su daniel -c "virtualenv -p python3 /home/daniel/.venv/youtube-dl"
su daniel -c "pip install --upgrade pip"
su daniel -c "pip install youtube-dl"
# su daniel -c ""

echo "###########################################" 
echo "script.sh end" 
date +'%d/%m/%Y %I:%M:%S'
echo "###########################################" 