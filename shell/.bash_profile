# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/scripts/"
export VISUAL=vim
export EDITOR="$VISUAL"
export TERMINAL="alacritty"
export GDK_DPI_SCALE=1.2
export STARSHIP_CONFIG=~/.config/starship/starship.toml
SERVER="sway"
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    case $SERVER in
        "wayland")
            Hyprland
            ;;
        "sway")
            exec sway
            ;;
        "xorg")
            exec startx
            ;;
    esac
fi

