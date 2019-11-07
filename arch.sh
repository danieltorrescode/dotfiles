#Set the keyboard layout
#The default console keymap is US. Available layouts can be listed with: 
ls /usr/share/kbd/keymaps/**/*.map.gz

#To modify the layout
loadkeys es

#Verify the boot mode
ls /sys/firmware/efi/efivars
#If the directory does not exist, the system may be booted in BIOS

#test internet conection
ping 8.8.8.8

#Update the system clock
timedatectl set-ntp true
# To check the service status, use 
timedatectl status

# Partition the disks
fdisk -l
fdisk /dev/sdb

# give linux solaris type to the swap partition. value 82
# Format the partitions
mkfs.ext4 /dev/sdb6
mkfs.ext4 /dev/sdb7

# for swap
mkswap /dev/sdb5
swapon /dev/sdb5

# after the partition
mount /dev/sdb6 /mnt
mkdir /mnt/home
mount /dev/sdb7 /mnt/home

# detect mounted file systems and swap space with
genfstab 

# Select the mirrors
/etc/pacman.d/mirrorlist

# Install essential packages
pacstrap /mnt base linux linux-firmware

# Generate an fstab file
genfstab -U /mnt >> /mnt/etc/fstab
# Check the resulting /mnt/etc/fstab

# Change root into the new system: 
arch-chroot /mnt

# Installing tools and apps
pacman -Syu
pacman -S vim wget git dhcpcd sudo grub pkg-config
pacman -S alsa-utils pulseaudio
pacman -S i3-wm i3blocks i3locks compton 
pacman -S screen ranger feh
pacman -S git xorg xorg-xinit
pacman -S firefox surf

# Set the time zone: 
ln -sf /usr/share/zoneinfo/America/Caracas /etc/localtime

# to generate /etc/adjtime
hwclock --systohc

# Localization Uncomment 
# en_US.UTF-8 UTF-8 
# es_VE.UTF-8 UTF-8 and other needed at
/etc/locale.gen
# and generate them with: 
locale-gen

# Create the locale.conf(5) file, and set the LANG
/etc/locale.conf
# add
LANG=es_VE.UTF-8 

#  set the keyboard layout
/etc/vconsole.conf
KEYMAP=es

# set layout  
sudo localectl set-x11-keymap es

# Network configuration
/etc/hostname
arch

# enable dhcpcd
systemctl enable dhcpcd

# Add matching entries to hosts(5)
/etc/hosts

127.0.0.1	localhost
::1		localhost
127.0.1.1	arch.localdomain	arch

#  Set the root password
passwd

# add new user

useradd -m daniel
passwd daniel

# set group
usermod -aG wheel,audio,video,optical,storage daniel
groups daniel

# Uncomment to allow members of group wheel 
# to execute any command /etc/sudoers
%wheel ALL=(ALL) ALL

# Boot loader grub
grub-install /dev/sdb
# Use the grub-mkconfig tool to generate /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg

# Reboot
umount -R /mnt

# PC disable speaker
rmmod pcspkr
# edit /etc/modprobe.d/nobeep.conf to make the change permanet
# add the next line if file dont exits create it
blacklist pcspkr

# use alsamixer to set the volumen value
alsamixer


echo "###########################################"
echo "updating repositories and installing essentials"
echo "###########################################"
pacman -Syu
aptitude install -y git screen curl htop wget ranger
aptitude install -y vim vim-syntastic vim-snippets vim-youcompleteme
aptitude install -y emacs emacs emacs-goodies-el
aptitude install -y ufw gufw firejail apparmor
aptitude install -y i3-wm i3blocks i3lock
aptitude install -y compton dmenu feh arandr playerctl pavucontrol
#aptitude install -y qemu qemu-kvm docker.io docker-compose lxc
aptitude install -y python-pip python3-pip virtualenv
aptitude install -y surf tabbed
echo "###########################################"
echo "changing user and coping config files"
echo "###########################################"

su daniel -c "cp -r ~/.config/i3/ ~/.config.backup/"
su daniel -c "ranger --copy-config=all"
su daniel -c "cp -r dotfiles/.config /home/daniel/"
su daniel -c "cp -r dotfiles/.vifm /home/daniel/"
su daniel -c "cat dotfiles/.vimrc >> /home/daniel/"
su daniel -c "cat dotfiles/.vimrc-plugins >> /home/daniel/"
su daniel -c "cat dotfiles/.bashrc >> /home/daniel/.bashrc"
su daniel -c "cat dotfiles/.bash_history >> /home/daniel/.bash_history"

echo "###########################################"
echo "cloning .emacs.d config"
echo "###########################################"

su daniel -c "git clone https://gitlab.com/danieltorresgitlab/emacs.git"
su daniel -c "cp -r emacs/ /home/daniel/.emacs.d/"

echo "###########################################"
echo "cloning and installing st"
echo "###########################################"
url=""
read -p "enter st url: " url
echo $url
su daniel -c "git clone $url"

# read -p "enter patch url: " url
# echo $url
# su daniel -c "wget -P patches $url"

# read -p "enter patch name: " patch
# echo $patch
# su daniel -c "patch -d st/ < patches/$patch"

# su daniel -c "make -C st/"
# make -C st/ clean install

# to add color to st use http://terminal.sexy/

