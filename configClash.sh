#! /bin/bash

if [[ -n $1 && --help =~ $1 ]]; then
	echo "第一个参数跟clash订阅链接"
#    exit 0
fi
dirPath=~/.linuxConfig
clash_dir="/etc/clash"
clash_config=$clash_dir/config.yaml

if [[ -d $clash_dir ]]; then
	echo -n ""
else
	sudo mkdir $clash_dir
fi

# $1 写clash链接
if [[ -n $1 ]]; then
	sudo wget -O $clash_config $1
fi
sudo sed -i 's/^mixed-port:.*/mixed-port: 7890/' $clash_config
sudo sed -i 's/enhanced-mode:.*/enhanced-mode: fake-ip/' $clash_config
sudo sed -i 's/^mode:.*/mode: rule/' $clash_config
sudo sed -i 's/^allow-lan:.*/allow-lan: true/' $clash_config
unset clash_dir clash_config

createClashService() {
	# ClashReallyPath=$(type awk | awk '{print$3}')
	clashServer=$dirPath/clash.service
	if [[ -f $clashServer ]]; then
		echo "已有clash服务"
	else
		sudo cp $clashServer /etc/systemd/system/clash.service
	fi
	# sed -i "s/clashReallyPath/$ClashReallyPath/" $clashServer

	sudo systemctl daemon-reload
	sudo systemctl enable clash
	sudo systemctl start clash
	unset clashServer dirPath
}

createClashService
