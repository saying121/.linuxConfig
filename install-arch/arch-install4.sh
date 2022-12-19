#! /bin/bash

# kde桌面，终端
sudo pacman -S --needed \
	xorg kitty plasma packagekit-qt5 packagekit appstream-qt appstream \
	networkmanager wget sddm

# 中文字体
sudo pacman -S --needed \
	adobe-source-han-serif-cn-fonts \
	adobe-source-han-sans-cn-fonts \
	wqy-zenhei \
	wqy-microhei \
	noto-fonts-cjk \
	noto-fonts-emoji \
	noto-fonts-extra \
	tf-dejavu

sudo pacman -S --needed \
	fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-moegirl \
	fcitx5-pinyin-zhwiki fcitx5-material-color vim-fcit xclip

# fcitx5的设置
echo '
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus' >>/etc/environment

systemctl enable sddm NetworkManager
# systemctl start sddm NetworkManager
echo 'exit 后执行 umount -R /mnt'
echo "Manual edit visudo command's %wheel ALL=(ALL:ALL)ALL"
