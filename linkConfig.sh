#! /bin/bash

linkConfig() {
    dirPath=~/.linuxConfig
	nvimConfig=~/.config/nvim/
	[[ -d $nvimConfig ]] && rm "$nvimConfig"
	ln -s $dirPath/nvim "$nvimConfig"

    [[ -f ~/.vimrc ]] && rm ~/.vimrc || ln -s $dirPath/nvim/viml/init.vim ~/.vimrc

	zshConfig=~/.zshrc
	[[ -f $zshConfig ]] && rm "$zshConfig"
	ln -s $dirPath/.zshrc ~/.zshrc

	bashConfig=~/.bashrc
	[[ -f $bashConfig ]] && rm "$bashConfig"
	ln -s $dirPath/.bashrc ~/.bashrc

    kittyConfig=~/.config/kitty/kitty.conf
	[[ -f $kittyConfig ]] && rm "$kittyConfig"
    ln -s $dirPath/kitty.conf $kittyConfig

	unset nvimConfig zshConfig bashConfig dirPath kittyConfig
}
linkConfig
