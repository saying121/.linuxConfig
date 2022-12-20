#! /bin/bash

if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	yay -S --needed xorg xorg-xinit xorg-server \
		i3-gaps-kde-git picom feh \
		polybar calc python-pywal \
        networkmanager-dmenu-git network-manager-applet copyq

            # networkmanager-dmenu-bluetoothfix-git
	# i3-wm
	sudo pacman -Rs i3status
fi
# 编译需要
# sudo pacman -S --need perl-anyevent perl-json perl-json-xs

mkdir -p ~/.config/systemd/user
if [[ ! -f ~/.config/systemd/user/plasma-i3.service ]]; then
	cp ~/.linuxConfig/custom-services/plasma-i3.service ~/.config/systemd/user/plasma-i3.service
fi

systemctl --user mask plasma-kwin_x11.service
sudo systemctl daemon-reload
# systemctl --user enable ~/.config/systemd/user/plasma-i3.service
systemctl --user enable plasma-i3.service
