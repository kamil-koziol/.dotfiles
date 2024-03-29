# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Cache doesnt clutter $HOME
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Plugins https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

plugins=(
  # internal
  git 
  docker
  brew
  sudo # use esc-esc to re-enter previous command with sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

## Prompt
eval "$(starship init zsh)" # https://github.com/axieax/zsh-starship

## Fuzzy finder
eval "$(fzf --zsh)"

## Zoxide
eval "$(zoxide init zsh)"

# Aliases

alias ls="eza"
alias ll="eza -alh"
alias tree="eza --tree"

alias cat="bat"

alias cd="z"

## NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
