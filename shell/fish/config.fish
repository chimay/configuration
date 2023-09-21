# vim: set filetype=sh:

status is-login ; and source ~/racine/config/cmdline/fish/login.fish

source ~/racine/config/cmdline/fish/environment.fish
source ~/racine/config/cmdline/fish/universal.fish
source ~/racine/config/cmdline/fish/colour.fish

# Abbreviations {{{1

abbr -a h help
abbr -a m man

abbr -a q exit
abbr -a x exit

abbr -a e echo
abbr -a c cat

abbr -a s set
abbr -a sl 'set -l'

abbr -a -- - 'cd -'
abbr -a 0 'cd ~/racine'

abbr -a l ls
abbr -a ll 'ls -l'

abbr -a cp 'rsync -avhW --progress --info=progress2'

abbr -a p less
abbr -a v vim
abbr -a nv nvim
abbr -a mx 'emacs -nw -q -l ~/racine/config/edit/emacs/leger.el'

abbr -a vd edir

abbr -a cf 'clifm --no-color'
abbr -a § vifm

abbr -a gp git pull

abbr -a w w3m
abbr -a ww elinks

# }}}1

# Aliases {{{1

alias rm trash-put
alias tls trash-list
alias trs trash-restore
alias tremove trash-rm
alias tempty trash-empty

# }}}1

# Add ons {{{1

zoxide init fish | source

# }}}1
