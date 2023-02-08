#!/bin/bash

if [[ $(grep -c SigLevel /etc/pacman.conf) != 0 ]]; then
	sudo powerpill -S --needed --noconfirm grub-customizer hwinfo
else
	sudo pacman -S --needed --noconfirm grub-customizer hwinfo
fi

cd ~/.linuxConfig/xenlism-grub-4k-kali && su - root -c $(pwd)"/install.sh"
