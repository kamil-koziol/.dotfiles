# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Plugins https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

plugins=(
  # internal
  git 
  docker
  brew
  sudo # use esc-esc to re-enter previous command with sudo
  web-search

  # external
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions/
)

source $ZSH/oh-my-zsh.sh

# User configuration

## Prompt
eval "$(starship init zsh)" # https://github.com/axieax/zsh-starship