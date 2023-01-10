#!/bin/bash

systemctl --user unmask plasma-kwin_x11.service
systemctl --user disable plasma-i3.service
# kde+kwin脚本
~/.local/bin/konsave -i ~/.linuxConfig/kde/kdekwin.knsv
~/.local/bin/konsave -a ~/.linuxConfig/kde/kdekwin.knsv
