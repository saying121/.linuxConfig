#! /bin/bash

sudo pacman -S --needed pacman-contrib

# 修改/etc/pacman.d/mirrorlist,直接在文件开始插入中国源
sudo sed -i '1iServer = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sudo sed -i '1iServer = http://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sudo sed -i '1iServer = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sudo sed -i '1iServer = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sudo sed -i '1iServer = http://mirrors.163.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist

# 获取最快的所有中国镜像
# curl -s "https://archlinux.org/mirrorlist/?country=CN&protocol=https&use_mirror_status=on" |
# 	sed -e 's/^#Server/Server/' -e '/^#/d' | \
#     rankmirrors -n all - | \
#     sudo tee /etc/pacman.d/mirrorslist
sudo pacman -Syyuu
sudo timedatectl set-ntp true
sudo hwclock --systohc
