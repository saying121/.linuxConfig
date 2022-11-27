#! /bin/bash

linkConfig() {
	dirPath=~/.linuxConfig

	nvimConfig=~/.config/nvim
	if [[ -d $nvimConfig ]]; then
        echo -n "有原来的nvim配置文件夹"
    else
        ln -s $dirPath/nvim "$nvimConfig"
	fi

    rm ~/.vimrc && ln -s $dirPath/nvim/viml/init.vim ~/.vimrc

    rm ~/.zshrc && ln -s $dirPath/shells/zshrc ~/.zshrc

    rm ~/.bashrc && ln -s $dirPath/shells/bashrc ~/.bashrc

	kittyConfig=~/.config/kitty/kitty.conf
	if [[ -f $kittyConfig ]]; then
		rm "$kittyConfig"
	fi
	ln -s $dirPath/kitty-config/kitty.conf $kittyConfig

	unset nvimConfig dirPath kittyConfig
}
linkConfig
