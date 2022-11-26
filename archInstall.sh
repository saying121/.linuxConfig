# 在挂载后执行
# 修改/etc/pacman.d/mirrorlist
sed -i '1iServer = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = http://mirrors.163.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = http://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist
sed -i '1iServer = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorslist

timedatectl set-up true
pacman -Syyu
# 基础
pacstrap /mnt \
	base base-devel \
	linux linux-firmware
genfstab -U /mnt >>/mnt/etc/fstab
arch-chroot /mnt

echo '127.0.0.1 localhost' >>/etc/hostname
echo '::1 localhost' >>/etc/hostname
echo '127.0.0.1 Mila' >>/etc/hostname

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock -systohc

sed -i 's/#en_US.UTF-8.UTF-8/en_US.UTF-8.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >>/etc/locale.conf

sed -i 's/#Color/Color/' /etc/pacman.conf
echo '[multilib]' >>/etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >>/etc/pacman.conf
echo '[archlinuxcn]' >>/etc/pacman.conf
echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >>/etc/pacman.conf
echo 'Server = http://mirrors.163.com/archlinux-cn/$arch' >>/etc/pacman.conf

passwd
read -p 'import your username: ' username
useradd -m -G wheel "$username"
passwd "$username"
unset username

# 引导和微码
if [[ $(lscpu | grep -c AMD) != 0 ]]; then
	sudo pacman -S amd-ucode
elif [[ $(lscpu | grep -c Intel) != 0 ]]; then
	sudo pacman -S intel-ucode
fi
pacman -S \
	grub efibootmgr os-porber

# 安装grub引导
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S \
	kitty plasma packagekit-qt5 packagekit appstream-qt appstream

# 中文字体
sudo pacman -S \
	adobe-source-han-serif-cn-fonts \
	adobe-source-han-sans-cn-fonts \
	wqy-zenhei \
	wqy-microhei \
	noto-fonts-cjk \
	noto-fonts-emoji \
	noto-fonts-extra \
	ttf-dejavu

exit
umount -R /mnt
echo "手动编辑visudo命令中的%wheel ALL=(ALL:ALL)ALL后重启"
