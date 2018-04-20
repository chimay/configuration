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

# ssh {{{2

ssh() {

	local code=0
	local ancien

	ancien=$(tmux display-message -p '#{window_name}')

	if [ $TERM = tmux -o $TERM = tmux-256color ]
	then
		tmux rename-window "$*"

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

# pg {{{2

pg () {
	command ps auxww | command grep -v grep | command grep --color=never $1
}

# }}}2

# pid {{{2

pid () {
	command ps auxww | command grep -v grep | command grep --color=never $1 | awk '{print $2}'
}


# }}}2

# pstop {{{2

pstop () {
	local reponse pid

	command ps auxww | command grep -v grep | command grep --color=never $1

	echo
	echo -n "Voulez-vous arrêter ces processus ? (y/n, o/n) "
	read reponse
	echo

	if [ $reponse = y -o $reponse = o -o $reponse = yes -o $reponse = oui ]
	then
		pid=$(command ps auxww | command grep -v grep | command grep --color=never $1 | awk '{print $2}')

		echo "kill $=pid"
		echo

		kill $=pid
	else
		return 0
	fi

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

	#echo -n $BLEU
	#dirs -v
	#echo -n $NEUTRE

	#print -l $PWD >>! $DIRSTACKFILE.ajout

	print -l $PWD ${(u)dirstack} >! $DIRSTACKFILE
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

typeset -ga peexec_functions

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
