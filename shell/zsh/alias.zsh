#!/bin/zsh

# unused keys {{{1

#  generic {{{1

# Commande qui ne fait rien
# REM : pass est une commande de gestion de mot de passe

alias nope=:

# Vrai et faux

# alias vrai=true
# alias faux=false

alias rr='builtin r'

# ------------------------------------

# documentation {{{1

# tldr, cheatsheets, ...

# self {{{1



# meta with completion {{{1

alias fn=fzf-nova

# sudo {{{1

# Remplacement pour gksu, kdesu

alias sudologin='sudo -i'
alias sudoshell='sudo -s'
alias visudo='sudo -E visudo'
alias gsu=pkexec

# encryption {{{1



# display {{{1

alias e='print -l'
alias ef='printf'
alias c=cat
alias valve=wall

# keyboard {{{1

alias azer="setxkbmap be ; xmodmap ~/racine/config/windenv/xmodmap/belge-meta-super-hyper"

# version control {{{1

alias g=git
alias r=lazygit
alias gg=tig

#alias diff='diff -BN'

alias p1='patch -p1 < '

# visualization {{{1

alias b=bat

alias p=pager
alias pp='pager +G'
alias q='most -C'

alias vp=vimpager

alias tt='multitail'
alias taco='multitail -C -ts'

# PDF, EPUB

alias d=zathura
#alias d=apvlv

# Images

alias i=sxiv
alias ii=vimiv
alias iii=feh
alias iiii=ucollage

alias iv=xnviewmp

# Fontes

alias fntprev='fontpreview-ueberzug -f "#5b3c11" -b "#000000"'

# edition {{{1

# Ed {{{2
# ------------------------------------------------------------

alias ed=run-ed

# Vim {{{2

alias vi=vim-lite.sh

alias vid='vim-lite.sh -d'
alias vimdiff='vim-lite.sh -d'

alias vq=neovim-quickfix
alias viq=vim-quickfix

alias se=sudoedit

#  Neovim {{{2

alias v=neovim-lite.sh
alias ns='run-neovim-server.sh &'
alias nvc=run-neovim-client.sh

# -- neovim remote

alias nr=nvr

# Vis {{{2

alias vs=vis

# Kakoune {{{2

alias k=kak
alias ks='run-kak-server.sh &'

alias nks='run-neovim-server.sh & run-kak-server.sh &'

# Helix {{{2

alias h=helix
alias xx=helix

# Emacs {{{2

alias esrv=run-emacs-server.sh
# client graphique, voir ~/racine/shell/run/run-emacs-client.sh

alias emx='emacs -nw --init-directory ~/racine/dotdir/emacs.d'

alias mx=emacs-lite.sh

# client terminal
alias em='emacsclient -t'

# se connecte à un frame existant
alias emopen='emacsclient'

#alias test-emacs='cd ~/racine/test/emacs && HOME=~/racine/test/emacs emacs'

# doom emacs
alias doom=~/racine/dotdir/emacs.doom/bin/doom

# miscellaneous {{{2

alias f=fresh

# file system {{{1

# Liste {{{2

if [ $OPERASYS = freebsd ]
then
	alias l=ls
	alias la='ls -a'
	alias ll='ls -l'
else
	alias l='command ls --color=auto --show-control-chars'
	alias ls='command ls --color=auto --show-control-chars'
	alias ll='command ls -l --color=auto'
	alias la='command ls -a --color=auto'
	#alias ls='lsd'
	#alias lsl='lsd -l'
	#alias lsa='lsd -a'
fi

alias ù=most-recently-modified
alias nf=number-of-files

# Répertoires {{{2

alias 0='cd ~/racine'

alias pw='pwd'

alias cdfzf='cd $(fzfz)'

# Arborescence {{{2

alias t='tree -C'

# Place {{{2

alias df='df -hT'
alias dfc='dfc -c never'

alias du='du -sh'
alias duc='ncdu --color off'

# Renommage & Déplacement {{{2

alias x=swap-files
alias mv='mv -i'

alias mm='qmv -f destination-only -d -e kak'

# vi folder

#alias vd=vidir

alias vd=edir

# Copie {{{2

alias mcp='qcp -d'

# Suppression {{{2

alias rm='noglob remove-file'

alias tls=trash-list
alias trestore=trash-restore

alias tremove=trash-rm
alias tempty=trash-empty

alias rmrf='command rm -rf'

alias srm='srm -vvv'

# Liens {{{2

alias ln='ln -i'
alias rl='readlink -f'

#  Synchronisation {{{2

alias ftp='sftp'

alias rs='rsync -av'

alias st='run-syncthing.sh &'

# Gestionnaires de fichiers {{{2

alias §=vifmrun
alias 2=vifmrun
alias 3=yazi
alias 1=xplr

alias xcd='cd "$(xplr --print-pwd-as-result)"'

alias cf='clifm --no-color'

alias mc='mc -b'

# cut & paste {{{1

alias y=yank-file

alias çç='xclip -i -selection clipboard'
alias àà='xclip -o -selection clipboard'

alias ç1='xclip -i -selection primary'
alias ç2='xclip -i -selection secondary'

alias à1='xclip -o -selection primary'
alias à2='xclip -o -selection secondary'

# packages {{{1

alias pk='pack'

# processus {{{1

alias j=jobs
alias di=disown

alias pg='pgrep -af'
alias s=kill
alias pid=process-iden
alias sa=signal-all
alias psi=process-signal

alias ht=htop
alias bt=btop

alias ts='TS_SOCKET=$SOCKETDIR/task-spooler-socket tsp'
alias ts-1='TS_SOCKET=$SOCKETDIR/task-spooler-socket-1 tsp'
alias ts-2='TS_SOCKET=$SOCKETDIR/task-spooler-socket-2 tsp'

# watch
alias wa=viddy

alias stamp='command ts'

alias fini='mpv ~/audio/sonnerie/notification/fini.ogg'

# manual & info {{{1

alias rh=run-help
alias m=man
alias vm='vim-lite.sh +"call library#manual_argv()"'
alias mw=w3mman
alias in=info

# searching {{{1

alias é=searcher
alias è=search-in-irc
alias lc=locate-file

# organization {{{1

#alias ta=task

#alias caltui=calcurse

# mail {{{1

alias a="mail -Y 'h $'"
alias aa=send-mail

alias nm=neomutt
alias M=run-neomutt.zsh
alias A=aerc

alias ab=abook

alias n=newsraft

# usenet {{{1

alias rn=run-slrn.sh

# fediverse {{{1

# alias fedi=tut
# alias Fedi='BROWSER=qutebrowser toot tui'
# alias fl=neonmodem

# navigation {{{1

# Signets

alias bu=run-buku

# Recherche

alias sr=surfraw
alias dg='BROWSER=qutebrowser ddgr'

# Navigateurs

#alias w=w3m
alias w=w3m-textwidth
alias wr='w3m-textwidth -R'
alias ww=elinks

alias www='lynx -cfg=~/racine/config/webrowser/lynx/lynx.cfg -lss=~/racine/config/webrowser/lynx/lynx.lss'

# readable -> w3m
alias wr=webreader

# téléchargement

# aria
alias dl=aria2p
# transmission
alias tmr=transmission-remote
alias tmt=tremc

# gemini

alias afr=amfora

# chat {{{1

# matrix client
alias mrx=gomuks

alias irs=irssi
alias wct=weechat

alias I=weechat

#  date {{{1

alias jour='date +" [=] %A %d %B %Y  (o) %H : %M : %S  | %:z | "'

# network {{{1

alias ftp=lftp
alias tcp=termscp
alias wp=wgetpaste

# script languages {{{1

#alias irb='irb --simple-prompt'

alias rvm-bash='/bin/bash rvm'

# music, video {{{1

alias alsamix='alsamixer -c 0'
alias pm=pulsemixer
alias pmt=ncpamixer

alias mpt=ncmpcpp

alias mp=midiplay.sh
alias tms=timidity-segment.sh
alias fp=fluid-player.sh

alias µ='mpv --no-video'
alias £=mplayer

alias yt='yt-dlp --proxy socks5://localhost:9050/'

alias pc=playerctl

# Vlc {{{2
# ------------------------------------------------------------

#alias vlsh='vlc-shell'

#alias vlc-help='vlc --longhelp --advanced'

#alias vlc-term='vlc -I ncurses --browse-dir ~/audio'

# Serveur
# ------------------------------------

# Serveur vlc, voir ~/racine/fun/zsh/autoload/multimedia/vlc-shell
# pour la connexion en console avec complétion

#alias vlc-server='cd ~/audio && vlc -I rc --rc-host 127.0.0.1:8080'
#alias vlc-extraserver='cd ~/audio && vlc --extraintf rc --rc-host 127.0.0.1:8080'

#alias vlsrv='cd ~/audio && vlc -I rc --rc-host 127.0.0.1:8080'
#alias vlxsrv='cd ~/audio && vlc --extraintf rc --rc-host 127.0.0.1:8080'

# Serveur http

#alias vlc-http='vlc -I http --http-host 127.0.0.1:8080'

# science {{{1

alias 8='octave --no-gui --quiet'
alias 9='octave --gui'

# system {{{1

alias free='free -m'

alias monte='mount | column -t'

alias journeaux='tail /var/log/mail.* | ccze -A'

alias sv=systemctl

# utils {{{1

alias mk='make -k'

alias wo='command w'

alias wh='which -a'

alias vmstat='vmstat 1 4'

# who, mesg, talk, write, wall

# dictionnaries {{{1

alias ds=sdcv
alias dt=translator
alias dy=synonym

alias ç=calc
alias clc=calculator

alias wk=wikicurses
alias wka='wikicurses --wiki ArchWiki'

alias wpt=wikipedia2text
alias wt=wiki-tui
alias wpt=wptranslate

# Arch Linux Wiki
# offline, mode texte

alias aw=wiki-search

# office {{{1

alias 4=sc-im

# weather {{{1

alias we=wego

# window manager {{{1

alias hc=herbstclient

# applications {{{1

alias nautilus='nautilus --no-desktop'

# ------------------------------------

# precommands {{{1

alias mkdir='nocorrect mkdir -p'

# global : alias -g {{{1

alias -g B='| bat'
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

# suffix : alias -s {{{1

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

alias -s midi=timidity
alias -s ogg=mpv
alias -s mp3=mpv
alias -s flac=mpv
alias -s wav=mpv

# folder aliases : hash -d {{{1

hash -d racine=~/racine
hash -d wallpaper=~/graphix/wallpaper

# dossiers dans racine {{{2

hash -d archive=~/racine/archive
hash -d artisan=~/racine/artisan
hash -d automat=~/racine/automat
hash -d common=~/racine/common
hash -d config=~/racine/config
hash -d dotdir=~/racine/dotdir
hash -d example=~/racine/example
hash -d feder=~/racine/feder
hash -d fun=~/racine/fun
hash -d gate=~/racine/gate
hash -d hist=~/racine/hist
hash -d index=~/racine/index
hash -d infoman=~/racine/infoman
hash -d litera=~/racine/litera
hash -d local=~/racine/local
hash -d log=~/racine/log
hash -d mail=~/racine/mail
hash -d musica=~/racine/musica
hash -d network=~/racine/network
hash -d news=~/racine/news
hash -d office=~/racine/office
hash -d omni=~/racine/omni
hash -d organ=~/racine/organ
hash -d pack=~/racine/pack
hash -d papier=~/racine/papier
hash -d pictura=~/racine/pictura
hash -d plain=~/racine/plain
hash -d plugin=~/racine/plugin
hash -d prolang=~/racine/prolang
hash -d public=~/racine/public
hash -d refer=~/racine/refer
hash -d school=~/racine/school
hash -d science=~/racine/science
hash -d self=~/racine/self
hash -d session=~/racine/session
hash -d shell=~/racine/shell
hash -d snippet=~/racine/snippet
hash -d source=~/racine/source
hash -d syncron=~/racine/syncron
hash -d system=~/racine/system
hash -d template=~/racine/template
hash -d trash=~/racine/trash
hash -d varia=~/racine/varia
hash -d wiki=~/racine/wiki

# gate {{{2

hash -d bridge=~/racine/gate/bridge
hash -d hub=~/racine/gate/hub

#  public {{{2

hash -d eclats2vers=~/racine/public/eclats2vers/generic
hash -d equa6on=~/racine/public/equa6on
hash -d blog=~/racine/public/blog

# refer {{{2

hash -d bookmarks=~/racine/refer/bookmarks

# terminal {{{2

hash -d tmuxconf=~/racine/config/multiplex/tmux

# shell, script {{{2

hash -d historique=~/racine/dotdir/zsh

hash -d zconf=$RACINE_ZSH
hash -d zdot=~/racine/dotdir/zsh

# edit {{{2

hash -d vimconf=~/racine/config/edit/vim
hash -d vimliteconf=~/racine/config/edit/vim-lite
hash -d vimailconf=~/racine/config/edit/vim-mail

hash -d neovimconf=~/racine/config/edit/neovim
hash -d neovimliteconf=~/racine/config/edit/neovim-lite

hash -d kakconf=~/racine/config/edit/kak

hash -d emacsconf=~/racine/config/edit/emacs
hash -d emacsliteconf=~/racine/config/edit/emacs-lite

hash -d mdot=~/racine/dotdir/emacs.d

# mail {{{2

hash -d muttconf=~/racine/config/mail/neomutt

# plugins {{{2

hash -d pman=~/racine/plugin/manager
hash -d pdata=~/racine/plugin/data

hash -d vimpackager=~/racine/plugin/manager/vim/pack/packager
hash -d vimlitepackager=~/racine/plugin/manager/vim-lite/pack/packager

hash -d neovimpackager=~/racine/plugin/manager/neovim/pack/packager
hash -d neovimlitepackager=~/racine/plugin/manager/neovim-lite/pack/packager

hash -d elpaca=~/racine/plugin/manager/emacs/elpaca

hash -d tpm=~/racine/plugin/manager/tmux/tmux-plugin-manager/plugins

# artisan {{{2

hash -d lilypond=~/racine/musica/lilypond
hash -d musescore=~/racine/musica/musescore
hash -d rosegarden=~/racine/musica/rosegarden

# multimedia {{{2

hash -d aartistes=~/audio/artistes
hash -d abook=~/audio/book
hash -d ahtml=~/audio/html
hash -d anotif=~/audio/bell/notification

hash -d classique=~/audio/artistes/classique

hash -d jazz=~/audio/artistes/jazz

# synchronization {{{2

hash -d syncthing=~/racine/syncron/syncthing

# papier {{{2

hash -d school=~/racine/school
