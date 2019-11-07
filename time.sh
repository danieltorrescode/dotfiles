#!/bin/bash
# disable time automatic synchronization
timedatectl set-ntp 0
timedatectl set-timezone UTC
timedatectl set-local-rtc 0
# set date and time with: 
# timedatectl set-time '2015-11-20 16:14:50'
timedatectl status
# set hardware clock from system clock
hwclock --systohc
# read hardware clock
hwclock --show
