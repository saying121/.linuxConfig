#! /bin/bash

linkConfig() {
	dirPath=~/.linuxConfig

	if [[ -d ~/.pip ]]; then
		rm -rf ~/.pip
	fi
	ln -s $dirPath/pip ~/.pip
	echo "链接pip配置成功"

	if [[ -d ~/.config/nvim ]]; then
		rm -rf ~/.config/nvim
	fi
	ln -s $dirPath/nvim ~/.config/nvim
	echo "链接nvim配置成功"

	if [[ -f ~/.vimrc ]]; then
		rm ~/.vimrc
	fi
	ln -s $dirPath/nvim/viml/init.vim ~/.vimrc
	echo "链接了.vimrc"

	if [[ -f ~/.zshrc ]]; then
		rm ~/.zshrc
	fi
	ln -s $dirPath/shells/.zshrc ~/.zshrc
	echo "链接了.zshrc"

	if [[ -f ~/.bashrc ]]; then
		rm ~/.bashrc
	fi
	ln -s $dirPath/shells/bashrc ~/.bashrc
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
	ln -s $dirPath/kitty-config/kitty.conf $kittyConfig
	echo "链接了kitty配置"

	unset dirPath kittyConfig
}
linkConfig

if [[ $(uname -a | grep -c WSL) != 0 ]]; then
	echo -n ""
else
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
fi
