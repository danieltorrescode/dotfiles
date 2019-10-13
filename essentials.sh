#!/bin/bash
echo "###########################################" 
echo "updating repositories and installing essentials" 
echo "###########################################" 
apt-get update
apt-get install -y aptitude
aptitude install -y git screen curl htop wget ranger
aptitude install -y vim vim-syntastic vim-snippets vim-youcompleteme
aptitude install -y emacs emacs emacs-goodies-el
aptitude install -y ufw gufw firejail apparmor
aptitude install -y i3-wm i3blocks i3lock 
aptitude install -y compton dmenu feh arandr playerctl pavucontrol
#aptitude install -y qemu qemu-kvm docker.io docker-compose lxc 
aptitude install -y python-pip python3-pip virtualenv
aptitude install -y surf tabbed
echo "###########################################" 
echo "changing user and coping config files" 
echo "###########################################" 

su daniel -c "cp -r ~/.config/i3/ ~/.config.backup/"
su daniel -c "ranger --copy-config=all"
su daniel -c "cp -r dotfiles/.config /home/daniel/"
su daniel -c "cp -r dotfiles/.vifm /home/daniel/"
su daniel -c "cat dotfiles/.vimrc >> /home/daniel/"
su daniel -c "cat dotfiles/.vimrc-plugins >> /home/daniel/"
su daniel -c "cat dotfiles/.bashrc >> /home/daniel/.bashrc"
su daniel -c "cat dotfiles/.bash_history >> /home/daniel/.bash_history"

echo "###########################################" 
echo "cloning .emacs.d config" 
echo "###########################################" 

su daniel -c "git clone https://gitlab.com/danieltorresgitlab/emacs.git"
su daniel -c "cp -r emacs/ /home/daniel/.emacs.d/"

echo "###########################################" 
echo "installing firefox" 
echo "###########################################" 
tar=""
read -p "enter tar : " tar
echo $tar 
su daniel -c "tar -xvf /home/daniel/Descargas/$tar"
mv /home/daniel/Descargas/firefox/ /opt/

echo "###########################################" 
echo "cloning and installing st" 
echo "###########################################" 
url=""
read -p "enter st url: " url
echo $url 
su daniel -c "git clone $url"

# read -p "enter patch url: " url
# echo $url 
# su daniel -c "wget -P patches $url"

# read -p "enter patch name: " patch
# echo $patch 
# su daniel -c "patch -d st/ < patches/$patch"

# su daniel -c "make -C st/" 
# make -C st/ clean install

# to add color to st use http://terminal.sexy/
# generate palette and edit st/config.def.h and rebuild the 