#! /bin/bash

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 重新链接.zshrc
rm ~/.zshrc
if [[ -f ~/.zshrc.pre-oh-my-zsh ]]; then
	rm ~/.zshrc.pre-oh-my-zsh
fi
rm ~/.zshrc
ln -s ~/.linuxConfig/shells/.zshrc ~/.zshrc

# 安装web-search
git clone https://github.com/lesonky/web-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/web-search

# 安装git-open
sudo npm install --global git-open
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	# 启用command-not-found
	sudo pacman -S pkgfile
	sudo pkgfile -u
	pkgfile makepkg
fi
source ~/.zshrc
