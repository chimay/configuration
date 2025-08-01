#!/bin/zsh

# autoload {{{1

# Voir aussi <url:~/racine/config/cmdline/zsh/zshenv#tn=Fonctions>

# Pour recompiler :
# voir make dans
# ~/racine/fun/zsh/autoload/Makefile

for fichier in ~/racine/fun/zsh/autoload/*/*(.:t)
do
	autoload $fichier
done

for fichier in ~/racine/fun/zsh/completion/*/*(.:t)
do
	autoload $fichier
done

for fichier in ~/racine/fun/zsh/zle/*(.:t)
do
	autoload $fichier
done


# ordinary functions {{{1

# err : display to stderr {{{2

err () {
	print "$@" 1>&2
}


# pager {{{2

pager () {
	local less
	#less="less --lesskey-file=$HOME/racine/built/less/key.out"
	less="less"
	(( $# == 0 )) && {
		$=less .
		return 0
	}
	$=less "$@"
}


# run-ed {{{2

run-ed () {
	local runme='BROWSER=w3m BUKU_COLORS=xXxxx '
	runme=$runme'rlwrap --always-readline --history-no-dupes 2 --multi-line '
	runme=$runme'-H ~/racine/hist/rlwrap/ed.history  '
	runme=$runme'-f ~/racine/hist/rlwrap/ed.comp '
	runme=$runme'-l ~/racine/hist/rlwrap/ed.comp '
	runme=${runme}'ed -v -p " ed : "'
	runme=${runme}" $@"
	echo $runme
	echo
	eval $runme
}

# mvr : move with rsync {{{2

mvr () {
	rsync \
		--verbose \
		--progress \
		--stats \
		--human-readable \
		--itemize-changes \
		--log-file="$HOME/log/rsync.log" \
		--rsh=ssh \
		--recursive \
		--modify-window=1 \
		--owner \
		--group \
		--times \
		--perms \
		--links \
		--remove-source-files \
		"$@"
}

# cp : copy with rsync {{{2

cp () {
	rsync \
		--verbose \
		--progress \
		--stats \
		--human-readable \
		--itemize-changes \
		--log-file="$HOME/log/rsync.log" \
		--rsh=ssh \
		--recursive \
		--modify-window=1 \
		--owner \
		--group \
		--times \
		--perms \
		--links \
		--update \
		"$@"
}

# cpr : copy with rsync, relative path {{{2

cpr () {
	rsync \
		--verbose \
		--progress \
		--stats \
		--human-readable \
		--itemize-changes \
		--log-file="$HOME/log/rsync.log" \
		--rsh=ssh \
		--recursive \
		--modify-window=1 \
		--owner \
		--group \
		--times \
		--perms \
		--links \
		--update \
		--relative \
		"$@"
}

# cpf : copy with rsync, force overwrite {{{2

cpf () {
	rsync \
		--verbose \
		--progress \
		--stats \
		--human-readable \
		--itemize-changes \
		--log-file="$HOME/log/rsync.log" \
		--rsh=ssh \
		--recursive \
		--modify-window=1 \
		--owner \
		--group \
		--times \
		--perms \
		--links \
		--ignore-times \
		"$@"
}

# sn : sync with rsync {{{2

sn () {
	rsync \
		--verbose \
		--progress \
		--stats \
		--human-readable \
		--itemize-changes \
		--log-file="$HOME/log/rsync.log" \
		--rsh=ssh \
		--recursive \
		--modify-window=1 \
		--delete-during \
		--owner \
		--group \
		--times \
		--perms \
		--links \
		--update \
		"$@"
}

# snr : sync with rsync, relative path {{{2

snr () {
	rsync \
		--verbose \
		--progress \
		--stats \
		--human-readable \
		--itemize-changes \
		--log-file="$HOME/log/rsync.log" \
		--rsh=ssh \
		--recursive \
		--modify-window=1 \
		--delete-during \
		--owner \
		--group \
		--times \
		--perms \
		--links \
		--update \
		--relative \
		"$@"
}

#  snf : sync with rsync, force overwrite {{{2

snf () {
	rsync \
		--verbose \
		--progress \
		--stats \
		--human-readable \
		--itemize-changes \
		--log-file="$HOME/log/rsync.log" \
		--rsh=ssh \
		--recursive \
		--modify-window=1 \
		--delete-during \
		--owner \
		--group \
		--times \
		--perms \
		--links \
		--ignore-times \
		"$@"
}

# sl : symbolic link {{{2

sl () {
	local target=$1
	local link=$2
	local overwrite
	(( $#target == 0 )) && {
		echo "Usage : sl target link"
		return 0
	}
	(( $#link == 0 )) && link=${target##*/}
	if [ -e $link ]
	then
		if [ -L $link ]
		then
			print -n "Link already exists. Overwrite ? (y/[N]) "
			read overwrite
			(( $#overwrite == 0 )) && overwrite=n
			#echo "overwrite = $overwrite"
			[ $overwrite = y* ] || return 0
			echo "rm -f $link"
			rm -f $link
		else
			echo "File already exists but is not a link."
			return 0
		fi
	fi
	echo "ln -s $target $link"
	ln -s $target $link
}

# swap-files : échange des noms de fichiers {{{2

swap-files () {
	(( $# < 2 )) && {
		echo "Usage : x <file-1> <file 2>"
		echo
		return 1
	}
	local TMPFILE=$(mktemp)
	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}

# number-of-files {{{2

number-of-files () {
	local arguments
	local repertoire
	if (( $# == 0 ))
	then
		arguments=.
	else
		arguments=($@)
	fi
	for repertoire in $arguments
	do
		[[ -d $repertoire ]] || continue
		echo "`print -l ${repertoire}/**/*(.) | wc -l` : $repertoire"
	done
}

# most-recently-modified files {{{2

most-recently-modified () {
	local vecteur=()
	local autres=()
	while true
	do
		case $1 in
			[0-9]##)
				vecteur+=$1
				shift
				;;
			?*)
				autres+=$1
				shift
				;;
			*)
				break
				;;
		esac
	done
	local nombre=${vecteur[1]:-7}
	local repertoire=${autres[1]:-.}
	echo Répertoires
	echo "------------"
	echo
	command ls -ltd $repertoire/*(/) | head -n $nombre
	echo
	echo Fichiers
	echo "------------"
	echo
	command ls -lt $repertoire/**/*(.om[1,$nombre])
}


# {{{ clifm

# CliFM CD on quit function

# Description
# Run CliFM and, after exit, read the .last file and cd into it

# 1) Customize this function as you need and add copy it or source it from your shell configuration file (e.g., .bashrc, .zshrc, etc)
# 2) Restart your shell (for changes to take effect)
# 3) Run clifm using the name of the function below: clifm [ARGS ...]

# CliFM CD on quit function

clifm() {
	command clifm "--cd-on-quit" "$@"
	local dir="$(grep "^\*" "${XDG_CONFIG_HOME:=${HOME}/.config}/clifm/.last" 2>/dev/null | cut -d':' -f2)";
	if [ -d "$dir" ]; then
		cd -- "$dir" || return 1
	else
		printf "No directory specified\n" >&2
	fi
}

# }}}

# run-vifm {{{2

run-vifm () {
	local dir=$(pwd)
	cd ~/racine/config/fileman/vifm
	vifm-clean-matchers.sh vifminfo.json
	cd sessions
	vifm-clean-matchers.sh *.json
	cd $dir
	vifmrun
}


# yank-file {{{2

yank-file () {
	cat $1 | xclip -i -selection clipboard
}


# searcher : grep like search {{{2

searcher () {
	local motif fichiers
	motif=${1:-''}
	(( $# > 0 )) && shift
	fichiers=(${*:-()})
	(( $#motif > 0 )) || {
		echo -n "Motif : "
		read motif
		echo
	}
	(( $#motif > 0 )) || return 1
	if command -v rg &> /dev/null
	then
		echo Using ripgrep
		echo
		(( $#fichiers > 0 )) || fichiers=(.)
		#command rg --heading --smart-case --vimgrep $motif $=fichiers
		command rg --heading --smart-case --line-number $motif $=fichiers
	elif command -v ag &> /dev/null
	then
		echo Using silver searcher
		echo
		(( $#fichiers > 0 )) || fichiers=(.)
		command ag --nocolor --vimgrep --smart-case $motif $=fichiers | sed 's/^/  /'
	elif command -v ack &> /dev/null
	then
		echo Using ack
		echo
		(( $#fichiers > 0 )) || fichiers=(.)
		ack --nocolor --nogroup --column --smart-case $motif $=fichiers | sed 's/^/  /'
	elif command -v grep &> /dev/null
	then
		echo Using grep
		echo
		(( $#fichiers > 0 )) || fichiers=(**/*(.))
		command grep --color=never $motif $=fichiers | sed 's/^/  /'
	fi
}

# grep-command {{{2

grep-command () {
	print -l $commands | command grep "$@"
}


# locate-file {{{2

locate-file () {
	local options mots dossier motifs database
	options=()
	mots=()
	while true
	do
		case $1 in
			-*)
				options+=$1
				shift
				;;
			?*)
				mots+=$1
				shift
				;;
			*)
				break
				;;
		esac
	done
	if (( $#mots >= 2 ))
	then
		dossier=$mots[1]
		motifs=$mots[2,-1]
	elif (( $#mots == 1 ))
	then
		dossier=racine
		motifs=$mots
	fi
	case $dossier in
		r|ra|rac|raci|racin|racine)
			database=~/racine/index/filesys/locate/racine.db
			;;
		ul|ulo|uloc|usrloc|usrlocal)
			database=~/racine/index/filesys/locate/usr-local.db
			;;
		g|gr|graph|graphix)
			database=~/racine/index/filesys/locate/graphix.db
			;;
		a|au|aud|audi|audio)
			database=~/racine/index/filesys/locate/audio.db
			;;
		f|ph|pho|phot|photo)
			database=~/racine/index/filesys/locate/photo.db
			;;
		dc|dotconfig)
			database=~/racine/index/filesys/locate/dotconfig.db
			;;
		dl|dotlocal)
			database=~/racine/index/filesys/locate/dotlocal.db
			;;
		p|pa|pac|pacman|pacmanlib)
			database=~/racine/index/filesys/locate/pacman-lib.db
			;;
	esac
	echo "plocate -d $database -e -A $=options $=motifs | fzf | xclip -i -selection clipboard"
	echo
	plocate -d $database -e -A $=options $=motifs | fzf | xclip -i -selection clipboard
}

# yazi file manager {{{2

# 3 panes by default

function 3 () {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# search in irc {{{2

search-in-irc () {
	local files=($(rg -l "$@" ~/racine/log/irc/irc-*))
	{ print -l $=files ; echo ; cat $=files } | less
}

# vim-quickfix {{{2

vim-quickfix () {
	if command -v rg &> /dev/null
	then
		echo Using ripgrep
		vim +cope -q <(rg --vimgrep --smart-case "$@")
	elif command -v ag &> /dev/null
	then
		echo Using silver searcher
		vim +cope -q <(ag --nocolor --vimgrep --smart-case "$@")
	elif command -v ack &> /dev/null
	then
		echo Using ack
		vim +cope -q <(ack --nocolor --nogroup --column --smart-case "$@")
	elif command -v grep &> /dev/null
	then
		echo Using grep
		vim +cope -q <(grep --line-number --ignore-case --no-messages "$@")
	fi
}

# process-grep {{{2

process-grep () {
	local motif
	motif="$@"
	(( $#motif > 0 )) || {
		echo -n "Motif : "
		read motif
		echo
	}
	(( $#motif > 0 )) || return 1
	command ps --no-headers -eo '%p %a' | command grep -v grep | command grep --color=never $motif
}


# process-iden {{{3

process-iden () {
	local motif
	motif="$@"
	(( $#motif > 0 )) || {
		echo -n "Motif : "
		read motif
		echo
	}
	(( $#motif > 0 )) || return 1
	command ps --no-headers -eo '%p %a' | \
		command grep -v grep | \
		command grep --color=never $motif | \
		awk '{print $1}'
}

# process-group {{{2

process-group () {
	local motif listiden iden groupe arbre
	motif="$@"
	(( $#motif > 0 )) || {
		echo -n "Motif : "
		read motif
		echo
	}
	(( $#motif > 0 )) || return 1
	listiden=($(
		command ps --no-headers -eo '%p %a' |
		command grep -v grep |
		command grep --color=never $motif |
		awk '{print $1}'
	))
	for iden in $=listiden
	do
		groupe=$(ps --no-headers -o "%r" -p $iden | tr -d ' \t\n\r')
		arbre=($(
			ps -eo "%r %p" |
			awk '{ if ( $1 == '$groupe' ) print $2 }'
		))
		echo "Groupe de $iden : $groupe"
		echo "------------------------------"
		echo
		command ps -o "%r %p %a" -p $=arbre
		echo
	done
}

# process-tree {{{2

process-tree () {
	local motif listiden iden listgroupes groupe
	local parent enfant racine
	motif="$@"
	(( $#motif > 0 )) || {
		echo -n "Motif : "
		read motif
		echo
	}
	(( $#motif > 0 )) || return 1
	listiden=($(
		command ps --no-headers -eo '%p %a' |
		command grep -v grep |
		command grep --color=never $motif |
		awk '{print $1}'
	))
	listgroupes=()
	typeset -A grpiden
	for iden in $=listiden
	do
		groupe=$(ps --no-headers -o "%r" -p $iden | tr -d ' \t\n\r')
		listgroupes+=$groupe
		grpiden[$groupe]=$iden
	done
	listgroupes=(${(u)listgroupes})
	for groupe in $=listgroupes
	do
		enfant=$grpiden[$groupe]
		while true
		do
			parent=$( \
				ps -eo "%r %P %p" | \
				awk '{ if ( $1 == '$groupe' && $3 == '$enfant' ) print $2 }' \
			)
			echo "$parent -> $enfant"
			echo
			if (( $#parent > 0 ))
			then
				enfant=$parent
				racine=$parent
			else
				break
			fi
		done
		echo Racine : $racine
		echo
		pstree -p $racine
		echo
		ps -eo "%r %p %a" --forest | awk '{ if ( $1 == '$groupe' ) print $0 }'
	done
}

# signal-all : send signal to all processes matching a pattern {{{2

signal-all () {
	local signal motif iden
	while true
	do
		case $1 in
			[0-9]##)
				signal=$1
				shift
				;;
			?*)
				motif=$1
				shift
				;;
			*)
				break
				;;
		esac
	done
	(( $#signal > 0 )) || signal=15
	iden=($(pgrep -f "$motif"))
	(( $#iden == 0 )) && {
		echo No process found.
		return 0
	}
	echo "kill -$signal $=iden"
	echo
	kill -$signal $=iden
}

# psi : process signal, more interactive than signal-all {{{2

process-signal () {
	local motif signal identifiants reponse
	reponse=n
	while true
	do
		case $1 in
			-y)
				reponse=y
				shift
				;;
			[0-9]##)
				signal=$1
				shift
				;;
			?*)
				motif=$1
				shift
				;;
			*)
				break
				;;
		esac
	done
	(( $#motif > 0 )) || {
		echo -n "Motif : "
		read motif
		echo
	}
	(( $#motif > 0 )) || return 1
	command ps --no-headers -eo '%p %a' | command grep -v grep | command grep --color=never $motif
	echo
	identifiants=($(
		command ps --no-headers -eo '%p %a' |
		command grep -v grep |
		command grep --color=never $motif |
		awk '{print $1}'
	))
	echo $=identifiants
	echo
	(( $#identifiants > 0 )) || return 2
	[ $reponse = y ] || {
		echo -n "Voulez-vous envoyer un signal à ces processus ? (y/n, o/n) "
		read reponse
		echo
	}
	(( $#reponse > 0 )) || return 1
	[ $reponse = y -o $reponse = o -o $reponse = yes -o $reponse = oui ] || return 0
	(( $#signal > 0 )) || {
		echo -n "Signal [15 = TERM] (l=liste des signaux) : "
		read signal
		echo
	}
	(( $#signal == 0 )) && signal=15
	while [ $signal = l ]
	do
		bash -c 'kill -L'
		echo
		echo -n "Signal [15 = TERM] (l=liste des signaux) : "
		read signal
		echo
		(( $#signal == 0 )) && signal=15
	done
	echo "kill -$signal $=identifiants"
	echo
	kill -$signal $=identifiants
}


# webreader : using readable & w3m {{{2

webreader () {
	readable $1 | w3m -T text/html
	#readable $1 -p html-title,html-content | w3m -T text/html
}


# mail {{{2

mua () {
	local executable
	which mail && executable=mail
	which s-nail && executable=s-nail
	$executable
}


# send-mail {{{2

send-mail () {
	local name=$1
	local recipient=$(abook --mutt-query $name | fzf | cut -f 1)
	echo "mail $recipient"
	mail $recipient
}

# calculator {{{2

calculator () {
	local expression="$@"
	cat <<- EOF | bc -l
		scale = 7
		$expression
	EOF
}


# translator {{{2

translator () {
	# translator from:to keywords
	local fromto=$1
	local file=~/racine/index/dict/translation/$fromto
	shift
	local search=${@//\'/}
	local words=($=search)
	local pattern="^  $words"'$'
	if grep $pattern $file &>/dev/null
	then
		less -p $pattern -f $file
	else
		echo trans $fromto "$words"
		echo
		echo '------------------------------' >>! $file
		echo "  $words" >>! $file
		echo '------------------------------' >>! $file
		echo >>! $file
		trans $fromto "$words" | tee -a $file
		echo >>! $file
	fi
}


# synonym {{{2

synonym () {
	local lang=$1
	local file=~/racine/index/dict/synonym/thesaurus-$lang
	shift
	local search=${@//\'/}
	local words=($=search)
	local pattern="^  $words"'$'
	if grep $pattern $file &>/dev/null
	then
		less -p $pattern -f $file
	else
		echo synonym -l $lang "$words"
		echo
		echo '------------------------------' >>! $file
		echo "  $words" >>! $file
		echo '------------------------------' >>! $file
		echo >>! $file
		command synonym -l $lang "$words" | tee -a $file
		echo >>! $file
	fi
}


# run-buku {{{2

run-buku () {
	local runme='BROWSER=w3m BUKU_COLORS=xXxxx '
	runme=$runme'rlwrap --always-readline --history-no-dupes 2 --multi-line '
	runme=$runme'-H ~/racine/hist/rlwrap/buku.history '
	runme=$runme'-f ~/racine/hist/rlwrap/buku.comp '
	runme=$runme'-l ~/racine/hist/rlwrap/buku.comp '
	runme=${runme}"buku $@"
	echo $runme
	echo
	eval $runme
}


# ssh {{{2

ssh() {
	local options mots
	local code=0
	local ancien
	local nom
	options=()
	while true
	do
		case $1 in
			-*)
				options+=$1
				shift
				;;
			*)
				break
				;;
		esac
	done
	mots=("$@")
	nom=${mots[1]%.*}
	echo nom = $nom
	echo
	ancien=$(tmux display-message -p '#{window_name}')
	if [ $TERM = tmux -o $TERM = tmux-256color ]
	then
		tmux rename-window "$nom"
		echo "command ssh $=options $=mots"
		echo
		command ssh $=options $=mots
		code=$?
		tmux rename-window $ancien
    else
		echo "command ssh $=options $=mots"
		echo
		command ssh $=options $=mots
		code=$?
    fi
	return $code
}


# sshx : ssh -X pour lancer des apps X Window {{{2

sshx() {
	local options mots
	local code=0
	local ancien
	local nom
	options=()
	while true
	do
		case $1 in
			-*)
				options+=$1
				shift
				;;
			*)
				break
				;;
		esac
	done
	mots=("$@")
	nom=${mots[1]%.*}
	echo nom = $nom
	echo
	ancien=$(tmux display-message -p '#{window_name}')
	if [ $TERM = tmux -o $TERM = tmux-256color ]
	then
		tmux rename-window "$nom"
		echo "command ssh -X -C $=options $=mots"
		echo
		command ssh -X -C $=options $=mots
		code=$?
		tmux rename-window $ancien
    else
		echo "command ssh -X -C $=options $=mots"
		echo
		command ssh -X -C $=options $=mots
		code=$?
    fi
	return $code
}

# cmd-mpv {{{2

cmd-mpv () {
	echo $* > ~/racine/run/fifo/mpv
}


# listen-and-clean {{{2

listen-and-clean () {
	local pattern=${1:-"[U-Z]"}
	local number_of_songs=${2:-1}
	local songnumber=0
	local donotremove=~/log/listen-and-clean-do-not-remove.log
	local answer
	echo number of songs : $number_of_songs
	echo
	while [ $songnumber -lt $number_of_songs ]
	do
		echo song number : $songnumber
		echo
		local glob="~/audio/$pattern"
		local pack=($~glob)
		local songlist=($(print -l $pack | shuf))
		local index=1
		local length=$#songlist
		local song=$songlist[$index]
		echo trying song index in list : $index
		echo trying song : $song
		echo
		while grep $song $donotremove &>/dev/null && (( index < length ))
		do
			(( index ++ ))
			song=$songlist[$index]
			echo trying song index in list : $index
			echo trying song : $song
			echo
		done
		echo playing : $song
		echo
		mpv $song
		echo
		echo -n 'Remove ? (y/n) '
		read answer
		echo
		if [ $answer = y ]
		then
			rm -f $song
		else
			echo $song >>! $donotremove
		fi
		(( songnumber ++ ))
	done
}

# unlock gnome keyring {{{2

# credit : https://unix.stackexchange.com/questions/602313/unlock-gnome-keyring-daemon-from-command-line

function unlock-gnome-keyring()
{
    local keyringPass=$(zenity --password)
    echo -n "$keyringPass" | gnome-keyring-daemon -dr --unlock
}

# lock gnome keyring {{{2

# credit : https://unix.stackexchange.com/questions/602313/unlock-gnome-keyring-daemon-from-command-line

function lock-gnome-keyring()
{
    pkill -u "$(whoami)" -f gnome-keyring-daemon
}

#  automatic functions {{{1

#  eval-ssh-agent {{{2

eval-ssh-agent () {
	emulate -R zsh
	setopt local_options
	setopt warn_create_global
	typeset -gx SSH_AUTH_SOCK SSH_AGENT_PID
	local psgrep='/bin/ps auxww | /bin/grep -v grep | /bin/grep --color=never'
	local repertoire=$HOME/racine/run/ssh
	local fichier=$repertoire/agent
	[[ -d $repertoire ]] || mkdir -p $repertoire
	if ! eval $=psgrep ssh-agent &>>| ~/log/psgrep.log
	then
		echo "On lance ssh-agent"
		echo
		ssh-agent >| $fichier
	else
		echo "ssh-agent tourne déjà"
		echo
	fi
	local ligne
	while read ligne
	do
		eval $ligne
	done < $fichier
	echo
	echo "SSH_AUTH_SOCK = $SSH_AUTH_SOCK"
	echo
	echo "SSH_AGENT_PID = $SSH_AGENT_PID"
}

# zle functions {{{1

# Ne pas oublier :
#
# zle -N fonction
#
# avant
#
# bindkey '...' fonction

# avant-plan {{{2

avant-plan () {
	fg %%
	zle reset-prompt
}

# Copie et désactive région {{{2

copie-et-desactive-region () {
	emulate -R zsh
	setopt local_options
	setopt warn_create_global
	zle copy-region-as-kill
	(( REGION_ACTIVE == 1 )) && REGION_ACTIVE=0
}


# Fzf & Greenclip {{{2

fzf-greenclip () {
	emulate -R zsh
	setopt local_options
	setopt warn_create_global
	tampon=$BUFFER
	copie=$(greenclip print | fzf)
	echo $copie | xclip -selection clipboard
	zle reset-prompt
	zle kill-buffer
	LBUFFER=$copie
	zle quote-line
	LBUFFER=$tampon$LBUFFER
	zle beginning-of-line
}

# math functions {{{1

#zmodload -i zsh/mathfunc

# Gaussienne {{{2

# function zmath_gauss () {
# 	local x mu sigma
# 	x=$1
# 	mu=$2
# 	sigma=$3
# 	(( exp( - (x - mu) * (x - mu) / sigma ** 2 ) ))
# }

# functions -M gauss 3 3 zmath_gauss

# hook functions {{{1

# Chpwd {{{2

# Voir aussi
# <url:zshenv#tn=DIRSTACKSIZE>
# <url:zshrc#tn=REPERTOIRES_FICHIER>
# <url:zlogout>

typeset -ga chpwd_functions

chpwd () {
	print -l $PWD >>! $REPERTOIRES_FICHIER
}


# Periodic {{{2

typeset -ga period_functions

# Exécutée chaque $PERIOD secondes

periodic () {


}


# Precmd {{{2

typeset -ga precmd_functions

precmd () {
	case $TERM in
		xterm*)
			print -Pn "\e]0;%n@%m: %~\a"
			;;
	esac
}


# Preexec {{{2

typeset -ga preexec_functions

preexec () {
	echo
}


#  Zshaddhistory {{{2

typeset -ga zshaddhistory_functions

zshaddhistory () {
	emulate -R zsh
	setopt local_options
    local line=${1%%$'\n'}
    local cmd=${line%% *}
	local argts=${(j/ /)argv}
    [[ ${#line} -ge 1
        && ${cmd}   != (plouf|plou[gh])
		&& ${argts} != *tutututututu*
		&& ${argts} != *totototototo*
    ]]
}


# Zshexit {{{2

typeset -ga zshexit_functions

zshexit () {


}



# special widgets {{{1

function zle-line-init zle-keymap-select {
	if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} ))
	then
		printf '%s' "${terminfo[smkx]}"
	fi
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}+"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
