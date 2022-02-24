# vim: set filetype=sh:

# Features {{{1

set -U fish_features stderr-nocaret qmark-noglob

# }}}1

# Key bindings {{{1

# ---- for emacs

set -U fish_key_bindings fish_default_key_bindings

#fish_default_key_binding

# ---- for vi

#set -U fish_key_bindings fish_vi_key_bindings

# set -U fish_cursor_default block
# set -U fish_cursor_visual block
# set -U fish_cursor_insert line
# set -U fish_cursor_replace_one underscore

# ---- hybrid

#set -U fish_key_bindings fish_hybrid_key_bindings

# }}}1

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

for folder in ~/racine/*
	set -gxa --path CDPATH $folder
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

# Abbreviations {{{1

abbr -a he help
abbr -a e echo
abbr -a h man
abbr -a s set
abbr -a sl 'set -l'

abbr -a l ls
abbr -a ll 'ls -l'
abbr -a p less
abbr -a v vim
abbr -a nv nvim
abbr -a § vifm
abbr -a f 'clifm --no-color'
abbr -a vd edir
abbr -a mx 'emacs -nw -q -l ~/racine/config/edit/emacs/leger.el'

abbr -a -- - 'cd -'

# }}}1

# Aliases {{{1


# }}}1

# Colours {{{1

set -U fish_term24bit 1

set -U fish_color_normal 5b3c11

set -U fish_color_command normal
set -U fish_color_keyword 88421d
set -U fish_color_quote 872e30
set -U fish_color_redirection normal
set -U fish_color_end normal
set -U fish_color_error normal
set -U fish_color_param normal
set -U fish_color_comment 754321 --italic
set -U fish_color_selection black -b 5b3c11
set -U fish_color_operator normal
set -U fish_color_escape 872e30
set -U fish_color_autosuggestion 700000 --italic
set -U fish_color_cwd normal
set -U fish_color_user normal
set -U fish_color_host normal
set -U fish_color_host_remote normal
set -U fish_color_cancel 872e30
set -U fish_color_search_match 872e30

set -U fish_pager_color_progress --underline
set -U fish_pager_color_background normal
set -U fish_pager_color_prefix --underline
set -U fish_pager_color_completion normal
set -U fish_pager_color_description normal
set -U fish_pager_color_selected_background normal
set -U fish_pager_color_selected_prefix 751000 --underline --italic
set -U fish_pager_color_selected_completion 751000 --underline --italic
set -U fish_pager_color_selected_description normal

# }}}1
