#!/bin/bash

# RTL881cu
sudo pacman -S --noconfirm linux-headers dkms git bc iw nano sudo usb_modeswitch
# linux-docs
git clone https://github.com/morrownr/8821cu-20210118.git ~/Downloads/RTL8811CU
cd ~/Downloads/RTL8811CU || exit

# # Realtek 8211CU Wifi AC USB
# ATTR{idVendor}=="0bda", ATTR{idProduct}=="c811", RUN+="/usr/sbin/usb_modeswitch -K -v 0bda -p c811"

sudo ./install-driver.sh


