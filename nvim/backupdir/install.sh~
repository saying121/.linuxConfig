#! /bin/bash

reallyPath=$(pwd -P)
if [[ $1 = -h || $1 = --help ]]; then
	echo "Instal package,第一个参数跟clash订阅链接"
fi

# 确定发行版
affirmOS() {
	release=$(awk -F= '/ID_LIKE/{print $2}' /etc/os-release)

	if [[ $release = debian ]]; then
		pacMan="apt"
		opt="install"
	elif [[ $release = arch ]]; then
		pacMan="pacman"
		opt="-S"
	fi
}

# 能直接安装的软件
allInstall() {
	sudo "$pacMan" "$opt" \
		bc \
		git \
		man \
		mpv \
		neofetch \
		neovim \
		net-tools \
		network-manager \
		nodejs \
		npm \
		psmisc \
		python3 \
		sysstat \
		trash-cli \
		vim \
		wget \
		zsh \
		zsh-autosuggestions \
		zsh-syntax-highlighting

	# speedtest-cli    libglig2.0-dev
	echo ----------------------
	if [[ $release = arch ]]; then
		# 基础包
		sudo "$pacMan" "$opt" \
			amd-ucode \
			base \
			base-devel \
			linux \
			linux-firmware

		sudo "$pacMan" "$opt" \
			clash \
			dnsutils \
			jdk17-openjdk \
			python-pip \
			viu

		echo ----------------------
	elif [[ $release = debian ]]; then
		sudo "$pacMan" "$opt" \
			bind9-utils \
			openjdk-17-jdk \
			python3-pip

	fi
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
	sudo systemctl enable bluetooth
	sudo systemctl start bluetooth

	sudo systemctl enable input-remapper
	sudo systemctl restart input-remapper
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
}

createClashService() {
	# ClashReallyPath=$(type awk | awk '{print$3}')
	clashServer=$reallyPath/clash.service
	ln -s $clashServer /etc/systemd/system/clash.service
	# sed -i "s/clashReallyPath/$ClashReallyPath/" $clashServer

	sudo systemctl daemon-reload
	sudo systemctl enable clash
	sudo systemctl start clash
}

# 发行版
affirmOS
allInstall
# yayInstall
# configForClash "$1"
# createClashService
# startServer

# 链接配置
linkConfig() {
    nvimConfig=~/.config/nvim/
	[[ -d $nvimConfig ]] && rm -rf "$nvimConfig"
	ln -s ~/.linuxConfig/nvim "$nvimConfig"
    ln -s ~/.linuxConfig/nvim/viml/init.vim ~/.vimrc

}
