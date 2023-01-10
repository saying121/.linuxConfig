#!/bin/bash

if [[ ! -d ~/.config/systemd/user ]]; then
	mkdir -p ~/.config/systemd/user
fi
if [[ ! -f ~/.config/systemd/user/plasma-i3.service ]]; then
	cp ~/.linuxConfig/custom-services/plasma-i3.service ~/.config/systemd/user/plasma-i3.service
fi

systemctl --user mask plasma-kwin_x11.service
sudo systemctl daemon-reload
# systemctl --user enable ~/.config/systemd/user/plasma-i3.service
systemctl --user enable plasma-i3.service

~/.local/bin/konsave -i ~/.linuxConfig/kde/kdei3.knsv
~/.local/bin/konsave -a kdei3
