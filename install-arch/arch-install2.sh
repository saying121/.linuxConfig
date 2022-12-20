#!/bin/bash

echo '127.0.0.1   localhost
::1         localhost
127.0.1.1   Mila' >>/etc/hosts

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
# echo 'LANG=en_US.UTF-8' >>/etc/locale.conf

echo "Input root's passwd"
passwd
read -p 'Creat a new user,input your username: ' username
useradd -m -G wheel "$username"
passwd "$username"
unset username
