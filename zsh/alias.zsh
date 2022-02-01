# vim: set ft=zsh :

# Touches non utilisées {{{1

# à

# }}}1

#  Généralités {{{1

# Commande qui ne fait rien
# REM : pass est une commande de gestion de mot de passe

alias rien=:

# Vrai et faux

alias vrai=true
alias faux=false

# Make générique

alias mk='make -f ~/racine/bin/make/generique.make'

# r remplacé par tig

alias rr='builtin r'

# }}}1

# ------------------------------------

# Documentation {{{1

# tldr, cheatsheets, ...

# }}}1

# Self {{{1

alias cm='chezmoi -S ~/racine/self/chezmoi -D ~ -c ~/racine/self/chezmoi/dot_config/chezmoi/chezmoi.toml'

# }}}1

# Sudo {{{1

# Remplacement pour gksu, kdesu

alias gsu=pkexec

# }}}1

#  Affichage {{{1

alias e='print -l'

alias ef='printf'

alias valve=wall

# }}}1

#  Clavier {{{1

alias azer="setxkbmap be ; xmodmap ~/racine/config/windenv/xmodmap/belge-meta-super-hyper"

# }}}1

#  Contrôle de version {{{1

alias g=git
alias 9=lazygit
alias r=tig

#alias diff='diff -BN'

alias p1='patch -p1 < '

# }}}1

#  Visualisation {{{1

alias p=pager

alias pp='pager +G'

alias q='most -C'

alias u=vimpager

alias tt='multitail'

alias taco='multitail -C -ts'

# PDF, EPUB

alias d=zathura

# Images

alias 1=ucollage
alias i=sxiv
alias ii=vimiv
alias iii=feh

# Fontes

alias fp='fontpreview-ueberzug -f "#5b3c11" -b "#000000"'

# }}}1

#  Édition {{{1

# Ed {{{2
# ------------------------------------------------------------

alias ed=run-ed

# }}}2

# Vim {{{2

alias v=vim
alias vi=vim

alias vid=vimdiff

alias vq=vim-quickfix

alias se=sudoedit

# }}}2

#  Neovim {{{2

alias nv=nvim

alias nsrv=run-neovim-server

#  }}}2

# Emacs {{{2
# ------------------------------------------------------------

alias esrv=run-emacs-server

alias emx='emacs -nw'

alias mx='emacs -nw -q -l ~/racine/config/edit/emacs/leger.el'

# Emacs : client graphique, voir ~/racine/shell/run/run-emacs-client.zsh

# Client terminal

alias em='emacsclient -t'

# Se connecte à un frame existant

alias emopen='emacsclient'

alias test-emacs='cd ~/racine/test/emacs && HOME=~/racine/test/emacs emacs'

# }}}2

# Kakoune {{{2

alias k=kak

# }}}2

# }}}1

#  Système de fichiers {{{1

# Liste {{{2

if [ $OPERASYS = freebsd ]
then
	alias l=ls
	alias la='ls -a'
	alias ll='ls -l'
else
	alias l='ls --color=auto --show-control-chars'
	alias ls='ls --color=auto'
	alias la='ls -a --color=auto'
	alias ll='ls -l --color=auto'
	alias le=ls_extended
fi

alias ù=most-recently-modified
alias nf=number-of-files

# }}}2

# Répertoires {{{2

alias 0='cd ~/racine'

alias pw='pwd'

alias c='cd $(fzfz)'

# }}}2

# Arborescence {{{2

alias tree='tree -C -A'

# }}}2

# Place {{{2

alias df='df -h'
alias dfc='dfc -c never'

alias du='du -sh'
alias duc=ncdu

# }}}2

# Renommage & Déplacement {{{2

alias mv='mv -i'

alias mm='qmv -f destination-only -d -e kak'

# vi folder

alias vd=vidir

# }}}2

# Copie {{{2

alias mcp='qcp -d'

# }}}2

# Suppression {{{2

alias rm=trash-put

alias tls=trash-list
alias trs=trash-restore

alias tremove=trash-rm
alias tempty=trash-empty

alias rmrf='command rm -rf'

alias srm='srm -vvv'

# }}}2

# Liens {{{2

alias ln='ln -i'
alias rl='readlink -f'

# }}}2

#  Synchronisation {{{2

alias ftp='sftp'

alias rs='rsync -av'

alias rmv='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--modify-window=1 \
	--owner --group --times --perms --links \
	--remove-source-files'

alias cp='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--modify-window=1 \
	--owner --group --times --perms --links \
	--update'

# relative
alias cpr='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--modify-window=1 \
	--owner --group --times --perms --links \
	--update \
	--relative'

# force
alias cpf='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--modify-window=1 \
	--owner --group --times --perms --links \
	--ignore-times'

alias sn='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--modify-window=1 \
	--delete-during \
	--owner --group --times --perms --links \
	--update'

# relative
alias snr='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--modify-window=1 \
	--delete-during \
	--owner --group --times --perms --links \
	--update \
	--relative'

# force
alias snf='rsync --verbose --progress --stats --human-readable --itemize-changes \
	--log-file="$HOME/log/rsync.log" \
	--rsh=ssh \
	--recursive \
	--modify-window=1 \
	--delete-during \
	--owner --group --times --perms --links \
	--ignore-times'

# }}}2

# Gestionnaires de fichiers {{{2

alias §=run-vifm

alias f='clifm --no-color'

# }}}2

# }}}1

# Copier & Coller {{{1

alias y=yank-file

alias çç='xclip -i -selection clipboard'
alias àà='xclip -o -selection clipboard'

alias çç1='xclip -i -selection primary'
alias çç2='xclip -i -selection secondary'

alias àà1='xclip -o -selection primary'
alias àà2='xclip -o -selection secondary'

# }}}1

#  Paquets {{{1

alias pk='pack'

# }}}1

#  Processus {{{1

alias jb='jobs'

alias t=htop
alias bpt=bpytop

alias ts=tsp
alias stamp='command ts'

alias s=kill

alias fini='mpv ~/audio/sonnerie/notification/fini.ogg'

#  }}}1

#  Manuel & Info {{{1

alias h=man

alias he=w3mman

alias hi=info

#  }}}1

#  Recherche {{{1

alias é=searcher
alias è='rg --vimgrep --smart-case'

# }}}1

# Organisation {{{1

alias ta=task

alias clc=calcurse

# }}}1

# Courriel {{{1

alias a="mail -Y 'h $'"
alias à=send-mail

alias m=neomutt
alias M=run-neomutt.zsh

alias £=abook

alias n='newsboat -c ~/racine/index/newsboat/cache.db'

# }}}1

# Navigation {{{1

# Signets

alias b=run-buku

# Recherche

alias sr=surfraw

# Navigateurs

alias w=w3m
alias ww=elinks

alias www='lynx -cfg=~/racine/config/webrowser/lynx/lynx.cfg -lss=~/racine/config/webrowser/lynx/lynx.lss'

# readable -> w3m
alias wr=webreader

# téléchargement

alias dl=aria2p

# gemini

alias gg=amfora

# }}}1

# Chat {{{1

alias mrx=gomuks

# }}}1

#  Date {{{1

alias jour='date +" [=] %A %d %B %Y  (o) %H : %M : %S  | %:z | "'

# }}}1

# Réseau {{{1

alias ftp=lftp

# }}}1

#  Langages de script {{{1

#alias irb='irb --simple-prompt'

alias rvm-bash='/bin/bash rvm'

# }}}1

#  Musique, Vidéo {{{1

alias am='alsamixer -c 0'
alias pm=pulsemixer
alias ncpm=ncpamixer

alias µ=joue

alias ncmp=ncmpcpp

alias pc=playerctl

# Mplayer {{{2
# ------------------------------------------------------------

alias mplayerdvd='mplayer -mouse-movements dvdnav://'

# }}}2

# Vlc {{{2
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

# }}}2

# }}}1

#  Science {{{1

alias 8='cd ~/Documents ; octave --no-gui -q ; cd -'

# }}}1

#  Surveillance système {{{1

alias free='free -m'

alias monte='mount | column -t'

alias journeaux='tail /var/log/mail.* | ccze -A'

alias sv=systemctl

# }}}1

# Utilitaires {{{1

alias wo='command w'

alias wh='which -a'

alias vmstat='vmstat 1 4'

# who, mesg, talk, write, wall

# }}}1

# Dictionnaires {{{1

alias ds=sdcv
alias dt=translator
alias dy=synonym

alias wk=wikicurses
alias wa='wikicurses --wiki ArchWiki'
alias wp=wikipedia2text
alias wt=wptranslate

# Arch Linux Wiki
# offline, mode texte

alias aw=wiki-search

# }}}1

# Bureautique {{{1

alias 4=sc-im

# }}}1

# Météo {{{1

alias we=wego

# }}}1

# Applications {{{1

alias nautilus='nautilus --no-desktop'

# }}}1

# ------------------------------------

#  Précommandes {{{1

alias mkdir='nocorrect mkdir -p'

# }}}1

#  Globaux : alias -g {{{1

alias -g C='| cat'
alias -g R='| tac'

alias -g N='| wc -l'

alias -g H='| head'
alias -g T='| tail'

alias -g G='| command grep'
alias -g S='| sort'
alias -g U='| sort | uniq'

alias -g Y='| xclip -i -selection clipboard'

alias -g P='|& less'
alias -g PR='|& less -R'

alias -g V='| view -'
alias -g W='| vimpager'

alias -g DS='| diffstat'

alias -g F='| fpp'

# }}}1

#  Suffixes : alias -s {{{1

# Pour choisir le programme qui va ouvrir le fichier, d’après l’extension

alias -s htm=$BROWSER
alias -s html=$BROWSER
alias -s php=$BROWSER

alias -s pdf=zathura
alias -s epub=zathura

alias -s xz=less
alias -s gz=less
alias -s bz2=less
alias -s zip=less
alias -s deb=less

alias -s ogg=mpv
alias -s mp3=mpv
alias -s flac=mpv
alias -s wav=mpv

# }}}1

#  Alias de répertoires : hash -d {{{1

hash -d racine=~/racine
hash -d wallpaper=~/graphix/wallpaper

# Dossiers dans racine {{{2

hash -d archive=~/racine/archive
hash -d artisan=~/racine/artisan
hash -d automat=~/racine/automat
hash -d bin=~/racine/bin
hash -d built=~/racine/built
hash -d cloud=~/racine/cloud
hash -d common=~/racine/common
hash -d config=~/racine/config
hash -d dotdir=~/racine/dotdir
hash -d example=~/racine/example
hash -d feder=~/racine/feder
hash -d fun=~/racine/fun
hash -d filesys=~/racine/filesys
hash -d game=~/racine/game
hash -d gate=~/racine/gate
hash -d hist=~/racine/hist
hash -d hub=~/racine/hub
hash -d humour=~/racine/humour
hash -d image=~/racine/image
hash -d index=~/racine/index
hash -d infoman=~/racine/infoman
hash -d install=~/racine/install
hash -d liber=~/racine/liber
hash -d list=~/racine/list
hash -d litera=~/racine/litera
hash -d log=~/racine/log
hash -d mail=~/racine/mail
hash -d meta=~/racine/meta
hash -d multics=~/racine/multics
hash -d musica=~/racine/musica
hash -d network=~/racine/network
hash -d news=~/racine/news
hash -d omni=~/racine/omni
hash -d organ=~/racine/organ
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
hash -d search=~/racine/search
hash -d self=~/racine/self
hash -d share=~/racine/share
hash -d shell=~/racine/shell
hash -d session=~/racine/session
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
hash -d wiki=~/racine/wiki

# }}}2

#  Site {{{2

hash -d eclats2vers=~/racine/site/orgmode

#  }}}2

# Terminal {{{2

hash -d tmuxconf=~/racine/config/multiplex/tmux

# }}}2

# Shell, Script {{{2
# ------------------------------------

hash -d historique=~/racine/dotdir/zsh

hash -d zconf=$RACINE_ZSH
hash -d zdot=~/racine/dotdir/zsh

# }}}2

# Edit {{{2
# ------------------------------------

hash -d vimconf=~/racine/config/edit/vim
hash -d neovimconf=~/racine/config/edit/neovim
hash -d kakconf=~/racine/config/edit/kak
hash -d emacsconf=~/racine/config/edit/emacs

hash -d mdot=~/racine/dotdir/emacs.d

# }}}2

# Courriel {{{2

hash -d muttconf=~/racine/config/mail/neomutt

# }}}2

# Plugins {{{2

hash -d pman=~/racine/plugin/manager

hash -d vimpac=~/racine/plugin/manager/vimpack/minpac
hash -d neovimpac=~/racine/plugin/manager/neovimpack/minpac
hash -d elget=~/racine/plugin/manager/el-get
hash -d straight=~/racine/plugin/manager/straight

# }}}2

# Multimedia {{{2
# ------------------------------------

hash -d aartistes=~/audio/artistes

hash -d classique=~/audio/artistes/classique

hash -d jazz=~/audio/artistes/jazz

# }}}2

# }}}1
