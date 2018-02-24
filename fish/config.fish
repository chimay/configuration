# vim: set filetype=sh:

# Environnement {{{1

set PATH /usr/local/bin $PATH

set PAGER less
set EDITOR nvim

# }}}1

# Couleurs {{{1

set -x fish_color_command normal
set -x fish_color_comment normal
set -x fish_color_cwd normal
set -x fish_color_end normal
set -x fish_color_error normal
set -x fish_color_history_current normal
set -x fish_color_host normal
set -x fish_color_match normal
set -x fish_color_operator normal
set -x fish_color_param normal
set -x fish_color_quote normal
set -x fish_color_redirection normal
set -x fish_color_user normal
set -x fish_color_valid_path normal

set -x fish_color_cwd_root 872e30

set -x fish_color_autosuggestion 301507

set -x fish_color_search_match --bold red --background=151515

set -x fish_pager_color_completion normal
set -x fish_pager_color_description normal
set -x fish_pager_color_prefix --underline
set -x fish_pager_color_progress --bold red --background=151515

# }}}1

# Abréviations {{{1

abbr -a -- - 'cd -'

# }}}1
