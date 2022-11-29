#! /bin/bash

linkConfig() {
	dirPath=~/.linuxConfig

    if [[ -d ~/.pip ]]
    then
        echo "有原来的pip配置，请手动操作"
    else
        ln -s $dirPath/pip ~/.pip
    fi

	nvimConfig=~/.config/nvim
	if [[ -d $nvimConfig ]]; then
		echo "有原来的nvim配置文件夹,请手动操作"
	else
		ln -s $dirPath/nvim "$nvimConfig"
	fi

	if [[ -f ~/.vimrc ]]; then
		rm ~/.vimrc
	fi
	ln -s $dirPath/nvim/viml/init.vim ~/.vimrc

	if [[ -f ~/.zshrc ]]; then
		rm ~/.zshrc
	fi
	ln -s $dirPath/shells/zshrc ~/.zshrc

	if [[ -f ~/.bashrc ]]; then
		rm ~/.bashrc
	fi
	ln -s $dirPath/shells/bashrc ~/.bashrc

	kittyConfig=~/.config/kitty/kitty.conf
	if [[ -f $kittyConfig ]]; then
		rm "$kittyConfig"
	fi
	ln -s $dirPath/kitty-config/kitty.conf $kittyConfig

	unset nvimConfig dirPath kittyConfig
}
linkConfig
