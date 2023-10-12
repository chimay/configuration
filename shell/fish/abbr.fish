# vim: set filetype=sh:

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
