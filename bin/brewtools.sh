#!/bin/bash

FORMULAES=(
    "stow" # dotfiles linker
    "ffmpeg" # converting images and videos
    "yt-dlp" # downloading youtube videos
    "starship" # prompt
    "lazygit" # git
    "git-delta" # git pager
    "ripgrep" # search for strings in files
    "helix" # editor
    "eza" # modern replacement for ls
    "bat" # better cat
    "fzf" # fuzzy finder
    "zoxide" # better cd
    "btop" # resource monitor
    "jq" # json pipe
    "pnpm" # Better npm
    "rustup" # rust
    "llvm" # debugging rust
    "docker"
    "docker-compose"
    "colima" # docker machine
    "pyenv" # python version manager
    "nvm" # node version manager
    "goenv" # go version manager
    "yazi" # file manager
    "tmux" # session manager
    "tldr" # short command examples
)

CASKS=(
    "discord"
    "ghostty" # terminal
    "font-jetbrains-mono-nerd-font"
    "zen-browser" # browser
)

brew update

brew install ${FORMULAES[@]}
brew install --cask ${CASKS[@]}
