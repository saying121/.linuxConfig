# 个人应用配置
## install-arch是安装arch用的脚本
安装arch时，非数字开头的运行一次就行

先运行~/.linuxConfig/configClash.sh 后跟 clash链接，来连接github

## 如果要使用本配置，执行,包含ranger的插件
    git clone --recursive https://github.com/saying121/.linuxConfig.git ~/.linuxConfig

## 安装完成后

    # 正常用就运行保含常用的软件什么的
    ~/.linuxConfig/install.sh

    # kde+i3就接着运行
    ~/.linuxConfig/i3/use-i3.sh

    # 换回kwin运行，有kwin平铺脚本，可在窗口管理关闭
    ~/.linuxConfig/i3/use-kwin.sh

    # kde+i3+wallpaper运行,会安装wallpaper-engine插件
    ~/.linuxConfig/kde/wallpaper-engine-kde-plugin.sh

### 切换配置
    # 导入配置，在kde和i3目录下的.knsv文件
    konsave -i *.knsv

    # 列出配置选项
    konsave -l

    # 导入配置
    konsave -a profile


## 摘自archwiki,powerpill

疑难解答
如果你得到 <repo>.db.sig 文件的 [err]:

   b5d7d7|ERR |       0B/s|/var/lib/pacman/sync/extra.db.sig
   899e91|ERR |       0B/s|/var/lib/pacman/sync/multilib.db.sig
   8fcc32|ERR |       0B/s|/var/lib/pacman/sync/core.db.sig
   85eb3d|ERR |       0B/s|/var/lib/pacman/sync/community.db.sig
这是因为该存储库缺少签名文件，而且你还没有在 /etc/pacman.conf 中显式设置

SigLevel = PackageRequired

在/etc/pacman.conf 每个[源]，添加上面那行
