#!/bin/bash

if [[ ! -d ~/.config/konsave ]]
then
    mkdir -p ~/.config/konsave
fi
rm ~/.config/konsave/conf.yaml
ln -s ~/.linuxConfig/kde/konsave-conf.yaml ~/.config/konsave/conf.yaml

~/.local/bin/konsave -i ~/.linuxConfig/kde/kdeConfig1.knsv

# 判断有没有touchpad
if [[ $(xinput list | grep "[tT]ouchpad" -c ) != 0 ]]; then
	# 配置触摸板
	if [[ ! -d /etc/X11/xorg.conf.d ]]; then
		sudo mkdir -p /etc/X11/xorg.conf.d/
	fi
	if [[ -f /etc/X11/xorg.conf.d/20-touchpad.conf ]]; then
		echo '已有触模板配置'
	else
		sudo cp ~/.linuxConfig/kde/20-touchpad.conf /etc/X11/xorg.conf.d/
	fi
fi
# sddm
if [[ ! -d /etc/sddm.conf.d/ ]]; then
	mkdir -p /etc/sddm.conf.d
fi
if [[ -f /etc/sddm.conf.d/kde_settings.conf ]]; then
	echo '已有sddm配置'
else
	sudo cp ~/.linuxConfig/kde/kde_settings.conf /etc/sddm.conf.d/
fi
