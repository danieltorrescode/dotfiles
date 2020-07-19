#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

# Load Xresource file
xrdb -remove *
xrdb ~/.Xresources

WM="dwm"

case $WM in
    "bspwm")
        echo $WM
        ;;
    "emacs")
        exec emacs
        ;;
    "dwm")
        # setting wallpaper
        feh --bg-scale ~/.config/wallpaper.png

        # starting compton
        compton --config ~/.config/compton/compton.conf &

        while true; do
            xsetroot -name "$(info)"
            sleep 1s # Update time every ten seconds
        done &
        ;;
    "i3")
        exec /usr/bin/i3
        ;;
esac

# starting window manager
while true; do
    exec /usr/local/bin/$WM 2> /dev/null
done

