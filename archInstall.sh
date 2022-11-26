#! /bin/bash

echo '确保你已经挂载
根目录:/mnt
ESP分区:/boot
可有可无交换分区:/swap
可单独分的:/home 等等
yes/no,谨慎选择'
read answer
if [[ $answer = y || $answer = yes || $answer = Y || $answer = YES ]]; then
	echo -n ''
else
	echo '请先挂载'
	echo '相关操作:'
	echo ------------------------------
	echo '一、先cfdisk分区'
	echo "512MB的ESP
1-4G可有可无的swap分区
几十G的/(根目录)
可单独分的/home目录"
	echo ------------------------------
	echo "二、格式化"
	echo "1.ESP分区
mkfs.vfat /dev/diskESP"
	echo "2.swap分区
mkswap /dev/diskSWAP
swapon /dev/diskSWAP"
	echo "3.根目录、/home目录
mkfs.ext4 /dev/diskROOT
mkfs.ext4 /dev/diskHOME"
	echo ------------------------------
	echo '三、挂载分区'
	echo "1.挂载根目录
mount /dev/diskROOT /mnt"
	echo "2.挂载/boot
mkdir /mnt/boot
mount /dev/diskBOOT /mnt/boot"
	echo "3.挂载/home
mkdir /mnt/home
mount /dev/disk? /mnt/home"
	exit 0
fi
unset answer

# 修改/etc/pacman.d/mirrorlist,直接在文件开始插入中国源
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
	sudo pacman -S --needed amd-ucode
elif [[ $(lscpu | grep -c Intel) != 0 ]]; then
	sudo pacman -S --needed intel-ucode
fi
pacman -S --needed \
	grub efibootmgr os-porber

# 安装grub引导
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S --needed \
	kitty plasma packagekit-qt5 packagekit appstream-qt appstream

# 中文字体
sudo pacman -S --needed \
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
