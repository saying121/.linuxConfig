#!/bin/bash

# link config
~/.linuxConfig/linkConfig.sh

if [[ $(grep -c debian /etc/os-release) != 0 ]]; then
	pacMan="apt install"
elif [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	pacMan="pacman -S --needed --noconfirm"
else
	echo 'Can not use'
	exit 0
fi

# 必装
if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	sudo pacman -Syu --noconfirm
	sudo pacman -S --needed --noconfirm archlinuxcn-keyring archlinux-keyring
	# if [[ $? != 0 ]]; then
	# if ! sudo pacman -S --needed --noconfirm archlinuxcn-keyring; then
	# 	sudo rm -rf /etc/pacman.d/gnupg
	# 	sudo pacman-key --init
	# 	sudo pacman-key --populate archlinux
	# 	sudo pacman-key --populate archlinuxcn
	# fi
	sudo pacman -Syu --noconfirm
	sudo pacman -S --needed --noconfirm yay paru
	# 调用关于clash的脚本，配置clash
	~/.linuxConfig/scripts/configClash.sh
	# 开发工具
	sudo pacman -S --needed --noconfirm dnsutils networkmanager fd tree p7zip \
		jdk17-openjdk python-pip go clash rust

elif [[ $(grep -c debian /etc/os-release) != 0 ]]; then
	sudo apt update && sudo apt upgrade -y
	sudo apt install network-manager bind9-utils fd-find p7zip-full \
		openjdk-17-jdk python3-pip golang-go cargo rust-all
fi

sudo $pacMan neofetch figlet ranger ffmpeg htop \
	unzip bc man net-tools psmisc sudo sysstat ripgrep fzf trash-cli wget \
	nano vim bash zsh zsh-autosuggestions zsh-syntax-highlighting exa \
	neovim git python3 nvm shfmt shellcheck lolcat luarocks composer eslint cronie

source /usr/share/nvm/init-nvm.sh
nvm install v18.13.0
nvm alias default v18.13.0
nvm install v12.22.12
# 拉取ranger插件
git submodule update --init --recursive

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# omz plug
~/.linuxConfig/shells/ohmyzsh.sh

# nvim配置
if [[ ! -d ~/.local/share/nvim/lazy/lazy.nvim ]]; then
	git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
fi
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
sudo npm i -g neovim npm-check-updates awk-language-server bash-language-server npm neovim sql-language-server
sudo npm install --save-dev --save-exact prettier
pip3 install black isort pynvim pipenv tldr pylsp-rope debugpy vim-vint jedi_language_server

# 给nvim 预览html插件需要低版本npm
nvm use v12.22.12
# nvim --headless "+Lazy! sync" +qa
nvim "+Lazy! sync" +qa

# **********************************************************************************************************

allInstall() {
	if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
		sudo pacman -Syu --noconfirm
		# 中文输入法,支持vim+寄存器的clip
		sudo pacman -S --needed --noconfirm \
			fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-moegirl \
			fcitx5-pinyin-zhwiki fcitx5-material-color vim-fcitx xclip fcitx5-table-other \
			pacman-contrib powerpill reflector \
			openssh ntfs-3g exfat-utils firewalld ueberzug viu ffmpegthumbnailer dolphin konsole \
			w3m djvulibre calibre transmission-cli odt2txt \
			jupyter-nbconvert fontforge openscad drawio-desktop-bin \
			pandoc xdg-utils youtube-dl numlockx rsync linux-firmware-qlogic arch-install-scripts \
			gimagereader-qt tesseract-data-eng tesseract-data-chi_sim \
			obs-studio translate-shell notepadqq alsa qbittorrent steam
		# pdftoppm mediainf
		# sddm主题的依赖
		sudo pacman -S --needed --noconfirm gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia
		# 蓝牙耳机
		sudo pacman -S --needed --noconfirm pulseaudio-bluetooth pulsemixer \
			xorg xorg-xinit xorg-server picom feh polybar calc python-pywal network-manager-applet \
			pulseaudio-alsa shotcut lux-dl

		# wallpaper-engine-kde-plugin requirement ,aur: renderdoc
		sudo pacman -S --needed --noconfirm extra-cmake-modules plasma-framework gst-libav \
			base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel \
			vulkan-headers cmake glfw-x11 vulkan-devel vulkan-radeon

	elif [[ $(grep -c debian /etc/os-release) != 0 ]]; then
		sudo apt install openssh-*

		# 安装input-remapper
		sudo apt install git python3-setuptools gettext
		git clone https://github.com/sezanzeb/input-remapper.git cd input-remapper && ./scripts/build.sh
		sudo apt install ./dist/input-remapper-1.5.0.deb
		cd ..
		rm -rf input-remapper
	fi

	sudo "$pacMan" imagemagick kitty mpv flameshot rofi goldendict terminology ttf-hack-nerd
	# tmux

	python -m pip install konsave

	# tmux 插件管理器
	# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	# speedtest-cli    libglig2.0-dev
}

# aur才有的软件
yayInstall() {
	yay -Syu --noconfirm
	yay -S --needed --noconfirm icalingua++ \
		microsoft-edge-stable-bin visual-studio-code-bin intellij-idea-ultimate-edition \
		input-remapper-git yesplaymusic netease-cloud-music go-musicfox-bin \
		ldr-translate-qt xnviewmp epub-thumbnailer-git fontpreview \
		sddm-theme-aerial-git ruby-fusuma i3-gaps-kde-git \
		wps-office-cn plasma5-wallpapers-wallpaper-engine \
		rime-ls rime-essay renderdoc gotop \
		ast-firmware upd72020x-fw aic94xx-firmware wd719x-firmware
	# copyq  networkmanager-dmenu-bluetoothfix-git  networkmanager-dmenu-git  archlinux-tweak-tool-git
}

# 开启服务
startServer() {
	sudo systemctl enable bluetooth sshd NetworkManager sddm
	sudo systemctl start bluetooth sshd NetworkManager

	sudo systemctl enable input-remapper
	sudo systemctl start input-remapper
	input-remapper-control --command start --device "Keyboard K380 Keyboard" --preset "capslock+"
	input-remapper-control --command start --device "AT Translated Set 2 keyboard" --preset "capslock+"
	sudo systemctl enable firewalld
	# 把自己添加到input组
	sudo gpasswd -a "$USER" input
	sudo gpasswd -a "$USER" video
	newgrp input
}

# 不是WLS再进行
if [[ ! $(uname -a | grep -c WSL) != 0 ]]; then
	allInstall
	if [[ $(grep -c arch /etc/os-release) != 0 ]]; then
		yayInstall
	fi
	startServer
	~/.linuxConfig/rofi/install-rofi-theme.sh
	~/.linuxConfig/i3/polybar/install-polybar-theme.sh
	~/.linuxConfig/kde/use-i3.sh
	# 刷新字体
	fc-cache -fv
fi

unset pacMan
