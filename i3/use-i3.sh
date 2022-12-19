#! /bin/bash

if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	sudo pacman -S --needed xorg xorg-xinit xorg-server \
		i3-gaps polybar picom feh
    sudo pacman -Rs i3status
fi

mkdir -p ~/.config/systemd/user
if [[ ! -f ~/.config/systemd/user/plasma-i3.service ]]; then
	cp ~/.linuxConfig/custom-services/plasma-i3.service ~/.config/systemd/user/plasma-i3.service
fi



systemctl --user mask plasma-kwin_x11.service
sudo systemctl daemon-reload
# systemctl --user enable ~/.config/systemd/user/plasma-i3.service
systemctl --user enable plasma-i3.service
