#!/bin/bash

systemctl --user unmask plasma-kwin_x11.service
systemctl --user disable plasma-i3.service

~/.local/bin/konsave -i ~/.linuxConfig/kde/kdekwin.knsv
~/.local/bin/konsave -a kdekwin
