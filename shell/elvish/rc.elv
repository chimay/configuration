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

# set edit:insert:binding[Ctrl-R] = {
#   edit:histlist:start
#   edit:histlist:toggle-case-sensitivity
# }

set edit:max-height = 30

# }}}1

# Environment {{{1

set E:SHELL = 'elvish'

set E:EDITOR = 'vim'

set E:LS_COLORS = 'no=00:fi=00:rs=0:ex=3;38;5;9:di=38;5;88:mh=01:ln=3;38;5;3:or=3;38;5;237:pi=38;5;22:so=38;5;11:do=01;35:bd=40;33;01:cd=40;33;01:su=37;41:sg=30;43:ca=30;41:tw=0;32:ow=34;42:st=37;44:*.tmp=38;5;237:*.part=38;5;237:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lz=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tar=38;5;9:*.tgz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.txz=38;5;9:*.tz=38;5;9:*.zip=38;5;9:*.7z=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.pax=38;5;9:*.rz=38;5;9:*.jar=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jpg=00:*.jpeg=00:*.gif=00:*.bmp=00:*.pbm=00:*.pgm=00:*.ppm=00:*.tga=00:*.xbm=00:*.xpm=00:*.tif=00:*.tiff=00:*.png=00:*.svg=00:*.svgz=00:*.mng=00:*.pcx=00:*.aac=00:*.au=00:*.flac=00:*.mid=00:*.midi=00:*.mka=00:*.mp3=00:*.mpc=00:*.ogg=00:*.ra=00:*.wav=00:*.axa=00:*.oga=00:*.spx=00:*.xspf=00:*.mov=00:*.mpg=00:*.mpeg=00:*.m2v=00:*.mkv=00:*.webm=00:*.ogm=00:*.mp4=00:*.m4v=00:*.mp4v=00:*.vob=00:*.qt=00:*.nuv=00:*.wmv=00:*.asf=00:*.rm=00:*.rmvb=00:*.flc=00:*.avi=00:*.fli=00:*.flv=00:*.gl=00:*.dl=00:*.xcf=00:*.xwd=00:*.yuv=00:*.cgm=00:*.emf=00:*.axv=00:*.anx=00:*.ogv=00:*.ogx=00:'

# }}}1

# Prompt {{{1

set edit:prompt = { print ' +---' (whoami) @ (hostname) ':' (tilde-abbr $pwd) " \n |\n +---" (date +"%H:%M") '$ ' }
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
