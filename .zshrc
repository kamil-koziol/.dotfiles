# Start i3
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx &>/dev/null
fi

# Aliases
alias ls="eza"
alias ll="eza -alh"
alias tree="eza --tree"

alias cat="bat"

alias cd="z"

alias nvim='nvim --listen /tmp/nvim-server-$(tmux display-message -p "\#{session_id}-#{window_id}-#{pane_id}").pipe'
export EDITOR=nvim

## Starship
eval "$(starship init zsh)" # https://github.com/axieax/zsh-starship

## Fuzzy finder
eval "$(fzf --zsh)"

## Zoxide
eval "$(zoxide init zsh)"

## NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# fix tmux colors
alias tmux="TERM=xterm-256color tmux"

# Autocomplete
autoload -Uz compinit
compinit
