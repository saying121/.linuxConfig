#! /bin/bash

if [[ ! -d ~/.config ]]; then
	mkdir ~/.config
fi

linkConfig() {
	if [[ -d ~/.pip ]]; then
		rm -rf ~/.pip
	fi
	ln -s ~/.linuxConfig/pip ~/.pip
	echo "链接pip配置成功"

	if [[ -d ~/.config/nvim ]]; then
		rm -rf ~/.config/nvim
	fi
	ln -s ~/.linuxConfig/nvim ~/.config/nvim
	echo "链接nvim配置成功"

	if [[ -f ~/.vimrc ]]; then
		rm ~/.vimrc
	fi
	ln -s ~/.linuxConfig/nvim/viml/init.vim ~/.vimrc
	echo "链接了.vimrc"

	if [[ -f ~/.zshrc ]]; then
		rm ~/.zshrc
	fi
	ln -s ~/.linuxConfig/shells/.zshrc ~/.zshrc
	echo "链接了.zshrc"

	if [[ -f ~/.bashrc ]]; then
		rm ~/.bashrc
	fi
	ln -s ~/.linuxConfig/shells/bashrc ~/.bashrc
	echo "链接了.bashrc"
	if [[ -d ~/.local/shells ]]; then
		echo -n ""
	else
		mkdir ~/.local/shells
	fi

	kittyConfig=~/.config/kitty/kitty.conf
	if [[ -f $kittyConfig ]]; then
		rm "$kittyConfig"
	fi
	ln -s ~/.linuxConfig/kitty-config/kitty.conf $kittyConfig
	echo "链接了kitty配置"

	unset kittyConfig
}
linkConfig

if [[ ! $(uname -a | grep -c WSL) != 0 ]]; then
	# 应用配置
	~/.linuxConfig/configs/links.sh
	# 桌面配置
	~/.linuxConfig/desktop/links.sh
	# keymap
	if [[ -d ~/.config/input-remapper ]]; then
		# echo '有原来的配置目录，请手动操作'
		rm -rf ~/.config/input-remapper
	fi
	ln -s ~/.linuxConfig/input-remapper ~/.config/input-remapper
    # 触摸板手势
	if [[ ! -d ~/.config/fusuma ]]; then
		ln -s ~/.linuxConfig/fusuma ~/.config/fusuma
	fi
    # i3
	if [[ -d ~/.config/i3 ]]; then
        rm -rf ~/.config/i3
    fi
	if [[ ! -d ~/.config/i3 ]]; then
		ln -s ~/.linuxConfig/i3 ~/.config/i3
	fi
fi
