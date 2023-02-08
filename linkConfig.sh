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

[[ -d ~/.config ]] || mkdir ~/.config

# pip
rm -rf ~/.pip
ln -sf ~/.linuxConfig/.pip ~/
# nvim
rm -rf ~/.config/nvim
ln -sf ~/.linuxConfig/nvim ~/.config
ln -sf ~/.linuxConfig/nvim/tasks.ini ~/.vim/tasks.ini
ln -sf ~/.linuxConfig/nvim/coc-settings.json ~/.vim/coc-settings.json
# vim
ln -sf ~/.linuxConfig/nvim/viml/init.vim ~/.vimrc
ln -sf ~/.linuxConfig/nvim/coc-settings.json ~/.vim/coc-settings.json
# zshrc
ln -sf ~/.linuxConfig/shells/.zshrc ~/.zshrc
# bashrc
ln -sf ~/.linuxConfig/shells/bashrc ~/.bashrc
[[ -d ~/.local/shells ]] || mkdir ~/.local/shells
# ranger
rm -rf ~/.config/ranger
ln -sf ~/.linuxConfig/ranger ~/.config
# lf
rm -rf ~/.config/lf
ln -sf ~/.linuxConfig/lf ~/.config
# tldr
ln -sf ~/.linuxConfig/configs/tldrrc ~/.tldrrc
# npm
ln -sf ~/.linuxConfig/configs/npmrc ~/.npmrc
# music
[[ -d ~/.go-musicfox ]] || mkdir ~/.go-musicfox
ln -sf ~/.linuxConfig/configs/go-musicfox.ini ~/.go-musicfox/go-musicfox.ini
# leetcode-cli
[[ -d ~/.leetcode ]] || mkdir ~/.leetcode
ln -sf ~/.linuxConfig/configs/leetcode.toml ~/.leetcode/leetcode.toml

if [[ ! $(uname -a | grep -c WSL) != 0 ]]; then
	# flameshot
	[[ -d ~/.config/flameshot ]] || mkdir -p ~/.config/flameshot
	ln -sf ~/.linuxConfig/configs/flameshot.ini ~/.config/flameshot/flameshot.ini
	# kitty
	rm -rf ~/.config/kitty
	ln -sf ~/.linuxConfig/kitty ~/.config
	# terminology
	rm -rf ~/.config/terminology
	ln -sf ~/.linuxConfig/terminology ~/.config
	# konsave config
	[[ -d ~/.config/konsave ]] || mkdir -p ~/.config/konsave
	ln -sf ~/.linuxConfig/configs/konsave-conf.yaml ~/.config/konsave/conf.yaml
	# keymap
	rm -rf ~/.config/input-remapper
	ln -sf ~/.linuxConfig/input-remapper ~/.config
	ln -sf ~/.linuxConfig/input-remapper/presets/AT\ Translated\ Set\ 2\ keyboard/capslock+.json ~/.linuxConfig/input-remapper/presets/Keyboard\ K380\ Keyboard/capslock+.json
	# 触摸板手势
	rm -rf ~/.config/fusuma
	ln -sf ~/.linuxConfig/fusuma ~/.config
	# i3
	rm -rf ~/.config/i3
	ln -sf ~/.linuxConfig/i3 ~/.config
	# 语言
	ln -sf ~/.linuxConfig/configs/xprofile ~/.xprofile
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
	[[ -d /etc/sddm.conf.d ]] || sudo mkdir -p /etc/sddm.conf.d
	if [[ -f /etc/sddm.conf.d/kde_settings.conf ]]; then
		echo '已有sddm配置'
	else
		sudo cp ~/.linuxConfig/kde/sddm.conf /etc/sddm.conf.d/kde_settings.conf
	fi
	# obs
	[[ -d ~/.config/obs-studio ]] || mkdir ~/.config/obs-studio
	ln -sf ~/.linuxConfig/obs-studio/global.ini ~/.config/obs-studio/global.ini
	rm -rf ~/.config/obs-studio/basic
	ln -sf ~/.linuxConfig/obs-studio/basic ~/.config/obs-studio/basic
	[[ -d ~/Videos/obs ]] || mkdir -p ~/Videos/obs

fi
