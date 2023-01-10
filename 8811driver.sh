#!/bin/bash

sudo pacman -S --noconfirm linux-headers dkms git bc iw
# linux-docs
git clone https://github.com/morrownr/88x2bu-20210702.git ~/Downloads/RTL8811CU
cd ~/Downloads/RTL8811CU || exit
sudo ./install-driver.sh
