#!/bin/sh

# Wallpaper setter plugin for CliFM
# Written by L. Abramovich

# Dependencies: file, and feh, xsetbg (xloadimage), or hsetroot

SUCCESS=0
ERROR=1

if [ -z "$1" ]; then
	printf "CliFM: You must specify an image file\n" >&2
	exit $ERROR
fi

if ! [ "$(which file 2>/dev/null)" ]; then
	printf "CliFM: file: Command not found\n" >&2
	exit $ERROR
fi

if ! file -bi "$1" | grep -q "image/"; then
	printf "CliFM: %s: Not an image file\n" "$1" >&2
	exit $ERROR
fi

if [ "$(which feh 2>/dev/null)" ]; then
	if feh --no-fehbg --bg-fill "$1"; then
		exit $SUCCESS
	fi
elif [ "$(which xsetbg 2>/dev/null)" ]; then
	if xsetbg -center "$1"; then
		exit $SUCCESS
	fi
elif [ "$(which hsetroot 2>/dev/null)" ]; then
	if hsetroot -center "$1"; then
		exit $SUCCESS
	fi
else
	printf "CliFM: No wallpaper setter found. Install either feh, \
xloadimage, or hsetroot\n" >&2
	exit $ERROR
fi

exit $ERROR
