#! /bin/bash

echo '127.0.0.1 localhost' >>/etc/hosts
echo '::1 localhost' >>/etc/hosts
echo '127.0.0.1 Mila' >>/etc/hosts

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >>/etc/locale.conf

sed -i 's/#Color/Color/' /etc/pacman.conf
echo '[multilib]
Include = /etc/pacman.d/mirrorlist
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = http://mirrors.163.com/archlinux-cn/$arch' >>/etc/pacman.conf

echo "root's passwd"
passwd
read -p 'import your username: ' username
useradd -m -G wheel "$username"
passwd "$username"
unset username
