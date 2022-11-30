#! /bin/bash

# link config
~/.linuxConfig/linkConfig.sh

dirPath=~/.linuxConfig
if [[ $1 = -h || $1 = --help ]]; then
	echo "Instal package,第一个参数跟clash订阅链接"
fi

# 确定发行版
release=$(awk -F= '/ID_LIKE/{print $2}' /etc/os-release)

if [[ $(grep -c debian /etc/os-release) != 0 ]]; then
	pacMan="apt install"
elif [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	pacMan="pacman -S --needed"
fi

# 必装
if [[ $release = arch ]]; then
	sudo pacman -syyu
	sudo pacman -S --needed archlinuxcn-keyring
	if [[ $? != 0 ]]; then
		sudo rm -rf /etc/pacman.d/gnupg
		pacman-key --init
		pacman-key --populate archlinux
		pacman-key --populate archlinuxcn
	fi
	sudo pacman -S --needed yay paru
fi

sudo $pacMan \
	neofetch figlet \
	ranger ffmpeg \
	htop \
	unzip bc man net-tools psmisc sudo sysstat ripgrep trash-cli wget \
	nano vim \
	bash zsh zsh-autosuggestions zsh-syntax-highlighting

# 必装开发工具
sudo $pacMan \
	neovim \
	python3 \
	nodejs npm \
	git \
	shfmt

# nvim配置
sudo npm install -g npm neovim
sudo npm install -g tree-sitter-cli
pip install black isort pynvim pipenv

# 开发工具
if [[ $release = arch ]]; then
	sudo pacman -syyu

	sudo pacman -S --needed \
		dnsutils networkmanager fd
	sudo pacman -S --needed \
		jdk17-openjdk python-pip go

elif [[ $release = debian ]]; then
	sudo apt update && sudo apt upgrade -y
	sudo apt install \
		network-manager bind9-utils fd-find
	sudo apt install \
		openjdk-17-jdk python3-pip golang-go
fi

# 能直接安装的软件
allInstall() {
	if [[ $release = arch ]]; then
		sudo pacman -syyu

		# 中文输入法
		sudo pacman -S --needed \
			fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-moegirl \
			fcitx5-pinyin-zhwiki fcitx5-material-color \
			ttf-hack

		sudo pacman -S --needed \
			openssh clash ntfs-3g

	elif [[ $release = debian ]]; then
		sudo apt update && sudo apt upgrade -y
		sudo apt install \
			openssh-* \
			fonts-hack-ttf

		# 安装input-remapper
		sudo apt install git python3-setuptools gettext
		git clone https://github.com/sezanzeb/input-remapper.git
		cd input-remapper && ./scripts/build.sh
		sudo apt install ./dist/input-remapper-1.5.0.deb
		cd ..
		rm -rf input-remapper
	fi

	sudo $pacMan \
		imagemagick mpv \
		kitty

	# speedtest-cli    libglig2.0-dev
}

# aur才有的软件
yayInstall() {
	yay -Syyu
	yay -S --needed \
		icalingua++ \
		input-remapper-git \
		libreoffice \
		microsoft-edge-stable-bin \
		yesplaymusic
}

# 开启服务
startServer() {
	sudo systemctl enable bluetooth sshd NetworkManager
	sudo systemctl start bluetooth sshd NetworkManager

	sudo systemctl enable input-remapper
	sudo systemctl start input-remapper
}


configInputRemapper() {
	remapper_dir="$HOME/.config/input-remapper"
	remapper_config="$HOME/.config/input-remapper/config.json"
	if [[ -d $remapper_dir ]]; then
		echo -n ""
	else
		mkdir -p "$remapper_dir"
	fi

	if [[ -f $remapper_config ]]; then
		rm $remapper_config
	fi
	ln -s $dirPath./input-remapper-config.json $remapper_config

	unset remapper_dir remapper_config
}

if [[ $(uname -a | grep -c WSL) != 0 ]]; then
	echo -n ""
else
	allInstall
	yayInstall
	startServer
	configInputRemapper
    $dirPath/configClash.sh

	# 刷新字体
	fc-cache -fv
fi

unset dirPath release pacMan
