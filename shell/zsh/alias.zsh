# vim: set ft=zsh :

# Touches non utilisées {{{1


#  Généralités {{{1

# Commande qui ne fait rien
# REM : pass est une commande de gestion de mot de passe

alias nope=:

# Vrai et faux

# alias vrai=true
# alias faux=false

alias rr='builtin r'


# ------------------------------------

# Documentation {{{1

# tldr, cheatsheets, ...


# Self {{{1

alias cm='chezmoi -c ~/racine/self/chezmoi/config/chezmoi.toml -S ~/racine/self/chezmoi/source -D ~'


# Sudo {{{1

# Remplacement pour gksu, kdesu

alias gsu=pkexec


#  Affichage {{{1

alias e='print -l'
alias ef='printf'
alias c=cat
alias valve=wall


#  Clavier {{{1

alias azer="setxkbmap be ; xmodmap ~/racine/config/windenv/xmodmap/belge-meta-super-hyper"


#  Contrôle de version {{{1

alias g=git
alias r=lazygit
alias 9=tig

#alias diff='diff -BN'

alias p1='patch -p1 < '


#  Visualisation {{{1

alias p=pager

alias pp='pager +G'

alias b=bat
alias q='most -C'

alias u=vimpager

alias tt='multitail'

alias taco='multitail -C -ts'

# PDF, EPUB

alias d=zathura
#alias d=apvlv

# Images

alias 1=ucollage
alias i=sxiv
alias ii=vimiv
alias iii=feh

# Fontes

alias fntprev='fontpreview-ueberzug -f "#5b3c11" -b "#000000"'

#  Édition {{{1

# Ed {{{2
# ------------------------------------------------------------

alias ed=run-ed


# Vim {{{2

alias v=vim
alias vi=vim

alias vid=vimdiff

alias vq=vim-quickfix

alias se=sudoedit


#  Neovim {{{2

alias nv=nvim
alias ns='run-neovim-server.sh &'
alias nvc=run-neovim-client.sh
alias nvqc=run-neovim-qt-client.sh

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

# Emacs {{{2

alias esrv=run-emacs-server

alias emx='emacs -nw'

alias mx='emacs -nw -q -l ~/racine/config/edit/emacs/leger.el'

# Emacs : client graphique, voir ~/racine/shell/run/run-emacs-client.zsh

# Client terminal

alias em='emacsclient -t'

# Se connecte à un frame existant

alias emopen='emacsclient'

alias test-emacs='cd ~/racine/test/emacs && HOME=~/racine/test/emacs emacs'

#  Système de fichiers {{{1

# Liste {{{2

if [ $OPERASYS = freebsd ]
then
	alias l=ls
	alias la='ls -a'
	alias ll='ls -l'
else
	alias l='command ls --color=auto --show-control-chars'
	alias ll='command ls -l --color=auto'
	alias la='command ls -a --color=auto'
	alias ls='lsd'
	alias lsl='lsd -l'
	alias lsa='lsd -a'
fi

alias ù=most-recently-modified
alias nf=number-of-files


# Répertoires {{{2

alias 0='cd ~/racine'

alias pw='pwd'

alias cdfzf='cd $(fzfz)'


# Arborescence {{{2

alias tree='tree -C -A'


# Place {{{2

alias df='df -h'
alias dfc='dfc -c never'

alias du='du -sh'
alias duc='ncdu --color off'


# Renommage & Déplacement {{{2

alias mv='mv -i'

alias mm='qmv -f destination-only -d -e kak'

# vi folder

#alias vd=vidir

alias vd=edir


# Copie {{{2

alias mcp='qcp -d'

# Suppression {{{2

alias rm=trash-put

alias tls=trash-list
alias trs=trash-restore

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
alias fm=run-vifm

alias cf='clifm --no-color'

alias mc='mc -b'

# Copier & Coller {{{1

alias y=yank-file

alias ç='xclip -i -selection clipboard'
alias à='xclip -o -selection clipboard'

alias ç1='xclip -i -selection primary'
alias ç2='xclip -i -selection secondary'

alias à1='xclip -o -selection primary'
alias à2='xclip -o -selection secondary'

#  Paquets {{{1

alias pk='pack'


#  Processus {{{1

alias j='jobs'

alias t=htop

alias ts=tsp
alias stamp='command ts'

alias pg='pgrep -af'
alias s=kill
alias sa=signal-all

alias fini='mpv ~/audio/sonnerie/notification/fini.ogg'


#  Manuel & Info {{{1

alias rh=run-help
alias m=man

alias mw=w3mman

alias in=info


#  Recherche {{{1

alias é=searcher
alias è='rg --vimgrep --smart-case'


# Organisation {{{1

alias ta=task

alias clc=calcurse


# Courriel {{{1

alias a="mail -Y 'h $'"
alias àà=send-mail

alias nm=neomutt
alias M=run-neomutt.zsh
alias A=aerc

alias £=abook

alias n=newsboat

# Usenet {{{1

alias rn=run-slrn.sh

# Fediverse {{{1

alias f='tut'
alias F='BROWSER=qutebrowser toot tui'
alias fl=neonmodem

# Navigation {{{1

# Signets

alias bu=run-buku

# Recherche

alias sr=surfraw
alias dg='BROWSER=qutebrowser ddgr'

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

# Chat {{{1

# matrix client
alias mrx=gomuks

alias irs=irssi
alias wct=weechat

alias I=weechat

#  Date {{{1

alias jour='date +" [=] %A %d %B %Y  (o) %H : %M : %S  | %:z | "'


# Réseau {{{1

alias ftp=lftp
alias wp=wgetpaste

#  Langages de script {{{1

#alias irb='irb --simple-prompt'

alias rvm-bash='/bin/bash rvm'


#  Musique, Vidéo {{{1

alias alsamix='alsamixer -c 0'
alias pm=pulsemixer
alias pmt=ncpamixer

alias mp=midiplay.sh
alias tms=timidity-segment.sh
alias fp=fluid-player.sh

alias µ='mpv --no-video'

alias mpt=ncmpcpp

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



#  Science {{{1

alias 8='octave --no-gui --quiet'

#  Surveillance système {{{1

alias free='free -m'

alias monte='mount | column -t'

alias journeaux='tail /var/log/mail.* | ccze -A'

alias sv=systemctl


# Utilitaires {{{1

alias wo='command w'

alias wh='which -a'

alias vmstat='vmstat 1 4'

# who, mesg, talk, write, wall


# Dictionnaires {{{1

alias ds=sdcv
alias dt=translator
alias dy=synonym

alias çç=calculator

alias wk=wikicurses
alias wka='wikicurses --wiki ArchWiki'

alias wpt=wikipedia2text
alias wt=wiki-tui
alias wpt=wptranslate

# Arch Linux Wiki
# offline, mode texte

alias aw=wiki-search


# Bureautique {{{1

alias 4=sc-im


# Météo {{{1

alias we=wego


# Applications {{{1

alias nautilus='nautilus --no-desktop'


# ------------------------------------

#  Précommandes {{{1

alias mkdir='nocorrect mkdir -p'


#  Globaux : alias -g {{{1

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

alias -s midi=timidity
alias -s ogg=mpv
alias -s mp3=mpv
alias -s flac=mpv
alias -s wav=mpv


#  Alias de répertoires : hash -d {{{1

hash -d racine=~/racine
hash -d wallpaper=~/graphix/wallpaper

# Dossiers dans racine {{{2

hash -d archive=~/racine/archive
hash -d artisan=~/racine/artisan
hash -d automat=~/racine/automat
hash -d bridge=~/racine/bridge
hash -d common=~/racine/common
hash -d config=~/racine/config
hash -d dotdir=~/racine/dotdir
hash -d example=~/racine/example
hash -d feder=~/racine/feder
hash -d fun=~/racine/fun
hash -d gate=~/racine/gate
hash -d hist=~/racine/hist
hash -d hub=~/racine/hub
hash -d index=~/racine/index
hash -d infoman=~/racine/infoman
hash -d litera=~/racine/litera
hash -d local=~/racine/local
hash -d log=~/racine/log
hash -d mail=~/racine/mail
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
hash -d prolang=~/racine/prolang
hash -d public=~/racine/public
hash -d refer=~/racine/refer
hash -d run=~/racine/run
hash -d science=~/racine/science
hash -d search=~/racine/search
hash -d self=~/racine/self
hash -d session=~/racine/session
hash -d shell=~/racine/shell
hash -d site=~/racine/site
hash -d snippet=~/racine/snippet
hash -d source=~/racine/source
hash -d syncron=~/racine/syncron
hash -d system=~/racine/system
hash -d template=~/racine/template
hash -d trash=~/racine/trash
hash -d varia=~/racine/varia

#  Site {{{2

hash -d eclats2vers=~/racine/site/eclats2vers/generic
hash -d equa6on=~/racine/site/equa6on/generic

# Terminal {{{2

hash -d tmuxconf=~/racine/config/multiplex/tmux

# Shell, Script {{{2

hash -d historique=~/racine/dotdir/zsh

hash -d zconf=$RACINE_ZSH
hash -d zdot=~/racine/dotdir/zsh

# Edit {{{2

hash -d vimconf=~/racine/config/edit/vim
hash -d neovimconf=~/racine/config/edit/neovim
hash -d kakconf=~/racine/config/edit/kak
hash -d emacsconf=~/racine/config/edit/emacs

hash -d mdot=~/racine/dotdir/emacs.d

# Mail {{{2

hash -d muttconf=~/racine/config/mail/neomutt

# Plugins {{{2

hash -d pman=~/racine/plugin/manager
hash -d pdata=~/racine/plugin/data

hash -d vimpackager=~/racine/plugin/manager/vimpack/packager
hash -d neovimpackager=~/racine/plugin/manager/neovimpack/packager
hash -d elpaca=~/racine/plugin/manager/elpaca
hash -d straight=~/racine/plugin/manager/straight
hash -d elget=~/racine/plugin/manager/el-get

# Artisan {{{2

hash -d lilypond=~/racine/musica/lilypond
hash -d musescore=~/racine/musica/musescore
hash -d rosegarden=~/racine/musica/rosegarden

# Multimedia {{{2

hash -d aartistes=~/audio/artistes
hash -d abook=~/audio/book

hash -d classique=~/audio/artistes/classique

hash -d jazz=~/audio/artistes/jazz

#  Synchronization {{{2

hash -d syncthing=~/racine/syncron/syncthing
