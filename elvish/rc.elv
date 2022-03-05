# vim: set ft=zsh :

# eval (zoxide init elvish | slurp)

# Modules {{{1

use epm
use math
use path
use re
use readline-binding
use str

# }}}1

# Packages {{{1

epm:install &silent-if-installed         ^
  github.com/zzamboni/elvish-modules     ^
  github.com/zzamboni/elvish-completions ^
  github.com/zzamboni/elvish-themes      ^
  github.com/xiaq/edit.elv               ^
  github.com/muesli/elvish-libs          ^
  github.com/iwoloschin/elvish-packages

use github.com/zzamboni/elvish-modules/bang-bang

use github.com/zzamboni/elvish-completions/comp

use github.com/zzamboni/elvish-completions/vcsh
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-completions/git

use github.com/xiaq/edit.elv/smart-matcher

use github.com/zzamboni/elvish-modules/dir

use github.com/zzamboni/elvish-modules/alias

# }}}1

# Readline {{{1

set edit:insert:binding[Alt-b] = $dir:left-small-word-or-prev-dir~
set edit:insert:binding[Alt-f] = $dir:right-small-word-or-next-dir~
set edit:insert:binding[Alt-i] = $dir:history-chooser~

set edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~
set edit:insert:binding[Alt-d] = $edit:kill-small-word-right~

set edit:insert:binding[Alt-i] = $dir:history-chooser~

set edit:insert:binding[Alt-m] = $edit:-instant:start~

set edit:max-height = 30

# }}}1

# Environment {{{1

set E:EDITOR = "vim"

# }}}1

# Prompt {{{1

set edit:prompt = { print ' +- ' (whoami)@(hostname) ' : ' (tilde-abbr $pwd) " \n |\n +- " (date +"%H:%M") '$ ' }
set edit:rprompt = (constantly (date +" %d-%m-%Y "))

set edit:rprompt-persistent = $true

# }}}1

# Completion {{{1

set edit:completion:arg-completer[git] = (comp:item [ log status diff ])

smart-matcher:apply

alias:new cd &use=[github.com/zzamboni/elvish-modules/dir] dir:cd
alias:new cdb &use=[github.com/zzamboni/elvish-modules/dir] dir:cdb

# }}}1

# Alias {{{1

alias:new m man
alias:new q exit

alias:new e echo
alias:new c cat

alias:new l ls
alias:new ll ls -l

alias:new cp 'rsync -avhW --progress --info=progress2'

alias:new v vim
alias:new nv nvim
alias:new mx emacs -nw -q -l ~/racine/config/edit/emacs/leger.el

alias:new vd edir
alias:new cf clifm --no-color
alias:new § vifm

alias:new w w3m
alias:new ww elinks

# }}}1
