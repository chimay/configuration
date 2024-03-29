#!/bin/zsh

# Remarque : il ne semble pas nécessaire d’exporter les variables de PROMPT

# options {{{1

setopt prompt_percent
setopt prompt_subst

unsetopt prompt_bang

setopt prompt_cr
setopt prompt_sp


# initialization {{{1

autoload -U promptinit
promptinit


# end of file sign, without newline char {{{1

PROMPT_EOL_MARK='%F{red}<EOF>%f'


# functions {{{1

# Répétition du texte de remplissage {{{2

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



# choice {{{1

# Simple prompt "%"

#prompt off

# Autres prompts

#prompt pws
#prompt redhat

# Personnel

case $TERM in
	xterm)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	xterm-256color)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	rxvt-unicode)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	rxvt-unicode-256color)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	alacritty)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	tmux)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	tmux-256color)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	screen)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	screen-256color)
		source $RACINE_ZSH/prompt/default.zsh
		;;
	?*)
		source $RACINE_ZSH/prompt/zero.zsh
		;;
esac

