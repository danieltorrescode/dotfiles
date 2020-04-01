#!/bin/bash
echo "###########################################" 
echo "cloning and building polybar" 
echo "###########################################" 

polybar=`ls | grep polybar`
if [ $polybar ]
then
    echo "polybar already exist in directory"
else
    su daniel -c "git clone https://github.com/polybar/polybar"
fi

aptitude install -y cmake cmake-data pkg-config 
aptitude install -y python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev 
aptitude install -y libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen 
aptitude install -y xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

aptitude install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev 
aptitude install -y libasound2-dev libpulse-dev libmpdclient-dev 
aptitude install -y libcurl4-openssl-dev libnl-genl-3-dev

su daniel -c "mkdir polybar/build"
su daniel -c "cmake .. --build polybar/build/"
su daniel -c "make -j$(nproc) -C polybar/build/"
make install -C polybar/build/
su daniel -c "chmod +x /home/daniel/.config/polybar/launch.sh"
