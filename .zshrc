source $HOME/.zprofile

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx &>/dev/null
fi

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%F{160}%n%f in %F{204}%~%f
%b$ "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to cd

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

run_lfcd_widget() {
    zle reset-prompt
    lfcd
    zle reset-prompt
}

zle -N run_lfcd_widget
bindkey '^o' run_lfcd_widget

# Aliases

#alias nvim='nvim --listen /tmp/nvim-server-$(tmux display-message -p "\#{session_id}-#{window_id}-#{pane_id}").pipe'

alias tms="$HOME/.local/bin/tmux-sessionizer"

# Fuzzy finder
eval "$(fzf --zsh)"

# NVM
source /usr/share/nvm/init-nvm.sh

# Direnv
eval "$(direnv hook zsh)"

