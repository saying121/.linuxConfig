#! /bin/bash

# kde桌面，终端
pacman -S --needed \
	kitty plasma packagekit-qt5 packagekit appstream-qt appstream

# 中文字体
pacman -S --needed \
	adobe-source-han-serif-cn-fonts \
	adobe-source-han-sans-cn-fonts \
	wqy-zenhei \
	wqy-microhei \
	noto-fonts-cjk \
	noto-fonts-emoji \
	noto-fonts-extra \
	ttf-dejavu

echo 'exit 后执行 umount -R /mnt'
echo "手动编辑visudo命令中的%wheel ALL=(ALL:ALL)ALL后重启"
