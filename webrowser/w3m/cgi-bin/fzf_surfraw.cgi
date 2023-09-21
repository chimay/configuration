#!/usr/bin/env bash
# AUTHOR: gotbletu (@gmail|twitter|youtube|github|lbry)
#         https://www.youtube.com/user/gotbletu
# DESC:   interactive surfraw smart prefix search engine
# DEMO:   https://youtu.be/p5NZb8f8AHA | updated https://youtu.be/0j3pUfZjCeQ
# DEPEND: surfraw fzf gawk coreutils grep (xsel or tmux)
# RQMTS:  1. allow permissions and put goto_* scripts in /usr/lib/w3m/cgi-bin/
#         2. allow permissions and put fzf_surfraw.cgi any where you like e.g ~/.w3m/cgi-bin/
#         3. $EDITOR ~/.w3m/keymap
#
#              keymap  xs    COMMAND "SHELL ~/.w3m/cgi-bin/fzf_surfraw.cgi ; GOTO /usr/lib/w3m/cgi-bin/goto_clipboard_primary.cgi"
#              keymap  XS    COMMAND "SHELL ~/.w3m/cgi-bin/fzf_surfraw.cgi ; TAB_GOTO /usr/lib/w3m/cgi-bin/goto_clipboard_primary.cgi"
#              # keymap  xs    COMMAND "SHELL ~/.w3m/cgi-bin/fzf_surfraw.cgi ; GOTO /usr/lib/w3m/cgi-bin/goto_clipboard.cgi"
#              # keymap  XS    COMMAND "SHELL ~/.w3m/cgi-bin/fzf_surfraw.cgi ; TAB_GOTO /usr/lib/w3m/cgi-bin/goto_clipboard.cgi"
#              # keymap  xs    COMMAND "SHELL ~/.w3m/cgi-bin/fzf_surfraw.cgi ; GOTO /usr/lib/w3m/cgi-bin/goto_tmux_clipboard.cgi"
#              # keymap  XS    COMMAND "SHELL ~/.w3m/cgi-bin/fzf_surfraw.cgi ; TAB_GOTO /usr/lib/w3m/cgi-bin/goto_tmux_clipboard.cgi"
#
# CLOG:   2021-02-05 version 0.3 copy to all 3 clipboard at once; xsel primary/system clipboard, tmux clipboard
#         2020-05-08 version 0.2 surfraw -p instead of echo
#         2020-04-27 version 0.1


# clear screen
printf "\033c"

# select your elvi
PREFIX=$(surfraw -elvi | grep -v 'LOCAL\|GLOBAL'| fzf -e | awk '{print $1}')

# exit script if no elvi is selected (e.g hit ESC)
# if [ "$PREFIX" = "" ]; then exit; fi
[ -z "$PREFIX" ] && exit

# get user input
read -r -e -p "  $PREFIX >> Enter Your Search Keyword: " INPUT

# print proper url and copy to primary clipboard (aka highlighted clipboard) and tmux clipboard
# surfraw -p "$PREFIX" "$INPUT" | xsel -p
# tmux set-buffer "$(surfraw -p "$PREFIX" "$INPUT")"

# note: dont quote $INPUT it will mess up results

# copy to xsel primary (aka shift-insert)
surfraw -p "$PREFIX" $INPUT | xsel -p

# copy to xsel system clipboard (aka ctrl-v)
surfraw -p "$PREFIX" $INPUT | xsel -b

# copy to tmux clipboard
tmux set-buffer "$(surfraw -p "$PREFIX" $INPUT)"
# pidof tmux >/dev/null && tmux set-buffer "$(surfraw -p "$PREFIX" "$INPUT")"
