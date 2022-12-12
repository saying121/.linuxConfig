#! /bin/bash

if [[ ! -d ~/.config/flameshot ]]
then
    mkdir -p ~/.config/flameshot
fi
if [[ -f ~/.config/flameshot/flameshot.ini ]]
    then
        rm ~/.config/flameshot/flameshot.ini
fi

ln -s "$HOME/.linuxConfig/configs/flameshot.ini" ~/.config/flameshot/flameshot.ini
echo '链接了flameshot配置'
