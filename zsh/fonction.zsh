# vim: set ft=zsh :

# Autoload {{{1

# Pour recompiler :
# voir make dans
# ~/racine/dotdir/zsh/autoload/Makefile

for fichier in ~/racine/dotdir/zsh/autoload/*/*(.:t)
do
	autoload $fichier
done

# }}}1

# Fonctions ordinaires {{{1

# grep {{{2

grep () {

	command grep --color=never $* | sed 's/^/  /'
}

# }}}2

# pg : process grep {{{2

pg () {
	command ps auxww | command grep -v grep | command grep --color=never $1
}

# }}}2

# pid : grep process id(s) {{{2

pid () {
	command ps auxww | command grep -v grep | command grep --color=never $1 | awk '{print $2}'
}


# }}}2

# pstop : process stop {{{2

pstop () {

	local identifiants reponse

	command ps auxww | command grep -v grep | command grep --color=never $1
	echo

	identifiants=$(command ps auxww | command grep -v grep | command grep --color=never $1 | awk '{print $2}')

	echo $=identifiants
	echo

	echo -n "Voulez-vous arrêter ces processus ? (y/n, o/n) "
	read reponse
	echo

	if [ $reponse = y -o $reponse = o -o $reponse = yes -o $reponse = oui ]
	then
		echo "kill $=identifiants"
		echo

		kill $=identifiants
	else
		return 0
	fi

}

# }}}2

# nf : nombre-de-fichiers {{{2

nf () {
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

# }}}2

# err: display to stderr {{{2

err () {

	print "$@" 1>&2
}

# }}}2

# x : échange des noms de fichiers {{{2

x () {
	(( $# < 2 )) && {
		echo "Usage : x <file-1> <file 2>"
		echo
		return 1
	}

	local TMPFILE=tmp-$1-$2.$$

	mv "$1" $TMPFILE

	mv "$2" "$1"

	mv $TMPFILE "$2"
}

# }}}2

# pageur {{{2

pageur () {
	local less

	less="less --lesskey-file=$HOME/racine/built/less/key.out"

	(( $# == 0 )) && {

		$=less .

		return 0
	}

	$=less "$@"
}

# }}}2

# commande-mplayer {{{2

commande-mplayer () {

	echo $* > ~/racine/run/fifo/mplayer
}

# }}}2

# lh : liste-recents {{{2

lh () {

	command ls -lht "$@" | command head -n 13
}

# }}}2

# ssh {{{2

ssh() {

	local code=0
	local ancien
	local nom="${*%.*}"

	ancien=$(tmux display-message -p '#{window_name}')

	if [ $TERM = tmux -o $TERM = tmux-256color ]
	then
		tmux rename-window "$nom"

        command ssh "$@"

		code=$?
    else
        command ssh "$@"

		code=$?
    fi

	tmux rename-window $ancien

	return $code
}

# }}}2

# }}}1

# Fonctions ZLE {{{1

# Copie et désactive région {{{2

copie-et-desactive-region() {

	zle copy-region-as-kill

	(( REGION_ACTIVE == 1 )) && REGION_ACTIVE=0
}

# }}}2

# }}}1

# Fonctions mathématiques {{{1

# Module {{{2

zmodload -i zsh/mathfunc

# }}}2

# Gaussienne {{{2

#function zmath_gauss() {

	#local x mu sigma

	#x=$1
	#mu=$2
	#sigma=$3
	#(( exp( - (x - mu) * (x - mu) / sigma ** 2 ) ))
#}

#functions -M gauss 3 3 zmath_gauss

# }}}2

# }}}1

# Crochets {{{1

# Chpwd {{{2

typeset -ga chpwd_functions

function chpwd {

	print -l $PWD ${(u)dirstack} >! $REPERTOIRES_FICHIER
}

# }}}2

# Periodic {{{2

typeset -ga period_functions

# Exécutée chaque $PERIOD secondes

function periodic {


}

# }}}2

# Precmd {{{2

typeset -ga precmd_functions

function precmd {

	case $TERM in
		xterm*)
			print -Pn "\e]0;%n@%m: %~\a"
			;;
	esac
}

# }}}2

# Preexec {{{2

typeset -ga preexec_functions

function preexec {

	echo
}

# }}}2

#  Zshaddhistory {{{2

typeset -ga zshaddhistory_functions

function zshaddhistory {

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

# }}}2

# Zshexit {{{2

typeset -ga zshexit_functions

function zshexit {


}

# }}}2

# }}}1
