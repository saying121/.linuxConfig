#!/bin/bash

# 这个脚本执行一次就行
sed -i 's/^#Color/Color/' /etc/pacman.conf

echo '
[multilib]
Include = /etc/pacman.d/mirrorlist

[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = http://mirrors.163.com/archlinux-cn/$arch' >>/etc/pacman.conf
