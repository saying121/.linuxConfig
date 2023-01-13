#!/usr/bin/env bash

## Available Styles
#
## style-1     style-2     style-3     style-4     style-5

dir="$HOME/.config/rofi/launchers/type-6"
theme='style-7'

pkexec env PATH=$PATH DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY \
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
