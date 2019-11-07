#!/bin/bash

echo "###########################################" 
echo "coping config files" 
echo "###########################################" 

su daniel -c "mkdir  /home/daniel/.local/share/Trash"
su daniel -c "mkdir backups/"
# generate default config files for ranger with
#su daniel -c "ranger --copy-config=all"
su daniel -c "cp /home/daniel/.vimrc backups/.vimrc"
su daniel -c "cp -r /home/daniel/.config/i3/ backups/i3/"
su daniel -c "cp -r /home/daniel/.config/vifm/ backups/vifm/"
su daniel -c "cp -r /home/daniel/.config/ranger/ backups/ranger/"
su daniel -c "cp -r /home/daniel/.bash* backups/"
su daniel -c "cp -r /home/daniel/.x* backups/"
su daniel -c "cp -Trv dotfiles/ /home/daniel/"

su daniel -c "sed -i '/daniel torres/,"\$"d' /home/daniel/.bashrc"
su daniel -c "cat dotfiles/.bashrc_tail >> /home/daniel/.bashrc"
su daniel -c "cat dotfiles/.bash_history_tail >> /home/daniel/.bash_history"

echo "###########################################"
echo "cloning .emacs.d config"
echo "###########################################"
emacs=`ls | grep emacs`
if [ $emacs ]
then
    echo "emacs already exist in directory"
else
    su daniel -c "git clone https://gitlab.com/danieltorresgitlab/emacs.git"
fi
su daniel -c "cp -r emacs/ /home/daniel/.emacs.d"

echo "###########################################" 
echo "downloading firefox" 
echo "###########################################" 
firefox=`ls | grep firefox`
if [ $firefox ]
then
    echo "firefox already exist in directory"
else
    firefox="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
    # su daniel -c "wget $firefox"
    firefox=$(ls | grep firefox)
    su daniel -c "tar -xvf $firefox"
    mv firefox/ /opt/
fi
