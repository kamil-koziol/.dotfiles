#!/bin/bash

echo "Updating system and AUR packages..."
yay -Syu --noconfirm

packages=(
    # Window Manager
    "xorg-xinit"
    "xorg-xrandr"
    "i3-wm"
    "rofi" # program select
    "polybar" # top bar
    "xcolor" # color picker
    "maim" # screenshots
    "xclip" # copy to clipboard
    "slock" # lockscreen

    # Font
    "ttf-jetbrains-mono"
    
    # Browser
    "zen-browser-bin"

    # Terminal
    "ghostty"

    # Audio
    "ncspot" # Spotify TUI

    # Shell
    "zsh"
    "zsh-autocompletions"

    # Containers
    "docker"
    "docker-compose"

    # Editor
    "neovim"

    # CLI Tools
    "stow" # dotfiles linker
    "ffmpeg" # converting images and videos
    "starship" # prompt
    "lazygit" # git
    "git-delta" # git pager
    "ripgrep" # search for strings in files
    "eza" # modern replacement for ls
    "bat" # better cat
    "fzf" # fuzzy finder
    "zoxide" # better cd
    "btop" # resource monitor
    "jq" # json pipe
    "pnpm" # Better npm
    "yazi" # file manager
    "tmux" # session manager
    "tldr" # short command examples
    "feh" # show images in terminal
    "direnv" # .env loader
    # Go
    "go"
    "goenv" # go version manager
    "gopls" # lsp
    "golangci-lint"

    # Lua
    "lua-language-server" # lsp
    "stylua" # linter and formatter

    # Python
    "uv" # python version manager
    "python-lsp-server" # lsp
    "ruff" # linter and formatter

    # Typescript && Javascript
    "nvm" # node version manager
    "typescript-language-server"
)

echo "Installing packages..."
yay -S --norebuild --noredownload --cleanafter --noconfirm "${packages[@]}" 
echo "All packages installed!"
