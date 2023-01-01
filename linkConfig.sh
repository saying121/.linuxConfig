#!/bin/bash

if [[ ! -d ~/.config ]]; then
	mkdir ~/.config
fi

rm -rf ~/.pip
ln -s ~/.linuxConfig/pip ~/.pip && echo "链接pip配置成功"

rm -rf ~/.config/nvim
ln -s ~/.linuxConfig/nvim ~/.config/nvim && echo "链接nvim配置成功"

rm ~/.vimrc
ln -s ~/.linuxConfig/nvim/viml/init.vim ~/.vimrc && echo "链接了.vimrc"

rm ~/.zshrc
ln -s ~/.linuxConfig/shells/.zshrc ~/.zshrc && echo "链接了.zshrc"
# source ~/.zshrc

rm ~/.bashrc
ln -s ~/.linuxConfig/shells/bashrc ~/.bashrc && echo "链接了.bashrc"
# source ~/.bashrc

if [[ ! -d ~/.local/shells ]]; then
	mkdir ~/.local/shells
fi

# ranger
rm -rf ~/.config/ranger
ln -s ~/.linuxConfig/ranger ~/.config/ranger

# tldr
rm ~/.tldrrc
ln -s ~/.linuxConfig/configs/tldrrc ~/.tldrrc

if [[ ! $(uname -a | grep -c WSL) != 0 ]]; then
	# flameshot
	if [[ ! -d ~/.config/flameshot ]]; then
		mkdir -p ~/.config/flameshot
	fi
	rm ~/.config/flameshot/flameshot.ini
	ln -s ~/.linuxConfig/configs/flameshot.ini ~/.config/flameshot/flameshot.ini
	# kitty
	rm ~/.config/kitty/kitty.conf
	ln -s ~/.linuxConfig/kitty-config/kitty.conf ~/.config/kitty/kitty.conf

	# konsave config
	if [[ ! -d ~/.config/konsave ]]; then
		mkdir -p ~/.config/konsave
	fi
	rm ~/.config/konsave/conf.yaml
	ln -s ~/.linuxConfig/kde/konsave-conf.yaml ~/.config/konsave/conf.yaml

	# keymap
	rm -rf ~/.config/input-remapper
	ln -s ~/.linuxConfig/input-remapper ~/.config/input-remapper

	# 触摸板手势
	rm -rf ~/.config/fusuma
	if [[ ! -d ~/.config/fusuma ]]; then
		ln -s ~/.linuxConfig/fusuma ~/.config/fusuma
	fi

	# i3
	rm -rf ~/.config/i3
	ln -s ~/.linuxConfig/i3 ~/.config/i3

	# 语言
	rm -rf ~/.xprofile
	ln -s ~/.linuxConfig/xprofile ~/.xprofile

	# 输入法
	rm -rf ~/.config/fcitx
	ln -s ~/.linuxConfig/fcitxs-config/fcitx ~/.config/fcitx
	rm -rf ~/.config/fcitx5
	ln -s ~/.linuxConfig/fcitxs-config/fcitx5 ~/.config/fcitx5

	# polybar
	# cat ~/.linuxConfig/mpd/mpd.conf | sudo tee /etc/mpd.conf

fi
