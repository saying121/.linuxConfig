#!/bin/bash

# 找个空目录执行
sudo pacman -S --needed extra-cmake-modules plasma-framework gst-libav \
base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel vulkan-headers cmake

# Download source
git clone https://github.com/catsout/wallpaper-engine-kde-plugin.git
cd wallpaper-engine-kde-plugin || exit

# Download submodule (glslang)
git submodule update --init

# Configure
# 'USE_PLASMAPKG=ON': using plasmapkg2 tool to install plugin
mkdir build && cd build || exit
cmake .. -DUSE_PLASMAPKG=ON

# Build
make -j$nproc

# Install package (ignore if USE_PLASMAPKG=OFF for system-wide installation)
make install_pkg
# install lib
sudo make install

cd ..
# rm -rf wallpaper-engine-kde-plugin

~/.local/bin/konsave -i ~/.linuxConfig/kde/kdei3wallpaper.knsv
~/.local/bin/konsave -a ~/.linuxConfig/kde/kdei3wallpaper.knsv

# Uninstall
# remove files that list in wallpaper-engine-kde-plugin/build/install_manifest.txt
# plasmapkg2 -r ~/.local/share/plasma/wallpapers/com.github.casout.wallpaperEngineKde
