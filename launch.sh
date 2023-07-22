#!/bin/bash

sel1=$(echo 'install
uninstall' | rofi -dmenu )

if [ "$sel1" = "install" ]
then
	sel2=$(flatpak search "" --columns=application | rofi -dmenu )
	if [ "$sel2" != "" ]
	then
		echo "installing... You can close this window" | rofi -dmenu  &
		flatpak install $sel2 -y
		killall rofi
		echo "installed" | rofi -dmenu  &
	fi
elif [ "$sel1" = "uninstall" ]
then
	sel2=$(flatpak list --columns=application | rofi -dmenu )
	if [ "$sel2" != "" ]
	then
		echo "uninstalling... You can close this window" | rofi -dmenu  &
		flatpak uninstall $sel2 -y
		killall rofi
		echo "uninstalled" | rofi -dmenu  &
	fi
fi
