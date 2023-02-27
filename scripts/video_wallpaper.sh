#!/bin/bash

wallpaperPath=~/.local/share/Steam/steamapps/workshop/content/431960
wallpaperName=$(cd ~/.local/share/Steam/steamapps/workshop/content/ && find ./431960 -name '*.mp4')

size=$(echo $wallpaperName | awk -F .mp4 '{print NF}')

while :; do
	rand=$(($RANDOM % $size + 1))
	var=$(echo $wallpaperName | awk -F .mp4 '{print $"'$rand'"}').mp4
    echo "$var"

	# xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv -wid WID --loop --no-audio $var
	# video-wallpaper.sh --start "$var"
	sleep 10
done
