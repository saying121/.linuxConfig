#!/bin/bash

./set-pacman.sh

# 获取最快的所有中国镜像,但是镜像质量不行。有的源快，但是不稳定，曾经遇到过一次
curl -s "https://archlinux.org/mirrorlist/?country=CN&protocol=https&use_mirror_status=on" |
	sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n all - |
	sudo tee /etc/pacman.d/mirrorslist

sudo pacman -Syyuu --noconfirm
