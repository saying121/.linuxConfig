#! /bin/bash

if [[ $(grep -c arch /etc/os-release) != 0 && ! $(type clash) =~ clash ]]; then
	sudo pacman -S --need clash
fi
if [[ -n $1 && --help =~ $1 ]]; then
	echo '第一个参数跟clash订阅链接'
#    exit 0
fi
clash_dir="/etc/clash"
clash_config=/etc/clash/config.yaml

if [[ ! -d $clash_dir ]]; then
	sudo mkdir $clash_dir
fi

# $1 写clash链接
if [[ -n $1 ]]; then
	sudo wget -O $clash_config $1
else
	echo '没有填写链接，不更新配置'
fi
# sudo sed -i 's/^mixed-port:.*/mixed-port: 7890/' $clash_config
# sudo sed -i 's/enhanced-mode:.*/enhanced-mode: fake-ip/' $clash_config
# sudo sed -i 's/^mode:.*/mode: rule/' $clash_config
# sudo sed -i 's/^allow-lan:.*/allow-lan: true/' $clash_config
unset clash_dir clash_config

if [[ -f /etc/systemd/system/clash.service ]]; then
	echo '已有clash服务'
else
	sudo cp ~/.linuxConfig/clash.service /etc/systemd/system/clash.service
fi

# 确认clash路径
if [[ $(type clash) =~ /usr/bin/clash ]]; then
	sudo sed -i 's#ExecStart=.* -f#ExecStart=/usr/bin/clash -f#' /etc/systemd/system/clash.service
elif [[ $(type clash) =~ /snap/bin/clash ]]; then
	sudo sed -i 's#ExecStart=.* -f#ExecStart=/snap/bin/clash -f#' /etc/systemd/system/clash.service
fi

sudo systemctl daemon-reload
sudo systemctl enable clash
sudo systemctl start clash
