# **input-remapper 按键映射说明**
可以手动加载映射，也可以在`./config.json`文件autoload里面加上想要的预设(图形界面添加自动加载或者手动添加)

    # 列出所有设备
    $ sudo input-remapper-control --list-devices
    # 加载预设例子
    $ input-remapper-control --command start --device "Keyboard K380 Keyboard" --preset "capslock+"
## 预设capslock+
### capslock相关
长按capslock不影响与capslock无关的键输入。
大部分capslock+组合键内容抄自capslock+项目关于Linux issue
|`capslock +`           |按下capslock后按下其他键的行为     |
|:-:                    |:-:                                |
|长按capslock           |`do nothing`                       |
|按capslock,150ms内释放 |`capslock`                         |
|                       |                                   |
|`backspace`            |删除整行                           |
|`space`                |`return`                           |
|`return`               |新起一行                           |
|                       |                                   |
|`e/d/s/f`              |`↑/↓/←/→`                          |
|                       |                                   |
|`a/g`                  |向右/左移动一个单词                |
|                       |                                   |
|`;`/`/`                |`Home/End`                         |
|                       |                                   |
|`p/n`                  |`ctrl+n/p`                         |
|                       |                                   |
|`w/r`                  |`backspace/delete`(前后删除)       |
|                       |                                   |
|`q`                    |ctrl+w (终端向前删除一个单词)      |
|`t`                    |alt+d (终端向后删除一个单词)       |
|                       |                                   |
|`z/x/c/v`              |`ctrl+z/x/c/v`                     |
|                       |                                   |
|`i/k/j/l`              |向上/下/左/右选取文字              |
|                       |                                   |
|`h/m`                  |左/右选取一个单词                  |
|                       |                                   |
|`u`                    |选取到行首                         |
|`o`                    |选取到行尾                         |
|                       |                                   |
|`,/.`                  |`ctrl+,/.`                         |
|                       |                                   |
|`-`                    |上翻页                             |
|`=`                    |下翻页                             |

### 空格相关
长按空格不影响与空格无关的键输入
|`space +`                      |按下space后的行为                  |
|:-:                            |:-:                                |
|长按space                      |`do nothing`                       |
|按space,200ms内释放            |`space`                            |
|                               |                                   |
|`a/s/d/f/g/h/j/k/l/;/return`   |`1/2/3/4/5/6/7/8/9/0/-/=`          |
|                               |                                   |
|`tab/q/w/e/r/t/y/u/i/o/p/[/]`  |`~/!/@/#/$/%/^/&/*/(/)/_/+`        |
|                               |                                   |
|`n`                            |`esc`                              |
|                               |                                   |
|`c`                            |`+`                                |   

|`alt_right`                    |`shift_right`                      |
|:-:                            |:-:                                |
