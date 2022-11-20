# dotfiles
My dotfiles and GNU-Linux settings, maintained during part of my free time, it is a work in progress.

### Instructions
[Arch Linux Installation Guide](https://wiki.archlinux.org/title/Installation_guide)

* Connect to the internet
[iwctl](https://wiki.archlinux.org/title/Iwd#iwctl)

```
  iwctl
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
  umount -R /mnt
  reboot
  Launch emacs
  Launch vim and run :PluginInstall
```

## License
GPLv3+
