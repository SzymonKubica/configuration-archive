
# Source custom zsh-configuration
if [[ -e ~/.config/zsh/zsh-config ]]; then
  source ~/.config/zsh/zsh-config
fi

# Get the autosuggestions.
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export QT_QPA_PLATFORMTHEME="qt5ct"

# XDG base directory specification
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_STATE_HOME="$HOME"/.local/state

# These exports move the config and data files of programs that support XDG
# base directory specification to their corresponding places
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export LEIN_HOME="$XDG_DATA_HOME"/lein
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable and configure zsh vi mode.
set -o vi
bindkey -M viins 'ii' vi-cmd-mode
bindkey "^?" backward-delete-char # Allows for deleting characters

alias dmenu="dmenu_run -b -q -nb '#181818' -sb '#af0000' -sf '#181818' -h 60 -fn 'JetBrains Mono Nerd Font-12'"
alias manual="~/./Projects/manual"
alias vim="nvim"
alias lock="bash ~/.local/bin/lock"
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias nf='clear; neofetch'
alias start='~/.config/sway/autospawn.sh'
alias 2048='java -jar ~/Projects/Clean2048.jar'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias tmux="TERM=screen-256color-bce tmux"
alias m='ncmpcpp'

# Configure autojump
[[ -s /home/szymon/.autojump/etc/profile.d/autojump.sh ]] && source /home/szymon/.autojump/etc/profile.d/autojump.sh

autoload -U compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION && compinit -u -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
# Add solana support
PATH="/home/szymon/.local/share/solana/install/active_release/bin:$PATH"
export PATH

# Arch and AUR package finders
pf() { pacman -Slq --noconfirm | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S; }
pr() { sudo pacman -Rns $(pacman -Qe | fzf -m | awk '{print $1}'); }
yf() { yay -Slq --noconfirm | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S; }
yr() { yay -Rns $(yay -Qe | fzf -m | awk '{print $1}'); }


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/p10k.zsh ]] || source ~/.config/p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

eval "$(pyenv init -)"

export PATH="$(pyenv root)/shims:$PATH"

# Configures lua lsp.
alias luamake=/home/szymon/.config/lsp/lua-language-server/3rd/luamake/luamake
export PATH="${HOME}/.config/lsp/lua-language-server/bin:${PATH}"

# Created by `pipx` on 2023-01-16 11:12:46
export PATH="$PATH:/home/szymon/.local/bin"
