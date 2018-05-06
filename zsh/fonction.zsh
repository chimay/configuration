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

	(( $#fichiers > 0 )) || fichiers=(**/*(.))

	command grep --color=never $motif $=fichiers | sed 's/^/  /'
}

# }}}2

# pg : process grep {{{2

pg () {

	local motif

	motif=${1:-''}

	(( $#motif > 0 )) || {

		echo -n "Motif : "
		read motif
		echo
	}

	(( $#motif > 0 )) || return 1

	command ps auxww | command grep -v grep | command grep --color=never $motif
}

# }}}2

# pid : grep process id(s) {{{2

pid () {

	local motif

	motif=${1:-''}

	(( $#motif > 0 )) || {

		echo -n "Motif : "
		read motif
		echo
	}

	(( $#motif > 0 )) || return 1

	command ps auxww | command grep -v grep | command grep --color=never $motif | awk '{print $2}'
}


# }}}2

# psi : process signal {{{2

psi () {

	local motif identifiants reponse signal

	motif=${1:-''}

	(( $#motif > 0 )) || {

		echo -n "Motif : "
		read motif
		echo
	}

	(( $#motif > 0 )) || return 1

	reponse=n

	command ps auxww | command grep -v grep | command grep --color=never $motif
	echo

	identifiants=$(command ps auxww | command grep -v grep | command grep --color=never $motif | awk '{print $2}')

	echo $=identifiants
	echo

	echo -n "Voulez-vous envoyer un signal à ces processus ? (y/n, o/n) "
	read reponse
	echo

	(( $#reponse > 0 )) || return 1

	[ $reponse = y -o $reponse = o -o $reponse = yes -o $reponse = oui ] || return 0

	echo -n "Signal [1 = TERM] (l=liste des signaux) : "
	read signal
	echo

	(( $#signal == 0 )) && signal=1

	while [ $signal = l ]
	do
		echo "Signal		Valeur	Action	Commentaire"
		echo "-----------------------------------------"
		echo "HUP        1       Term    Hangup detected on controlling terminal or death of controlling process"
		echo "INT        2       Term    Interrupt from keyboard"
		echo "QUIT       3       Core    Quit from keyboard"
		echo "ILL        4       Core    Illegal Instruction"
		echo "ABRT       6       Core    Abort signal from abort(3)"
		echo "FPE        8       Core    Floating-point exception"
		echo "KILL       9       Term    Kill signal"
		echo "SEGV      11       Core    Invalid memory reference"
		echo "PIPE      13       Term    Broken pipe: write to pipe with no readers; see pipe(7)"
		echo "ALRM      14       Term    Timer signal from alarm(2)"
		echo "TERM      15       Term    Termination signal"
		echo "USR1   30,10,16    Term    User-defined signal 1"
		echo "USR2   31,12,17    Term    User-defined signal 2"
		echo "CHLD   20,17,18    Ign     Child stopped or terminated"
		echo "CONT   19,18,25    Cont    Continue if stopped"
		echo "STOP   17,19,23    Stop    Stop process"
		echo "TSTP   18,20,24    Stop    Stop typed at terminal"
		echo "TTIN   21,21,26    Stop    Terminal input for background process"
		echo "TTOU   22,22,27    Stop    Terminal output for background process"
		echo

		echo -n "Signal [1 = TERM] (l=liste des signaux) : "
		read signal
		echo

		(( $#signal == 0 )) && signal=1
	done


	echo "kill -$signal $=identifiants"
	echo

	kill -$signal $=identifiants

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

	print -l $PWD >>! $REPERTOIRES_FICHIER
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
