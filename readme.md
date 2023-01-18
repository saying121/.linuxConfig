# 个人应用配置
## install-arch是安装arch用的脚本
安装arch时，先set-mirrors。

挂载后运行1，根据提示继续运行234

## 先运行

    # 后跟 clash订阅链接，来连接github
    ~/.linuxConfig/scripts/configClash.sh

## 如果要使用本配置，执行下面代码，包含ranger的插件
    $ git clone --recursive https://github.com/saying121/.linuxConfig.git ~/.linuxConfig

####  也可以执行
    $ git clone https://github.com/saying121/.linuxConfig.git ~/.linuxConfig
    # 然后拉子自模块
    $ git submodule update --init --recursive

## clone完成后

    # 正常用就运行，包含常用的软件
    $ ~/.linuxConfig/install.sh

    # kde+i3就运行
    $ ~/.linuxConfig/i3/use-i3.sh

    # 换回kwin运行
    $ ~/.linuxConfig/i3/use-kwin.sh
    # 切换配置有些问题，因为配置经常会变，默认为i3的配置，默认没有问题


### 切换配置
    # 导入配置，在kde目录下的*.knsv文件
    $ konsave -i *.knsv

    # 列出配置选项
    $ konsave -l

    # 应用配置
    $ konsave -a profile

