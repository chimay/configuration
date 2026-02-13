#!/usr/bin/env sh

# EXTERN_LINK / $W3M_CURRENT_LINK = under cursor
# EXTERN / $W3M_URL               = current page

url="$W3M_URL"

#echo "W3m-control: BACK"

#printf "%b" "$url" > /tmp/clipbrd.txt

#printf "%b" "$url" | tmux load-buffer -
#printf '%b' "$url" | wl-copy 2>/dev/null

#printf '%b' "$url" | clip 2>/dev/null
#printf '%b' "$url" > /dev/clipboard 2>/dev/null
#printf '%b' "$url" | pbcopy 2>/dev/null
#printf '%b' "$url" | termux-clipboard-set 2>/dev/null

printf "%b" "$url" | xsel -b 2>/dev/null

# ---- lacks EOF
#printf "%b" "$url" | xclip -i -selection clipboard 2>/dev/null

# ---- does not work
#cat << EOF | xclip -i -selection clipboard 2>/dev/null
#$url
#EOF

echo
echo "W3m-control: MESSAGE '"$url" yanked'"
