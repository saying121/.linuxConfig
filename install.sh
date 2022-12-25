#!/bin/bash

# link config
~/.linuxConfig/linkConfig.sh

if [[ $(grep -c debian /etc/os-release) != 0 ]]; then
	pacMan="apt install"
elif [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	pacMan="pacman -S --needed"
else
	echo 'Can not use'
	exit 0
fi

# 必装
if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	sudo pacman -syu
	# sudo pacman -S --needed archlinuxcn-keyring
	# if [[ $? != 0 ]]; then
	if [[ ! $(sudo pacman -S --needed archlinuxcn-keyring) ]]; then
		sudo rm -rf /etc/pacman.d/gnupg
		pacman-key --init
		pacman-key --populate archlinux
		pacman-key --populate archlinuxcn
	fi
	sudo pacman -syu
	sudo pacman -S --needed yay paru
	# 调用关于clash的脚本，配置clash
	~/.linuxConfig/configClash.sh
	# 开发工具

	sudo pacman -S --needed dnsutils networkmanager fd tree p7zip \
		jdk17-openjdk python-pip go clash

elif [[ $(grep -c debian /etc/os-release) != 0 ]]; then
	sudo apt update && sudo apt upgrade -y
	sudo apt install network-manager bind9-utils fd-find p7zip-full
	sudo apt install openjdk-17-jdk python3-pip golang-go
fi

sudo $pacMan \
	neofetch figlet ranger ffmpeg htop stardict \
	unzip bc man net-tools psmisc sudo sysstat ripgrep fzf trash-cli wget \
	nano vim bash zsh zsh-autosuggestions zsh-syntax-highlighting

# 必装开发工具
sudo $pacMan \
	neovim git shfmt \
	python3 nodejs npm

sudo npm i -g tldr npm-check-updates
# nvim配置
if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
		~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
sudo npm install -g npm neovim
# sudo npm install -g tree-sitter-cli
sudo npm i -g sql-language-server
pip3 install black isort pynvim pipenv
pip3 install pylsp-rope
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# **********************************************************************************************************

allInstall() {
	if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
		sudo pacman -syu
		# 中文输入法,支持vim+寄存器的clip
		sudo pacman -S --needed \
			fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-moegirl \
			fcitx5-pinyin-zhwiki fcitx5-material-color vim-fcit xclip fcitx5-table-other \
			nerd-fonts-hack

		sudo pacman -S --needed \
			pacman-contrib powerpill reflector \
			openssh ntfs-3g firewalld \
			ueberzug ffmpegthumbnailer pdftoppm dolphin \
			w3m djvutxt calibre transmission-cli mediainf odt2txt \
			jupyter-nbconvert fontforge openscad drawio-desktop-bin \
			pandoc xdg-utils youtube-dl numlockx rsync \
			linux-firmware-qlogic
		# sddm主题的依赖
		sudo pacman -S --needed gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia
		# 蓝牙耳机
		sudo pacman -S --needed pulseaudio-bluetooth pulsemixer

		sudo pacman -S --needed xorg xorg-xinit xorg-server picom feh polybar calc python-pywal network-manager-applet

	elif [[ $(grep -c debian /etc/os-release) != 0 ]]; then
		sudo apt update && sudo apt upgrade -y
		sudo apt install \
			openssh-* \
			ttf-hack-nerd
		# fonts-hack-ttf

		# 安装input-remapper
		sudo apt install git python3-setuptools gettext
		git clone https://github.com/sezanzeb/input-remapper.git
		cd input-remapper && ./scripts/build.sh
		sudo apt install ./dist/input-remapper-1.5.0.deb
		cd ..
		rm -rf input-remapper
	fi

	sudo $pacMan \
		imagemagick kitty mpv flameshot \
		steam rofi goldendict
	# tmux

	python -m pip install konsave

	# tmux 插件管理器
	# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	# speedtest-cli    libglig2.0-dev
}

# aur才有的软件
yayInstall() {
	yay -Syu
	yay -S --needed \
		icalingua++ \
		microsoft-edge-stable-bin visual-studio-code-bin intellij-idea-ultimate-edition \
		libreoffice input-remapper-git \
		yesplaymusic netease-cloud-music \
		ldr-translate-qt \
		xnviewmp epub-thumbnailer-git fontpreview \
		sddm-theme-aerial-git ruby-fusuma \
		archlinux-tweak-tool-git kwin-scripts-krohnkite-git \
		i3-gaps-kde-git networkmanager-dmenu-git copyq networkmanager-dmenu-bluetoothfix-git
}

# 开启服务
startServer() {
	sudo systemctl enable bluetooth sshd NetworkManager sddm
	sudo systemctl start bluetooth sshd NetworkManager

	sudo systemctl enable input-remapper
	sudo systemctl start input-remapper

	sudo systemctl enable firewalld
	# 把自己添加到input组
	sudo gpasswd -a $USER input
	newgrp input
}

# 不是WLS再进行
if [[ ! $(uname -a | grep -c WSL) != 0 ]]; then
	allInstall
	if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
		yayInstall
	fi
	startServer
	~/.linuxConfig/shells/ohmyzsh.sh
	~/.linuxConfig/rofi/install-rofi-theme.sh
	# 刷新字体
	fc-cache -fv
fi

unset pacMan
