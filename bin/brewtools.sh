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
    "pyenv"
    "nvm"
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

for formula in ${FORMULAES[@]}
do
    brew install $formula
done

for cask in ${CASKS[@]}
do
    brew install $cask --cask
done
