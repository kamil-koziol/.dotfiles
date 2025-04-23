#!/bin/bash

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "Yay not found, installing yay..."

    # Install yay dependencies and yay itself
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "Yay is already installed."
fi
