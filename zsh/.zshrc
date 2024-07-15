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

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
