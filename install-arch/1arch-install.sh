#!/bin/bash

echo 'cfdisk /deb/xxx

efi : mkfs.vfat /dev/xxx
/ and home : mkfs.ext4 /dev/xxx

root
mount /dev/forroot /mnt

efi
mkdir /mnt/boot
mount /dev/forefi /mnt/boot

home
mkdir /mnt/home
mount /dev/forhome /mnt/home

Change mirrors and link network before run the script.yes/no'

read -r answer
if [[ ! $answer = yes ]]; then
	exit 0
fi

timedatectl set-ntp true
# 基础
pacstrap /mnt base base-devel linux linux-firmware

genfstab -U /mnt >>/mnt/etc/fstab
echo 'run: arch-chroot /mnt'
