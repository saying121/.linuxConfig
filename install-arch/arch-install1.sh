#! /bin/bash

# 修改/etc/pacman.d/mirrorlist,直接在文件开始插入中国源
sed -i '1iServer = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = http://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = http://mirrors.163.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist

pacman -Syyu
timedatectl set-up true
# 基础
pacstrap /mnt \
	base base-devel linux linux-firmware

genfstab -U /mnt >>/mnt/etc/fstab
echo 'run arch-chroot /mnt'
