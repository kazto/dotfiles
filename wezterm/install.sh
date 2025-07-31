#!/bin/sh


if [ -d /mnt/c ]
then
	mkdir -p /mnt/c/Users/$USER/.config/wezterm/
	cp wezterm.lua /mnt/c/Users/$USER/.config/wezterm/
fi

