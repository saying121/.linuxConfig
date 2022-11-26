#! /bin/bash

dirPath=~/.linuxConfig
if [[ $1 = -h || $1 = --help ]]; then
	echo "Instal package,第一个参数跟clash订阅链接"
fi

# 确定发行版
affirmOS() {
	release=$(awk -F= '/ID_LIKE/{print $2}' /etc/os-release)

	if [[ $(grep -c debian /etc/os-release) != 0 ]]; then
		pacMan="apt"
		opt="install"
	elif [[ $(grep -c arch /etc/os-release) != 0 ]]; then
		pacMan="pacman"
		opt="-S"
	fi
}

# 能直接安装的软件
allInstall() {
	if [[ $release = arch ]]; then
		sudo pacman -S archlinuxcn-keyring
		if [[ $? != 0 ]]; then
			sudo rm -rf /etc/pacman.d/gnupg
			pacman-key --init
			pacman-key --populate archlinux
			pacman-key --populate archlinuxcn
		fi
		sudo pacman -S yay paru
		# 中文输入法
		sudo pacman -S \
			fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-moegirl \
			fcitx5-pinyin-zhwiki fcitx5-material-color

		sudo pacman -S \
			clash \
			dnsutils networkmanager \
			ntfs-3g \
			viu
		# 开发工具
		sudo pacman -S \
			jdk17-openjdk \
			python-pip

	elif [[ $release = debian ]]; then
		sudo apt update && sudo apt upgrade -y
		sudo apt install \
			network-manager \
			bind9-utils \
			openjdk-17-jdk \
			python3-pip
	fi

	sudo "$pacMan" "$opt" \
		bc \
		man \
		mpv \
		neofetch \
		net-tools \
		psmisc \
		sysstat \
		trash-cli \
		sudo \
		vi \
		vim \
		nano \
		wget \
		zsh \
		zsh-autosuggestions \
		zsh-syntax-highlighting \
		bash \
		openssh

	# 开发工具
	sudo "$pacMan" "$opt" \
		neovim \
		python3 \
		nodejs \
		npm \
		git

	# speedtest-cli    libglig2.0-dev
}

yayInstall() {
	yay -S \
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

configForClash() {
	clash_dir="/etc/clash/"
	clash_config="$clash_dir"config.yaml
	[[ -d $clash_dir ]] && echo "" || sudo mkdir "$clash_dir"

	# $1 写clash链接
	sudo wget -O "$clash_config" "$1"

	if [[ $release = arch ]]; then
		sed -i 's/mixed-port:.*/mixed-port: 7890/' "$clash_config"
		sed -i 's/enhanced-mode:.*/enhanced-mode: fake-ip/' "$clash_config"
		sed -i 's/mode:.*/mode: rule/' "$clash_config"
	fi
	unset clash_dir clash_config
}

createClashService() {
	# ClashReallyPath=$(type awk | awk '{print$3}')
	clashServer=$dirPath/clash.service
	ln -s $clashServer /etc/systemd/system/clash.service
	# sed -i "s/clashReallyPath/$ClashReallyPath/" $clashServer

	sudo systemctl daemon-reload
	sudo systemctl enable clash
	sudo systemctl start clash
	unset clashServer
}

# 发行版
affirmOS
allInstall
yayInstall
configForClash "$1"
createClashService
startServer

unset pacMan opt

# link config
linkConfig() {
	nvimConfig=~/.config/nvim/
	[[ -d $nvimConfig ]] && rm "$nvimConfig"
	ln -s $dirPath/nvim "$nvimConfig"
	ln -s $dirPath/nvim/viml/init.vim ~/.vimrc

	zshConfig=~/.zshrc
	[[ -f $zshConfig ]] && rm "$zshConfig"
	ln -s $dirPath/.zshrc ~/.zshrc

	bashConfig=~/.bashrc
	[[ -f $bashConfig ]] && rm "$bashConfig"
	ln -s $dirPath/.bashrc ~/.bashrc

	unset nvimConfig zshConfig bashConfig
}

linkConfig

unset dirPath release
