#!/bin/bash

rm -rf ~/.local/share/wallpaperengine

mkdir ~/.local/share/wallpaperengine

cd ~/.local/share/wallpaperengine

git init

git remote add -f origin https://github.com/Almamu/linux-wallpaperengine.git

git config core.sparsecheckout true

echo "share" >> .git/info/sparse-checkout

git checkout main

yay -S linux-wallpaperengine-git

# cd ~/.local/share/wallpaperengine
# git pull
