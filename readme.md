# 个人应用配置
## install-arch是安装arch用的脚本
安装arch时，非数字开头的运行一次就行

先运行~/.linuxConfig/configClash.sh 后跟 clash链接，来连接github

## 如果要使用本配置，执行,包含ranger的插件
    git clone --recursive https://github.com/saying121/.linuxConfig.git ~/.linuxConfig

## 安装完成后

    # 正常用就运行，包含常用的软件什么的
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
