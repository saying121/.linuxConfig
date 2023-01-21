#! /bin/bash

# 引导和微码
if [[ $(lscpu | grep -c AMD) != 0 ]]; then
	sudo pacman -S --needed --noconfirm amd-ucode
elif [[ $(lscpu | grep -c Intel) != 0 ]]; then
	sudo pacman -S --needed --noconfirm intel-ucode
fi
pacman -S --needed --noconfirm grub efibootmgr os-prober

# 安装grub引导
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg
