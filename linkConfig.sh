#!/bin/bash

if [[ ! -d ~/.config ]]; then
	mkdir ~/.config
fi

ln -sf ~/.linuxConfig/.pip ~/ && echo "链接pip配置成功"

ln -sf ~/.linuxConfig/nvim ~/.config && echo "链接nvim配置成功"

ln -sf ~/.linuxConfig/nvim/viml/init.vim ~/.vimrc && echo "链接了.vimrc"

ln -sf ~/.linuxConfig/shells/.zshrc ~/.zshrc && echo "链接了.zshrc"
# source ~/.zshrc

ln -sf ~/.linuxConfig/shells/bashrc ~/.bashrc && echo "链接了.bashrc"
# source ~/.bashrc

if [[ ! -d ~/.local/shells ]]; then
	mkdir ~/.local/shells
fi

# ranger
ln -sf ~/.linuxConfig/ranger ~/.config

# tldr
ln -sf ~/.linuxConfig/configs/tldrrc ~/.tldrrc
# npm
ln -sf ~/.linuxConfig/configs/npmrc ~/.npmrc

if [[ ! $(uname -a | grep -c WSL) != 0 ]]; then
	# flameshot
	if [[ ! -d ~/.config/flameshot ]]; then
		mkdir -p ~/.config/flameshot
	fi
	ln -sf ~/.linuxConfig/configs/flameshot.ini ~/.config/flameshot/flameshot.ini
	# kitty
	ln -sf ~/.linuxConfig/kitty-config/kitty.conf ~/.config/kitty/kitty.conf

	# terminology
	ln -sf ~/.linuxConfig/terminology ~/.config
	# konsave config
	if [[ ! -d ~/.config/konsave ]]; then
		mkdir -p ~/.config/konsave
	fi
	ln -sf ~/.linuxConfig/configs/konsave-conf.yaml ~/.config/konsave/conf.yaml

	# keymap
	ln -sf ~/.linuxConfig/input-remapper ~/.config

	# 触摸板手势
	if [[ ! -d ~/.config/fusuma ]]; then
		ln -sf ~/.linuxConfig/fusuma ~/.config
	fi

	# i3
	ln -sf ~/.linuxConfig/i3 ~/.config

	# 语言
	ln -sf ~/.linuxConfig/xprofile ~/.xprofile

	# 输入法
	ln -sf ~/.linuxConfig/fcitxs-config/fcitx ~/.config
	ln -sf ~/.linuxConfig/fcitxs-config/fcitx5 ~/.config

	# 判断有没有touchpad
	if [[ $(xinput list | grep "[tT]ouchpad" -c) != 0 ]]; then
		# 配置触摸板
		if [[ ! -d /etc/X11/xorg.conf.d ]]; then
			sudo mkdir -p /etc/X11/xorg.conf.d/
		fi
		if [[ -f /etc/X11/xorg.conf.d/20-touchpad.conf ]]; then
			echo '已有触模板配置'
		else
			sudo cp ~/.linuxConfig/kde/20-touchpad.conf /etc/X11/xorg.conf.d/20-touchpad.conf
		fi
	fi

	# sddm
	if [[ ! -d /etc/sddm.conf.d/ ]]; then
		mkdir -p /etc/sddm.conf.d
	fi
	if [[ -f /etc/sddm.conf.d/kde_settings.conf ]]; then
		echo '已有sddm配置'
	else
		sudo cp ~/.linuxConfig/kde/sddm.conf /etc/sddm.conf.d/kde_settings.conf
	fi

	# obs
	ln -sf ~/.linuxConfig/obs/global.ini ~/.config/obs-studio/global.ini
	ln -sf ~/.linuxConfig/obs/basic ~/.config/obs-studio/basic
	if [[ ! -d ~/Videos/obs ]]; then
		mkdir -p ~/Videos/obs
	fi

fi
