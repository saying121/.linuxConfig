#!/bin/bash

polybartheme() {
	git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
	cd polybar-themes || return
	chmod +x setup.sh
	./setup.sh
	cd ..
	rm -rf polybar-themes
}
if [[ ! -d ~/.config/polybar/hack ]]; then
	polybartheme
fi

sudo pacman -S --needed pkg-config libuv cairo libxcb python3 xcb-proto xcb-util-image xcb-util-wm python-sphinx python-packaging \
	xcb-util-cursor xcb-util-xrm xcb-util-xrm alsa-lib libpulse mpd libmpdclient libcurl-compat libcurl-gnutls wireless_tools

sudo systemctl enable mpd
sudo systemctl start mpd

# sed -i "s#^;;password = mysecretpassword#password = mysecretpassword#" ~/.config/polybar/hack/modules.ini

# sed -i "s#^;*host = 127.0.0.1#host = 127.0.0.1#" ~/.config/polybar/hack/modules.ini
# sed -i "s#^;*port = 6600#port = 7000#" ~/.config/polybar/hack/modules.ini

cp ~/.linuxConfig/i3/polybar/hack-modules.ini ~/.config/polybar/hack/modules.ini
cp ~/.linuxConfig/i3/polybar/hack-user_modules.ini ~/.config/polybar/hack/hack-user_modules.ini
cp ~/.linuxConfig/i3/polybar/hack-config.ini ~/.config/polybar/hack/hack-config.ini
