#! /bin/bash

timedatectl set-ntp true
# 基础
pacstrap /mnt base base-devel linux linux-firmware

genfstab -U /mnt >>/mnt/etc/fstab
echo 'run: arch-chroot /mnt'
