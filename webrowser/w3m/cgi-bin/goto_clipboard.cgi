#!/usr/bin/env sh
# AUTHOR: gotbletu (@gmail|twitter|youtube|github|lbry)
#         https://www.youtube.com/user/gotbletu
# DESC:   paste and go feature for w3m web browser using system clipboard (aka ctrl+v)
# DEMO:   https://youtu.be/p5NZb8f8AHA | updated https://youtu.be/0j3pUfZjCeQ
# DEPEND: w3m  xsel
# RQMTS:  1. allow permissions and put this script in /usr/lib/w3m/cgi-bin/
#
#         2. $EDITOR ~/.w3m/keymap
#                       # paste url and go (current tab)
#                       keymap  pp      GOTO        /usr/lib/w3m/cgi-bin/goto_clipboard.cgi
#
#                       # paste url and go (new tab)
#                       keymap  PP      TAB_GOTO    /usr/lib/w3m/cgi-bin/goto_clipboard.cgi
#
#         3. set the default open-url to current url
#               sed -i 's:default_url.*:default_url 1:g' ~/.w3m/config
#
# REFF:   https://github.com/felipesaa/A-vim-like-firefox-like-configuration-for-w3m
# CLOG:   2021-02-05 version 0.2 reset url back to 1 (aka edit current url)
#         2018-09-30 version 0.1 by felipesaa (https://github.com/felipesaa)


# set open-url value to zero (aka empty url line)
printf "%s\r\n" "W3m-control: SET_OPTION default_url=0";

#GOTO url in clipboard in current page. If the clipboard has a 
#"non url string/nothing" an blank page is shown.
printf "%s\r\n" "W3m-control: GOTO $(xsel -ob)";

#delete the buffer (element in history) created between the current page and 
#the searched page by calling this script.
printf "W3m-control: DELETE_PREVBUF\r\n"

# set default open-url value to one (aka current url)
printf "%s\r\n" "W3m-control: SET_OPTION default_url=1";

