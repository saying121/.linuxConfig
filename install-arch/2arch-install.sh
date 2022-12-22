#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
# 用~/.xprofile更好
# echo 'LANG=en_US.UTF-8' >>/etc/locale.conf

sudo timedatectl set-ntp true
sudo hwclock --systohc

echo "Input root's passwd"
passwd
read -p 'Creat a new user,input your username: ' username
useradd -m -G wheel "$username"
passwd "$username"
unset username
