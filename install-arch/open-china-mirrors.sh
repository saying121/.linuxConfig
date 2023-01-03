#!/bin/bash

# 这个脚本执行一次就行
sed -i 's/^#Color/Color/' /etc/pacman.conf

sed -i "s/^#\[multilib\]/\[multilib\]/" /etc/pacman.conf
sed -i "s!^#Include = /etc/pacman.d/mirrorlist!Include = /etc/pacman.d/mirrorlist!" /etc/pacman.conf

if [[ $(grep "\[archlinuxcn\]" -c /etc/pacman.conf) == 0 ]]; then
	echo '
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = http://mirrors.163.com/archlinux-cn/$arch' >>/etc/pacman.conf
fi

if [[ $(grep -C1 "\[core\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sed -i '/\[core\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi
if [[ $(grep -C1 "\[extra\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sed -i '/\[extra\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi
if [[ $(grep -C1 "\[community\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sed -i '/\[community\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi
if [[ $(grep -C1 "\[multilib\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sed -i '/\[multilib\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi
if [[ $(grep -C1 "\[archlinuxcn\]" /etc/pacman.conf | grep -c SigLevel) = 0 ]]; then
	sed -i '/\[archlinuxcn\]/ a SigLevel = PackageRequired' /etc/pacman.conf
fi

if [[ $(grep -c fileencoding) = 0 ]]; then
	echo '# vim:fileencoding=utf-8:ft=conf:foldmethod=marker' >>/etc/pacman.conf
fi
