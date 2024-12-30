ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

autoload -U compinit && compinit
# Include hidden files.
_comp_options+=(globdots)

source <(starship init zsh --print-full-init)

bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=10000000
SAVEHIST=$HISTSIZE
if [ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history" ]; then 
    touch "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
fi
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ]; then 
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
fi

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile" ]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile"
fi

if [[ $(tty) == *"pts"* ]]; then
    fastfetch --config "examples/13"
fi
