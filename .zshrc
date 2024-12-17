# Aliases
alias ls="eza"
alias ll="eza -alh"
alias tree="eza --tree"

alias cat="bat"

alias cd="z"

## Starship
eval "$(starship init zsh)" # https://github.com/axieax/zsh-starship

## Fuzzy finder
eval "$(fzf --zsh)"

## Zoxide
eval "$(zoxide init zsh)"



## NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rustup
export PATH="/usr/local/opt/rustup/bin:$PATH"
