#!/bin/sh

# CliFM plugin to find/open/cd files in CWD using fzf/Rofi
# Written by L. Abramovich

SUCCESS=0
ERROR=1

if [ "$(which fzf)" ]; then
	finder="fzf"

elif [ "$(which rofi)" ]; then
	finder="rofi"

else
	printf "CliFM: No finder found. Install either fzf or rofi\n" >&2
	exit $ERROR
fi

if [ "$finder" = "fzf" ]; then
	# shellcheck disable=SC2012
	FILE="$(ls -A --group-directories-first --color=always | \
			fzf --ansi --prompt "CliFM> ")"
else
	# shellcheck disable=SC2012
	FILE="$(ls -A | rofi -dmenu -p CliFM)"
fi

if [ -n "$FILE" ]; then
	printf "%s\n" "$FILE" > "$CLIFM_BUS"
fi

exit $SUCCESS
