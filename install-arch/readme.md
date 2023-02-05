# 简述脚本的使用
自行想办法复制此脚本，然后使用

运行1之前，先用 `./set-mirrors.sh` 或 `./set-fast-mirrors.sh` 设置软件源,这两个脚本会调用 `./set-pacman.sh` 脚本设置， 不可改变它们和 `./set-pacman.sh` 脚本的位置关系。

挂载后运行1，根据提示继续运行234

## set-pacman 脚本说明
会安装aur 助手`yay、paru` 和加速版pacman `powerpill`,在其他脚本中会优先使用`powerpill`。

其中powerpill 需要签名文件所以需要判/etc/pacman.conf 文件是否有SigLevel字段
