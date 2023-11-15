#!/bin/bash

FORMULAES=(
    "ffmpeg" # converting images and videos
    "bat" # better cat with syntax higlighting
    "yt-dlp" # downloading youtube videos
    "starship" # prompt
)

CASKS=(
    "iterm2" # terminal
    "visual-studio-code"
    "arc" # browser
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