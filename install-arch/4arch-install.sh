#!/bin/bash

# kde桌面，终端
sudo pacman -S --needed xorg kitty \
    plasma packagekit-qt5 packagekit appstream-qt appstream \
	networkmanager wget sddm

# 中文字体
sudo pacman -S --needed adobe-source-han-serif-cn-fonts \
    adobe-source-han-sans-cn-fonts \
	wqy-zenhei wqy-microhei noto-fonts-cjk noto-fonts-emoji \
	noto-fonts-extra tf-dejavu

sudo pacman -S --needed \
	fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-moegirl \
	fcitx5-pinyin-zhwiki fcitx5-material-color vim-fcitx xclip \
    vim zsh wget curl neovim dhcpcd iwd sudo git

# fcitx5的设置
if [[ $(grep -c fcitx /etc/environment) = 0 ]]; then
	echo '
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus' | sudo tee -a /etc/environment
fi

if [[ $(grep -c Mila /etc/hosts) = 0 ]]; then
	echo '127.0.0.1   localhost
::1         localhost
127.0.1.1   Mila' | sudo tee -a /etc/hosts
fi

systemctl enable sddm NetworkManager
# 手动start
# systemctl start sddm NetworkManager
echo 'run ^d/exit then run "umount -R /mnt"'
echo "Manual edit visudo command's %wheel ALL=(ALL:ALL)ALL"
