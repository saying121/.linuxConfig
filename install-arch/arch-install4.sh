#! /bin/bash

# kde桌面，终端
pacman -S --needed \
	kitty plasma packagekit-qt5 packagekit appstream-qt appstream \
    networkmanager wget

# 中文字体
pacman -S --needed \
	adobe-source-han-serif-cn-fonts \
	adobe-source-han-sans-cn-fonts \
	wqy-zenhei \
	wqy-microhei \
	noto-fonts-cjk \
	noto-fonts-emoji \
	noto-fonts-extra \
	ttf-hack tf-dejavu

# fcitx5的设置
echo '
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus' >> /etc/environment

systemctl enable sddm NetworkManager
systemctl start sddm NetworkManager
echo 'exit 后执行 umount -R /mnt'
echo "手动编辑visudo命令中的%wheel ALL=(ALL:ALL)ALL后重启"
