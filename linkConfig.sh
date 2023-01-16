#!/bin/bash

if [[ ! -d ~/.config ]]; then
	mkdir ~/.config
fi

# pip
ln -sf ~/.linuxConfig/.pip ~/
# nvim
ln -sf ~/.linuxConfig/nvim ~/.config
ln -sf ~/.linuxConfig/nvim/tasks.ini ~/.vim/tasks.ini
# vim
ln -sf ~/.linuxConfig/nvim/viml/init.vim ~/.vimrc
# zshrc
ln -sf ~/.linuxConfig/shells/.zshrc ~/.zshrc
# bashrc
ln -sf ~/.linuxConfig/shells/bashrc ~/.bashrc
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
	ln -sf ~/.linuxConfig/fusuma ~/.config
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
			sudo mkdir -p /etc/X11/xorg.conf.d
		fi
		sudo cp -f ~/.linuxConfig/kde/20-touchpad.conf /etc/X11/xorg.conf.d/20-touchpad.conf
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
