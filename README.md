# dotfiles

My dotfiles and GNU-Linux settings, maintained during part of my free time, it is a work in progress.

### Instructions

[Arch Linux Installation Guide](https://wiki.archlinux.org/title/Installation_guide)

- Connect to the internet
  [iwctl](https://wiki.archlinux.org/title/Iwd#iwctl)

```
  iwctl
```

- Partition the disks

```
  lsbk
  fdisk -l
  cfdisk /dev/sdx
  partion boot = +550M
  partion swap = +2G
  partion root = +xG
```

- clone dotfiles

```
  pacman -S archlinux-keyring
  pacman -Sy git vim tmux
  git clone https://github.com/danieltorrescode/dotfiles.git
  bash dotfiles/shell/scripts/arch
  reboot
  Launch emacs
```

- Post Install Config

```
 Open the crontab file for editing using the following command:
 crontab -e
 Add the following line to the file to run a command every minute:
   * * * * * /home/USER/.scripts/battery
```

- Enable AppArmor
```
 sudo aa-enforce /etc/apparmor.d/firefox
 sudo aa-enforce /etc/apparmor.d/bwrap-userns-restrict
```

## License

GPLv3+
