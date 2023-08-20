#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# . /etc/X11/Xsession

# Load Xresource file
xrdb -remove *
xrdb ~/.Xresources

# disable motherboard speaker
xset -b

# set international english keyboard
setxkbmap us -variant intl

numlockx &
sleep 2
xrandr -s 1920x1080

WM="bspwm"

case $WM in
    "bspwm")
        exec $WM
        ;;
    "emacs")
        # setting wallpaper
        feh --bg-scale ~/Downloads/Wallpapers/wallpaper.png &

        picom --config ~/.config/picom/picom.conf &

        xsetroot -cursor_name left_ptr

        ~/.config/polybar/launch.sh &
        exec emacs
        ;;
esac

# starting window manager
while true; do
    exec /usr/local/bin/$WM 2> /dev/null
done

