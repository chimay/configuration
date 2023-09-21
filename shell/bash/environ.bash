# vim: set ft=sh :

export BROWSER=/usr/bin/xdg-open

export HISTSIZE=30000
export HISTFILESIZE=30000
export HISTCONTROL=ignoreboth
export HISTFILE=~/racine/hist/bash/$HOST

# Emacs léger

export EDITOR="emacs -nw -q -l ~/racine/config/edit/emacs/leger.el"
export LESSEDIT="emacs -nw -q -l ~/racine/config/edit/emacs/leger.el"
export SUDO_EDITOR="emacs -nw -q -l ~/racine/config/edit/emacs/leger.el"
export VISUAL="emacs -nw -q -l ~/racine/config/edit/emacs/leger.el"

export FCEDIT="emacs -nw -q -l ~/racine/config/edit/emacs/leger.el"
export MOSTEDITOR="emacs -nw -q -l ~/racine/config/edit/emacs/leger.el"
export RLWRAP_EDITOR="emacs -nw -q -l ~/racine/config/edit/emacs/leger.el"

# Emacs client

# export EDITOR="emacsclient -t"
# export LESSEDIT="emacsclient -t"
# export SUDO_EDITOR="emacsclient -t"
# export VISUAL="emacsclient -t"
#
# export FCEDIT="emacsclient -t"
# export MOSTEDITOR="emacsclient -t"
# export RLWRAP_EDITOR="emacsclient -t"
