# dotfiles
My dotfiles and GNU-Linux settings, maintained during part of my free time, it is a work in progress.

### Instructions
- `apt update && apt upgrade -y`
- `apt install aptitude -y`
- `aptitude install git stow -y`
- `git clone https://github.com/danieltorrescode/dotfiles.git`
- `cd dotfiles`
- `stow shell config`
- `chmod 744 -R ~/scripts`
- `bash ~/scripts/config`
- `bash ~/scripts/essentials`
- Re-start system
- Launch emacs
- Launch vim and run :PluginInstall

## License
GPLv3+
