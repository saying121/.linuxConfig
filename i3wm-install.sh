#! /bin/bash

if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
sudo pacman -S xorg xorg-xinit xorg-server \
    i3-gaps
fi
