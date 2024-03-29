#!/bin/bash

FORMULAES=(
    "ffmpeg" # converting images and videos
    "yt-dlp" # downloading youtube videos
    "starship" # prompt
    "jesseduffield/lazygit/lazygit" # git
    "ripgrep" # search for strings in files
    "neovim" # editor
    "stow" # dotfiles linker
    "eza" # modern replacement for ls
    "bat" # better cat
    "fzf" # fuzzy finder
    "zoxide" # better cd
    "btop" # resource monitor
    "jq" # json pipe
    "nvm" # Managing Node versions
)

CASKS=(
    "alacritty" # terminal
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
