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
    make -C bspwm/ clean install
