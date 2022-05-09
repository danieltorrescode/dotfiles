# dotfiles
My dotfiles and GNU-Linux settings, maintained during part of my free time, it is a work in progress.

### Instructions

* Set the console keyboard layout
```
  ls /usr/share/kbd/keymaps/**/*.map.gz |  grep us
  loadkeys us
```

* Verify the boot mode

```
  ls /sys/firmware/efi/efivars
```

* Connect to the internet
```
  ip link
  ip link set wlp2s0 up 
  iwlist  wlp2s0 scan
  wpa_passphrase "essid" "password" > /etc/wifi
  wpa_supplicant -B -i wlp2s0 -D wext -c /etc/wifi
  dhclient
  nmcli dev wifi connect "essid" password "password"
```
* Update the system clock

```
  timedatectl set-ntp true
```

* Partition the disks
```
  fdisk /dev/sdx
  partion boot = +550M
  partion swap = +2G (optional)
  partion root = +xG
  partion home = +xG
```

* Format the partitions
```
  mkfs.fat -F 32 /dev/efi_system_partition
  mkswap /dev/swap_partition
  mkfs.ext4 /dev/root_partition
  mkfs.ext4 /dev/home_partition
```

* Mount the file systems
```
  mount /dev/root_partition /mnt
  mount --mkdir /dev/home_partition /mnt/home
  mount --mkdir /dev/efi_system_partition /mnt/boot/efi
  swapon /dev/swap_partition
  lsbk
  fdisk -l
```

* Install essential packages

```
  pacstrap /mnt base linux linux-firmware vim git 
```

* Configure the system

```
  genfstab -U /mnt >> /mnt/etc/fstab
```

* Chroot

```
  arch-chroot /mnt
```

* clone dotfiles
```
  git clone https://github.com/danieltorrescode/dotfiles.git
  cd dotfiles
  stow shell config
  chmod 744 -R ~/scripts
  bash ~/scripts/essentials
  bash ~/scripts/config
  Re-start system
  Launch emacs
  Launch vim and run :PluginInstall
```

## License
GPLv3+
