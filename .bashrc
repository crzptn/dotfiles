# .bashrc

# install gnu stow automatically
command -v stow >/dev/null 2>&1 || {
  if command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y stow
  elif command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y stow
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm stow
  fi
}

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

PATH="/opt/DB Pro/:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


export MANPAGER="nvim +Man!"
# export MANWIDTH=999
export EDITOR=nvim

export PATH="$HOME/bin:$PATH"
export HISTCONTROL="erasedups"

# aliases
alias vim='nvim'
alias htop='btop'
alias la='ls -a'
alias l='ls'
alias open="xdg-open"
alias trash="gio trash"
alias tx="tmux"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"


# goenv
export goenv_root="$HOME/.goenv"
export PATH="$goenv_root/bin:$PATH"
eval "$(goenv init -)"

. "$HOME/.cargo/env"

export PATH="$HOME/dotfiles/dmenu/scripts:$PATH"


# keys

# opencode
export PATH=/home/xn/.opencode/bin:$PATH

#dmenu scripts
export PATH="$HOME/.dmenu/scripts/:$PATH"


# android
export ANDROID_HOME=$HOME/android 
export ANDROID_AVD_HOME=$HOME/.android/avd 
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin 
export PATH=$PATH:$ANDROID_HOME/platform-tools 
export PATH=$PATH:$ANDROID_HOME/emulator
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

