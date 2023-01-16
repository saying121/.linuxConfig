#!/bin/bash

sudo systemctl stop reflector.service
sudo pacman -S --needed pacman-contrib

# 修改/etc/pacman.d/mirrorlist,直接在文件开始插入中国源
echo 'Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = http://mirrors.163.com/archlinux/$repo/os/$arch
Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch
Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' | sudo tee /etc/pacman.d/mirrorlist

# 配置pacman.conf
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf

sudo sed -i "s/^#\[multilib\]/\[multilib\]/" /etc/pacman.conf

if [[ $(grep "\[archlinuxcn\]" -c /etc/pacman.conf) = 0 ]]; then
	echo '
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = http://mirrors.163.com/archlinux-cn/$arch' | sudo tee -a /etc/pacman.conf
fi

if [[ $(grep -C1 "\[core\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sudo sed -i '/\[core\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi
if [[ $(grep -C1 "\[extra\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sudo sed -i '/\[extra\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi
if [[ $(grep -C1 "\[community\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sudo sed -i '/\[community\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi

if [[ $(grep -C2 "\[multilib\]" /etc/pacman.conf | grep -c '^Include') = 0 ]]; then
	sudo sed -i '/\[multilib\]/ a Include = /etc/pacman.d/mirrorlist' /etc/pacman.conf
fi
if [[ $(grep -C1 "\[multilib\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sudo sed -i '/\[multilib\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi

if [[ $(grep -C1 "\[archlinuxcn\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sudo sed -i '/\[archlinuxcn\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi
if [[ $(grep -c fileencoding /etc/pacman.conf) = 0 ]]; then
	echo "
# vim:fileencoding=utf-8:ft=conf:foldmethod=marker" | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Syyuu

# vim:fileencoding=utf-8:ft=sh:foldmethod=marker
