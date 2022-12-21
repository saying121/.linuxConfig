#! /bin/bash

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 移除oh-my-zsh生成的.zshrc,重新链接.zshrc
if [[ -f ~/.zshrc.pre-oh-my-zsh ]]; then
	rm ~/.zshrc.pre-oh-my-zsh
fi
if [[ -f ~/.zshrc ]]; then
	rm ~/.zshrc
fi
ln -s ~/.linuxConfig/shells/.zshrc ~/.zshrc

# 安装web-search
if [[ ! -d ~/.oh-my-zsh/custom/plugins/web-search ]]; then
	git clone https://github.com/lesonky/web-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/web-search
fi

# 安装git-open
sudo npm install --global git-open
if [[ ! -d ~/.oh-my-zsh/custom/plugins/git-open ]]; then
	git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open
fi

# 启用command-not-found
if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	sudo pacman -S --needed pkgfile
	sudo pkgfile -u
	pkgfile makepkg
fi

source $HOME/.zshrc
