#!/bin/bash

if [[ $(grep -c mason /etc/profile) == 0 ]]; then
	# shellcheck disable=2016
	echo '
export ALL_PROXY=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
export NO_PROXY=baidu.com,qq.com

export EDITOR='nvim'

# input method
export ECORE_IMF_MODULE="xim"
export XMODIFIERS="@im=none"

export PATH=~/.cargo/bin:~/.local/bin:$PATH
export PATH=~/.local/share/nvim/mason/bin:$PATH
export PATH=/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application:$PATH

source /usr/share/nvm/init-nvm.sh
' | sudo tee -a /etc/profile

	source /etc/profile
fi

if [[ ! -d ~/.config ]]; then
	mkdir ~/.config
fi

# pip
rm -rf ~/.pip
ln -sf ~/.linuxConfig/.pip ~/
# nvim
rm -rf ~/.config/nvim
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
rm -rf ~/.config/ranger
ln -sf ~/.linuxConfig/ranger ~/.config
# tldr
ln -sf ~/.linuxConfig/configs/tldrrc ~/.tldrrc
# npm
ln -sf ~/.linuxConfig/configs/npmrc ~/.npmrc
# music
if [[ ! -d ~/.go-musicfox ]]; then
	mkdir ~/.go-musicfox
fi
ln -sf ~/.linuxConfig/configs/go-musicfox.ini ~/.go-musicfox/go-musicfox.ini

if [[ ! $(uname -a | grep -c WSL) != 0 ]]; then
	# flameshot
	if [[ ! -d ~/.config/flameshot ]]; then
		mkdir -p ~/.config/flameshot
	fi
	ln -sf ~/.linuxConfig/configs/flameshot.ini ~/.config/flameshot/flameshot.ini
	# kitty
	rm -rf ~/.config/kitty
	ln -sf ~/.linuxConfig/kitty ~/.config
	# terminology
	rm -rf ~/.config/terminology
	ln -sf ~/.linuxConfig/terminology ~/.config
	# konsave config
	if [[ ! -d ~/.config/konsave ]]; then
		mkdir -p ~/.config/konsave
	fi
	ln -sf ~/.linuxConfig/configs/konsave-conf.yaml ~/.config/konsave/conf.yaml
	# keymap
	rm -rf ~/.config/input-remapper
	ln -sf ~/.linuxConfig/input-remapper ~/.config
	# 触摸板手势
	rm -rf ~/.config/fusuma
	ln -sf ~/.linuxConfig/fusuma ~/.config
	# i3
	rm -rf ~/.config/i3
	ln -sf ~/.linuxConfig/i3 ~/.config
	# 语言
	ln -sf ~/.linuxConfig/xprofile ~/.xprofile
	# 输入法
	rm -rf ~/.config/fcitx
	rm -rf ~/.config/fcitx5
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
	if [[ ! -d ~/.config/obs-studio ]]; then
		mkdir ~/.config/obs-studio
	fi
	ln -sf ~/.linuxConfig/obs-studio/global.ini ~/.config/obs-studio/global.ini
	rm -rf ~/.config/obs-studio/basic
	ln -sf ~/.linuxConfig/obs-studio/basic ~/.config/obs-studio/basic
	if [[ ! -d ~/Videos/obs ]]; then
		mkdir -p ~/Videos/obs
	fi

fi
