#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession


# setting wallpaper
feh --bg-scale ~/.config/wallpaper.png

# starting compton
compton --config ~/.config/compton/compton.conf &

# dwm status bar
dte(){
    dte="$(date '+%d-%m-%Y %I:%M:%S')"
    echo "$dte"
}

keysindicator(){
    CAPS_STATUS=`xset q | grep -i caps | cut -c 22-24`
    STATUS="Caps:$CAPS_STATUS"

    NUM_STATUS=`xset q | grep -i caps | cut -c 46-48`
    STATUS="$STATUS | Num:$NUM_STATUS"
    echo "$STATUS"
}

while true; do
    xsetroot -name "$(dte) | $(keysindicator)"
    sleep 1s # Update time every ten seconds
done &

# starting dwm
while true; do
    exec /usr/local/bin/dwm 2> /dev/null
done
# starting i3
# exec /usr/bin/i3