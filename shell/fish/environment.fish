# vim: set filetype=sh:

# Environment {{{1

set -gx SHELL /bin/fish

# ---- terminal

switch $TERM
	case 'linux*'
		set -gx TERM linux
	case 'xterm*'
		set -gx TERM xterm-256color
	case 'tmux*'
		set -gx TERM tmux-256color
	case 'screen*'
		set -gx TERM screen-256color
end

# ---- path

set -gxa PATH /usr/{,local/}{,s}bin
set -gxa PATH ~/.local/bin ~/racine/bin/local/bin
set -gxa PATH ~/racine/automat ~/racine/self

for folder in ~/racine/{install,shell,bin}/*
	set -gxa PATH $folder
end

# ---- history

set -gx fish_history $HOST

# ---- commands

set -gx VISUAL vim
set -gx EDITOR vim
set -gx PAGER less
set -gx MANPAGER less
set -gx BROWSER w3m

# }}}1
