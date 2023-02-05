#!/bin/bash

if [[ $(grep -c SigLevel /etc/pacman.conf) != 0 ]]; then
	pacMan="powerpill -S --needed --noconfirm"
else
    pacMan="pacman -S --needed --noconfirm"
fi

# kde桌面，终端
sudo $pacMan xorg kitty \
    plasma packagekit-qt5 packagekit appstream-qt appstream \
	networkmanager wget sddm

# 中文字体
sudo $pacMan adobe-source-han-serif-cn-fonts \
    adobe-source-han-sans-cn-fonts \
	wqy-zenhei wqy-microhei noto-fonts-cjk noto-fonts-emoji \
	noto-fonts-extra

sudo $pacMan fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-moegirl \
	fcitx5-pinyin-zhwiki fcitx5-material-color vim-fcitx xclip \
    vim zsh wget curl neovim dhcpcd iwd sudo git

unset $pacMan

# fcitx5的设置
if [[ $(grep -c fcitx /etc/environment) = 0 ]]; then
	echo '
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus' | sudo tee -a /etc/environment
fi

echo 'KEYMAP=us
FONT=tcvn8x16
FONT_MAP=8859-2
' | sudo tee -a /etc/vconsole.conf

read -pr 'Input your pc name: ' pc_name

if [[ $(grep -c "$pc_name" /etc/hosts) = 0 ]]; then
	echo "127.0.0.1   localhost
::1         localhost
127.0.1.1   $pc_name" | sudo tee -a /etc/hosts
fi

if [[ $(grep -c "$pc_name" /etc/hostname) = 0 ]]; then
	echo "$pc_name" | sudo tee -a /etc/hostname
fi
systemctl enable sddm NetworkManager
# 手动start
# systemctl start sddm NetworkManager
echo 'run ^d/exit then run "umount -R /mnt"'
