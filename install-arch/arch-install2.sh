#! /bin/bash

echo '127.0.0.1 localhost' >>/etc/hostname
echo '::1 localhost' >>/etc/hostname
echo '127.0.0.1 Mila' >>/etc/hostname

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock -systohc

sed -i 's/#en_US.UTF-8.UTF-8/en_US.UTF-8.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >>/etc/locale.conf

sed -i 's/#Color/Color/' /etc/pacman.conf
echo '[multilib]' >>/etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >>/etc/pacman.conf
echo '[archlinuxcn]' >>/etc/pacman.conf
echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >>/etc/pacman.conf
echo 'Server = http://mirrors.163.com/archlinux-cn/$arch' >>/etc/pacman.conf

echo "root's passwd"
passwd
read -p 'import your username: ' username
useradd -m -G wheel "$username"
passwd "$username"
unset username
