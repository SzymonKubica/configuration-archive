
# Source manjaro-zsh-configuration
if [[ -e ~/.config/zsh/zsh-config ]]; then
  source ~/.config/zsh/zsh-config
fi

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_STATE_HOME="$HOME"/.local/state
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
# Move config files away from the home directory.
export LC_ALL="en_US.UTF-8"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export LEIN_HOME="$XDG_DATA_HOME"/lein
export WGETRC="$XDG_CONFIT_HOME/wgetrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons

# Enable and configure zsh vi mode
set -o vi
bindkey -M viins 'ii' vi-cmd-mode
bindkey "^?" backward-delete-char

alias dmenu="dmenu_run -b -q -nb '#181818' -sb '#af0000' -sf '#181818' -h 60 -fn 'JetBrains Mono Nerd Font-12'"
alias manual="~/./Projects/manual"
alias vim="nvim"
alias lock="bash ~/.local/bin/lock"
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias nf='clear; neofetch'
alias 2048='java -jar ~/Projects/Clean2048.jar'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias m='ncmpcpp'

alias ssh_login='./.ssh_login'
alias update='./.update'

[[ -s /home/szymon/.autojump/etc/profile.d/autojump.sh ]] && source /home/szymon/.autojump/etc/profile.d/autojump.sh

autoload -U compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION && compinit -u -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
export PATH


# manjaro package finders
pf() { pacman -Slq --noconfirm | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S; }

pr() { sudo pacman -Rns $(pacman -Qe | fzf -m | awk '{print $1}'); }

yf() { yay -Slq --noconfirm | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S; }

yr() { yay -Rns $(yay -Qe | fzf -m | awk '{print $1}'); }

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/p10k.zsh ]] || source ~/.config/p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

eval "$(pyenv init -)"

export PATH="$(pyenv root)/shims:$PATH"
