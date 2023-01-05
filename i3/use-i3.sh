#!/bin/bash

# 应用另一个kde配置
~/.local/bin/konsave -i ~/.linuxConfig/i3/kde+i3wm.knsv
~/.local/bin/konsave -a ~/.linuxConfig/i3/kde+i3wm.knsv

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
