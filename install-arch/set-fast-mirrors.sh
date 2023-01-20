#!/bin/bash

~/.linuxConfig/install-arch/set-pacman.sh

# 获取最快的所有中国镜像,但是镜像质量不行
curl -s "https://archlinux.org/mirrorlist/?country=CN&protocol=https&use_mirror_status=on" |
	sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n all - |
	sudo tee /etc/pacman.d/mirrorslist

sudo pacman -Syyuu
