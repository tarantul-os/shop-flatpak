#!/bin/bash

sel1=$(echo 'install
uninstall' | rofi -dmenu -dpi 200)

if [ "$sel1" = "install" ]
then
	sel2=$(flatpak search "" --columns=application | rofi -dmenu -dpi 200)
	if [ "$sel2" != "" ]
	then
		echo "installing... You can close this window" | rofi -dmenu -dpi 200 &
		flatpak install $sel2 -y
		killall rofi
		echo "installed" | rofi -dmenu -dpi 200 &
	fi
elif [ "$sel1" = "uninstall" ]
then
	sel2=$(flatpak list --columns=application | rofi -dmenu -dpi 200)
	if [ "$sel2" != "" ]
	then
		echo "uninstalling... You can close this window" | rofi -dmenu -dpi 200 &
		flatpak uninstall $sel2 -y
		killall rofi
		echo "uninstalled" | rofi -dmenu -dpi 200 &
	fi
fi
