# dotfiles
My dotfiles and GNU-Linux settings, maintained during part of my free time, it is a work in progress.

### Instructions

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

* Partition the disks
```
  lsbk
  fdisk -l
  fdisk /dev/sdx
  partion boot = +550M
  partion swap = +2G
  partion root = +xG
  partion home = +xG
```

* clone dotfiles
```
  pacman -Sy
  pacman -S git
  git clone https://github.com/danieltorrescode/dotfiles.git
  bash dotfiles/shell/scripts/arch
  Re-start system
  Launch emacs
  Launch vim and run :PluginInstall
```

## License
GPLv3+
