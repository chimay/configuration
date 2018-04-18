# vim: set ft=zsh :

# Remarque : il ne semble pas nécessaire d’exporter les variables de PROMPT

# {{{ Options

setopt prompt_percent
setopt prompt_subst

unsetopt prompt_bang

setopt prompt_cr
setopt prompt_sp

# }}}

# {{{ Initialisation

autoload -U promptinit
promptinit

# }}}

# {{{ Signe de fin de fichier sans passage à la ligne

PROMPT_EOL_MARK='%F{red}<EOF>%f'

# }}}

# {{{ Répétition du texte de remplissage

function repete_texte {

	emulate -R zsh

	setopt local_options

	setopt warn_create_global

	local multiple texte resultat compteur

	multiple=$1
	texte=$2

	resultat=''

	for (( compteur = 0 ; compteur < multiple ; compteur++ ))
	do
		resultat="${resultat}${texte}"
	done

	echo -n $resultat
}

# }}}

#  {{{ Choix
# ------------------------------------------------------------------------

# Simple prompt "%"

#prompt off

# Autres prompts

#prompt pws
#prompt redhat

# Personnel

case $TERM in
	tmux-256color)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	tmux)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	screen-256color)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	screen)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	xterm-256color)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	xterm)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	vim)
		prompt off
		;;
	neovim)
		prompt off
		;;
	?*)
		source $RACINE_ZSH/prompt/zero.zsh
		;;
esac

# }}}
