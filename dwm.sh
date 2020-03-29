#!/bin/bash
echo "###########################################" 
echo "cloning and building dwm" 
echo "###########################################" 
dwm=`ls | grep dwm`
if [ $dwm ]
then
    echo "dwm already exist in directory"
else
    su daniel -c "git clone https://gitlab.com/danieltorresgitlab/dwm.git"
    su daniel -c "git --git-dir dwm/.git/ checkout custom"    
fi
rm dwm/config.h
make -C dwm/
make -C dwm/ clean install
