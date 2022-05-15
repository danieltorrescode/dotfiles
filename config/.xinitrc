#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# . /etc/X11/Xsession

# Load Xresource file
xrdb -remove *
xrdb ~/.Xresources

WM="dwm"

case $WM in
    "bspwm")
        exec $WM
        ;;
    "emacs")
        # setting wallpaper
        feh --bg-scale ~/.config/wallpaper.png &

        # starting picom
        picom --config ~/.config/picom/picom.conf &

        xsetroot -cursor_name left_ptr

        panel | lemonbar  -B '#2f2f2f' -F '#dcdccc' &
        exec emacs
        ;;
    "dwm")
        # setting wallpaper
        feh --bg-scale ~/.config/wallpaper.png

        # starting picom
        picom --config ~/.config/picom/picom.conf &

        while true; do
            xsetroot -name "$(statusbar)"
            sleep 1s # Update time every ten seconds
        done &
        ;;
    "i3")
        exec $WM
        ;;
esac

# starting window manager
while true; do
    exec /usr/local/bin/$WM 2> /dev/null
done

