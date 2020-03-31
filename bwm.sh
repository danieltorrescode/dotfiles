#!/bin/bash
echo "###########################################" 
echo "cloning and building bspwm" 
echo "###########################################" 
bspwm=`ls | grep bspwm`
if [ $bspwm ]
then
    echo "bspwm already exist in directory"
else
    su daniel -c "git clone https://github.com/baskerville/bspwm"
fi

make -C bspwm/

echo "###########################################" 
echo "cloning and building sxhkd" 
echo "###########################################" 
sxhkd=`ls | grep sxhkd`
if [ $sxhkd ]
then
    echo "sxhkd already exist in directory"
else
    su daniel -c "git clone https://github.com/baskerville/sxhkd"
fi

make -C sxhkd/

su daniel -c "chmod +x /home/daniel/.config/bspwm/bspwmrc"
su daniel -c "chmod +x /home/daniel/.config/sxhkd/sxhkdrc"

bash panel.sh