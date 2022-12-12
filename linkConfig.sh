#! /bin/bash

linkConfig() {
	dirPath=~/.linuxConfig

	if [[ -d ~/.pip ]]; then
		echo "有原来的pip配置，请手动操作"
	else
		ln -s $dirPath/pip ~/.pip
		echo "链接pip配置成功"
	fi

	nvimConfig=~/.config/nvim
	if [[ -d $nvimConfig ]]; then
		echo "有原来的nvim配置文件夹,请手动操作"
	else
		ln -s $dirPath/nvim "$nvimConfig"
		echo "链接nvim配置成功"
	fi

	if [[ -f ~/.vimrc ]]; then
		rm ~/.vimrc
		echo "删除了原.vimrc"
	fi
	ln -s $dirPath/nvim/viml/init.vim ~/.vimrc
	echo "链接了.vimrc"

	if [[ -f ~/.zshrc ]]; then
		rm ~/.zshrc
		echo "删除了原.zshrc"
	fi
	ln -s $dirPath/shells/.zshrc ~/.zshrc
	echo "链接了.zshrc"

	if [[ -f ~/.bashrc ]]; then
		rm ~/.bashrc
		echo "删除了原.bashrc"
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
		echo "删除了原kitty配置"
	fi
	ln -s $dirPath/kitty-config/kitty.conf $kittyConfig
	echo "链接了kitty配置"

	unset nvimConfig dirPath kittyConfig
}
linkConfig

if [[ $(uname -a | grep -c WSL) != 0 ]]; then
	echo -n ""
else
	# 键盘映射
	if [[ -f ~/.Xmodmap ]]; then
		rm ~/.Xmodmap
	fi
	ln -s ~/.linuxConfig/desktop/Xmodmap ~/.Xmodmap
	# 配置触摸板
	if [[ -d /etc/X11/xorg.conf.d/ ]]; then
		echo -n ''
	else
		sudo mkdir -p /etc/X11/xorg.conf.d/
	fi
	if [[ -f /etc/X11/xorg.conf.d/20-touchpad.conf ]]; then
		echo '已有触模板配置'
	else
		sudo cp ~/.linuxConfig/desktop/20-touchpad.conf /etc/X11/xorg.conf.d/
	fi
    ~/.linuxConfig/configs/links.sh
fi
