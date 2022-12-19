#!/bin/bash

echo 'Change mirrors and link network before run the script.'
echo 'Have you already done this yes/no'

read -r answer
if [[ ! $answer = yes ]]; then
	exit 0
fi

timedatectl set-ntp true
# 基础
pacstrap /mnt base base-devel linux linux-firmware

genfstab -U /mnt >>/mnt/etc/fstab
echo 'run: arch-chroot /mnt'
