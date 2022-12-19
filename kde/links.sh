#!/bin/bash

# 桌面
rm -f ~/.config/plasma-localerc
ln -s ~/.linuxConfig/kde/plasma-localerc ~/.config/plasma-localerc

rm -rf ~/.config/plasma-org.kde.plasma.desktop-appletsrc
ln -s ~/.linuxConfig/kde/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc

rm ~/.config/kdeglobals
ln -s ~/.linuxConfig/kde/kdeglobals ~/.config/kdeglobals

rm ~/.config/kglobalshortcutsrc
ln -s ~/.linuxConfig/kde/kglobalshortcutsrc ~/.config/kglobalshortcutsrc

rm ~/.config/krunnerrc
ln -s ~/.linuxConfig/kde/krunnerrc ~/.config/krunnerrc

rm ~/.config/kwinrc
ln -s ~/.linuxConfig/kde/kwinrc ~/.config/kwinrc

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
	cp ~/.linuxConfig/kde/kde_settings.conf /etc/sddm.conf.d/
fi
