# vim: set ft=zsh :

#  {{{ Généralités
# ------------------------------------------------------------------------

# Commande qui ne fait rien
# REM : pass est une commande de gestion de mot de passe

alias rien=:

# Vrai et faux

alias vrai=true
alias faux=false

# Make générique

alias mk='make -f ~/racine/bin/make/generique.make'

# }}}

#  {{{ Historique
# ------------------------------------------------------------------------

alias hs='history -E'

alias scr='script -f -a ~/log/${HOST}/cmdline/terminal.log'

# }}}

# ------------------------------------

#  {{{ Affichage
# ------------------------------------------------------------------------

alias e='print -l'

alias ec='print -c'

alias out=affiche-stdout

alias err=affiche-stderr

alias pag=affiche-fichiers

# }}}

#  {{{ Échange

alias xc=echange

#  }}}

# {{{ Archive

alias a=archive

# }}}

# {{{ Chiffrement

alias x=crypte

# }}}

#  {{{ Clavier
# ------------------------------------------------------------------------

alias azer="setxkbmap be ; xmodmap ~/racine/config/windenv/xmodmap/belge-meta-super-hyper"

# }}}

#  {{{ Contrôle de version
# ------------------------------------------------------------------------

alias g='git'
alias b='bzr'

# alias h='hg'
# alias d='darcs'

#alias vcsh='versys-shell'

alias 2='diff -BN'

alias p1='patch -p1 < '

# }}}

#  {{{ Visualisation
# ------------------------------------------------------------------------

alias m='pageur'

alias M='pageur +G'

alias n='most -C'

alias u=vimpager

alias ta='multitail'

alias taco='multitail -C -ts'

# PDF, EPUB

alias d=zathura

# Images

alias i=vimiv


# }}}

#  {{{ Édition
# ------------------------------------------------------------------------

# {{{ Ed
# ------------------------------------------------------------

alias ed='ed -v -p " * ed : "'

# }}}

#  {{{ Neovim

alias nsrv='lance-neovim-serveur'

alias nv=nvim

#  }}}

# {{{ Vim

alias vi='vim'

alias v='/usr/local/bin/vim -u ~/racine/config/edit/vim/rc-viminime.vim'

alias sv='sudoedit'

# }}}

# {{{ Emacs
# ------------------------------------------------------------

alias esrv='lance-emacs-serveur'

alias emx='emacs -nw'

alias mx='emacs -nw -q -l ~/racine/config/edit/emacs/leger.el'

# Emacs : client graphique, voir ~/racine/shell/run/lance-emacs-client.zsh

# Client terminal

alias em='emacsclient -t'

# Se connecte à un frame existant

alias emopen='emacsclient'

# }}}

# Spacemacs, Spacevim {{{2

alias spacemacs='HOME=~/racine/dotdir emacs'

alias spacevim='nvim-qt -- -u ~/racine/dotdir/spacevim/init.vim'

# }}}2

# }}}

#  {{{ Système de fichiers
# ------------------------------------------------------------------------

# {{{ Liste

[ $OPERASYS = freebsd ] && {

	alias l=ls
	alias la='ls -a'
	alias ll='ls -l'
}

[ $OPERASYS = archlinux ] && {

	alias l='ls --color=auto --show-control-chars'
	alias ls='ls --color=auto'
	alias la='ls -a --color=auto'
	alias ll='ls -l --color=auto'
}

alias lh='liste-recents'
alias lt='liste-tout'

# }}}

# {{{ Infos

alias nf='nombre-de-fichiers'

# }}}

# {{{ Répertoires

alias c='repertoires'

#alias pod='pop-directory'

alias pw='pwd'

# }}}

# {{{ Arborescence

alias tree='tree -C -A'

alias td=arbre-dossiers

# }}}

#  {{{ Copie
# ------------------------------------------------------------------------

alias lcp='=cp -i'

# }}}

# {{{ Renommage & Déplacement

alias mv='mv -i'

alias mm='qmv -f destination-only -d'

# }}}

# {{{ Suppression

#alias rm='rm -i'

alias rm=trash-put

alias tls=trash-list
alias trs=trash-restore

alias tremove=trash-rm
alias tempty=trash-empty

alias rmrf='/bin/rm -rf'

alias srm='srm -vvv'

# }}}

# {{{ Liens

alias ln='ln -i'
alias rl='readlink -f'

# }}}

#  {{{ Synchronisation
# ------------------------------------------------------------------------

alias cp='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--owner --group --times --perms --links \
	--update'

alias sn='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive --delete-during \
	--owner --group --times --perms --links \
	--update'

alias 1='unison'

# }}}

# {{{ Gestionnaires de fichiers

alias f='vifm'

alias 3='ranger'

# }}}

# }}}

#  {{{ Paquets
# ------------------------------------------------------------------------

alias pk='pack'

# }}}

#  {{{ Processus

 alias pgrep='pgrep -a -x'
 alias pkill='pkill -x'

alias psgrep='ps auxww | grep -v grep | grep --color=never'

 alias fini='mplayer ~/audio/Sonnerie/fini.ogg'

#  }}}

#  {{{ Manuel & Info

alias h=man

alias he=w3mman

alias o=info

# Arch Linux Wiki
# offline, mode texte

alias aw=wiki-search

#  }}}

#  {{{ Recherche
# ------------------------------------------------------------------------

alias grep='grep -n --color=never'

[[ -x /usr/bin/vendor_perl/ack ]] && alias ack=/usr/bin/vendor_perl/ack

[[ -x ack-grep ]] && alias ack=ack-grep

alias gv='ag --nocolor --vimgrep --smart-case'

alias lc='locate -d ~/racine/index/locate/racine.db -e -A'
alias lul='locate -d ~/racine/index/locate/usr-local.db -e -A'
alias lpk='locate -d ~/racine/index/locate/pacman-lib.db -e -A'
alias lau='locate -d ~/racine/index/locate/audio.db -i -e -A'
alias lph='locate -d ~/racine/index/locate/photo.db -i -e -A'

# }}}

# {{{ Dictionnaires

alias sd='sdcv'

# }}}

# {{{ Organisation

alias t=task

alias agenda=calcurse

# }}}

# ------------------------------------

#  {{{ Précommandes
# ------------------------------------------------------------------------

alias mkdir='nocorrect mkdir -p'

# }}}

#  {{{ Globaux : alias -g
# ------------------------------------------------------------------------

alias -g L='|& command less'
alias -g LR='|& command less -R'

alias -g U='| view -'
alias -g V='| vimpager'

alias -g R='| command tac'

alias -g G='| command grep --color=never'
alias -g S='| command sort'

alias -g H='| command head'
alias -g T='| command tail'

alias -g N='| command wc -l'

alias -g DS='| command diffstat'

# }}}

#  {{{ Suffixes : alias -s
# ------------------------------------------------------------------------

alias -s htm='less'
alias -s html='less'
alias -s php='less'
alias -s css='less'
alias -s js='less'

alias -s tex='less'
alias -s ly='less'
alias -s txt='less'

alias -s gz='less'
alias -s bz2='less'
alias -s zip='less'
alias -s deb='less'

alias -s ogg='mplayer'
alias -s mp3='mplayer'
alias -s flac='mplayer'
alias -s wav='mplayer'

# }}}

#  {{{ Alias de répertoires : hash -d
# ------------------------------------------------------------------------

hash -d racine=~/racine

hash -d archive=~/racine/archive
hash -d automat=~/racine/automat
hash -d bin=~/racine/bin
hash -d built=~/racine/built
hash -d common=~/racine/common
hash -d config=~/racine/config
hash -d dotdir=~/racine/dotdir
hash -d feder=~/racine/feder
hash -d hist=~/racine/hist
hash -d hub=~/racine/hub
hash -d humour=~/racine/humour
hash -d image=~/racine/image
hash -d index=~/racine/index
hash -d infoman=~/racine/infoman
hash -d install=~/racine/install
hash -d liber=~/racine/liber
hash -d litera=~/racine/litera
hash -d log=~/racine/log
hash -d mail=~/racine/mail
hash -d meta=~/racine/meta
hash -d multics=~/racine/multics
hash -d musica=~/racine/musica
hash -d news=~/racine/news
hash -d omni=~/racine/omni
hash -d pack=~/racine/pack
hash -d papier=~/racine/papier
hash -d pictura=~/racine/pictura
hash -d plain=~/racine/plain
hash -d plugin=~/racine/plugin
hash -d public=~/racine/public
hash -d refer=~/racine/refer
hash -d repo=~/racine/repo
hash -d run=~/racine/run
hash -d scien=~/racine/scien
hash -d self=~/racine/self
hash -d shell=~/racine/shell
hash -d site=~/racine/site
hash -d snippet=~/racine/snippet
hash -d source=~/racine/source
hash -d syncron=~/racine/syncron
hash -d system=~/racine/system
hash -d template=~/racine/template
hash -d test=~/racine/test
hash -d trash=~/racine/trash
hash -d varia=~/racine/varia
hash -d void=~/racine/void

#  {{{ Site

hash -d eclats2vers=~/racine/site/orgmode

#  }}}

# {{{ Shell, Script
# ------------------------------------

hash -d historique=~/racine/dotdir/zsh

hash -d zconf=$RACINE_ZSH
hash -d zdot=~/racine/dotdir/zsh

# }}}

# {{{ Edit
# ------------------------------------

hash -d nconf=~/racine/config/edit/neovim

hash -d nhist=~/racine/hist/neovim

# ------------

hash -d vimconf=~/racine/config/edit/vim

# ------------

hash -d mconf=~/racine/config/edit/emacs

hash -d mdot=~/racine/dotdir/emacs.d

# ------------

hash -d pman=~/racine/plugin/manager

# }}}

# {{{ Multimedia
# ------------------------------------

hash -d aartistes=~/audio/Artistes

hash -d aclassique=~/audio/Artistes/Classique

hash -d mtrois=~/audio/musique-3

# }}}

# }}}

# ------------------------------------

# {{{ Applications

alias nautilus='nautilus --no-desktop'

# }}}

# {{{ Navigateurs

alias w=w3m

# }}}

#  {{{ Date
# ------------------------------------------------------------------------

alias jour='date +" [=] %A %d %B %Y  (o) %H : %M : %S  | %:z | "'

# }}}

#  {{{ Langages de script
# ------------------------------------------------------------------------

#alias irb='irb --simple-prompt'

alias rvm-bash='/bin/bash rvm'

# }}}

#  {{{ Musique, Vidéo
# ------------------------------------------------------------------------

alias y=joue

alias p=ncmpcpp

alias q=cmus

alias pc=playerctl

# {{{ Mplayer
# ------------------------------------------------------------

alias mplayerdvd='mplayer -mouse-movements dvdnav://'

# }}}

# {{{ Vlc
# ------------------------------------------------------------

#alias vlsh='vlc-shell'

#alias vlc-help='vlc --longhelp --advanced'

#alias vlc-term='vlc -I ncurses --browse-dir ~/audio'

# Serveur
# ------------------------------------

# Serveur vlc, voir ~/racine/dotdir/zsh/autoload/mov/vlc-shell
# pour la connexion en console avec complétion

#alias vlc-server='cd ~/audio && vlc -I rc --rc-host 127.0.0.1:8080'
#alias vlc-extraserver='cd ~/audio && vlc --extraintf rc --rc-host 127.0.0.1:8080'

#alias vlsrv='cd ~/audio && vlc -I rc --rc-host 127.0.0.1:8080'
#alias vlxsrv='cd ~/audio && vlc --extraintf rc --rc-host 127.0.0.1:8080'

# Serveur http

#alias vlc-http='vlc -I http --http-host 127.0.0.1:8080'

# }}}

# }}}

#  {{{ Science
# ------------------------------------------------------------------------

alias 8='cd ~/Documents ; octave --no-gui -q ; cd -'

# }}}

#  {{{ Surveillance système
# ------------------------------------------------------------------------

alias df='df -h'
alias dfc='dfc -c never'

alias du='du -sh'

alias free='free -m'

alias monte='mount | column -t'

alias j='jobs'

alias top='htop'

alias k='kill'
alias kn='pkill'

alias journeaux='tail /var/log/mail.* | ccze -A'

# }}}

# {{{ Utilitaires

alias wo=w

alias wh='which -a'

alias vmstat='vmstat 1 4'

# }}}
