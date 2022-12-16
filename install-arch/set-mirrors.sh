#! /bin/bash

# 修改/etc/pacman.d/mirrorlist,直接在文件开始插入中国源
sudo sed -i '1iServer = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sudo sed -i '1iServer = http://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sudo sed -i '1iServer = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sudo sed -i '1iServer = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sudo sed -i '1iServer = http://mirrors.163.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist

sudo pacman -Syyu
sudo timedatectl set-ntp true
sudo hwclock --systohc
