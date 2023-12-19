#!/bin/zsh

# {{{ Documentation

# %/ : chemin complet
# %~ : chemin en tenant compte de ~ et des ~NOMS
#
# %B début gras
# %b fin gras
# %U début souligné
# %u fin souligné
# %S début illuminé
# %s fin illuminé
#
# %F{nom couleur} ou %F{no couleur (0-255)} début couleur du texte
# %f fin couleur du texte
#
# %K{red} début couleur rouge du fond
# %k fin couleur du fond

# }}}

autoload -U colors

autoload -U zsh/terminfo

typeset -g PROMPT
typeset -g RPROMPT

# Fonction
# ------------------------------------------------------------

function precmd_prompt_default {

emulate -R zsh

setopt local_options

setopt warn_create_global

local gaucheUn droiteUn
local gaucheDeux droiteDeux
local gaucheTrois droiteTrois
local mouleGaucheUn mouleDroiteUn
local mouleGaucheDeux mouleDroiteDeux
local mouleGaucheTrois mouleDroiteTrois
local tailleGaucheUn tailleDroiteUn
local tailleGaucheDeux tailleDroiteDeux
local tailleGaucheTrois tailleDroiteTrois
local remplissageUn remplissageDeux
local margeUn margeDeux

# {{{ Première ligne

gaucheUn=" +- %(!:%F{1}%UROOT%u%f:%n) @ %M : %2~ = %/"

mouleGaucheUn=" +- %(!:%UROOT%u:%n) @ %M : %2~ = %/"

droiteUn="%D{%a %d %b %Y} %l -+"

mouleDroiteUn="%D{%a %d %b %Y} %l -+ "

# }}}

# {{{ Deuxième ligne

gaucheDeux=" |"

mouleGaucheDeux=" |"

droiteDeux="|"

mouleDroiteDeux="| "

# }}}

# {{{ Troisième ligne

gaucheTrois=" +- %! ! %D{%H:%M} \
%(1j:bg %j & :)%f%(0?::code %? ? )%f\
%(!:#:$) "

#mouleGaucheTrois=""

droiteTrois="%D{%a %d %b %Y} -+"

#mouleDroiteTrois=""

# }}}

# {{{ Tailles

tailleGaucheUn=${#${(%)mouleGaucheUn}}
tailleDroiteUn=${#${(%)mouleDroiteUn}}

tailleGaucheDeux=${#${(%)mouleGaucheDeux}}
tailleDroiteDeux=${#${(%)mouleDroiteDeux}}

#tailleGaucheTrois=${#${(%)mouleGaucheTrois}}
#tailleDroiteTrois=${#${(%)mouleDroiteTrois}}

# }}}

# {{{ Marges

(( margeUn = COLUMNS - tailleGaucheUn - tailleDroiteUn ))

# {{{ Marge trop faible ==> on simplifie la première ligne, coté gauche

(( margeUn <= 20 )) && {

	gaucheUn=" +- %n @ %M : %~"

	mouleGaucheUn=" +- %n @ %M : %~"

	tailleGaucheUn=${#${(%)mouleGaucheUn}}

	(( margeUn = COLUMNS - tailleGaucheUn - tailleDroiteUn ))

}

# }}}

# {{{ Marge négative ==> on simplifie la première ligne, coté droit

(( margeUn <= 0 )) && {

	droiteUn="-+ "

	mouleDroiteUn="-+ "

	tailleDroiteUn=${#${(%)mouleDroiteUn}}

	(( margeUn = COLUMNS - tailleGaucheUn - tailleDroiteUn ))
}

# }}}

# {{{ Marge négative ==> on resimplifie la première ligne, coté gauche

(( margeUn <= 0 )) && {

	gaucheUn=" +- %n @ %M"

	mouleGaucheUn=" +- %n @ %M"

	tailleGaucheUn=${#${(%)mouleGaucheUn}}

	(( margeUn = COLUMNS - tailleGaucheUn - tailleDroiteUn ))

}

# }}}

(( margeDeux = COLUMNS - tailleGaucheDeux - tailleDroiteDeux ))

# }}}

# {{{ Remplissages

if (( margeUn >= 2 ))
then
	remplissageUn=" `repete_texte $(( margeUn - 2 )) '_'` "
else
	remplissageUn="`repete_texte $(( margeUn )) ' '`"
fi

remplissageDeux="`repete_texte $margeDeux ' '`"

# }}}

# {{{ Variables

PROMPT="
${gaucheUn}${remplissageUn}${droiteUn}
${gaucheDeux}${remplissageDeux}${droiteDeux}
${gaucheTrois}"

# Pris en charge par les special widgets
# Voir <url:~/racine/config/cmdline/zsh/fonction.zsh#tn=Special Widgets>
#RPROMPT="$droiteTrois"

RPROMPT=

PS2="_ %_ _ > "

# }}}
}

typeset -ga precmd_functions

precmd_functions+=precmd_prompt_default
