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
    "pnpm" # Better npm
    "gh" # Github CLI
    "rustup"
    "docker"
    "docker-compose"
    "colima" # docker machine
    "mkcert" # make localhost as trusted CA
    "postgresql@16" # postgres
    "llvm" # debugging rust
    "pandoc" # for generating pdfs from markdown
)

CASKS=(
    "discord"
    "alacritty" # terminal
    "obsidian" # notes
    "figma" # design
    "zed" # editor
    "thunderbird" # mail
    "brave-browser" # browser
    "bitwarden" # password manager
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
