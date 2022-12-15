#! /bin/bash

# 截图
if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	sudo pacman -S --need maim dunst viewnior
fi
if [[ $(grep -c debian /etc/os-release) != 0 ]]; then
	sudo sudo apt install maim dunst viewnior
fi
# rofi theme
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..
rm -rf rofi