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

# xsetroot -cursor_name left_ptr

exec bspwm

