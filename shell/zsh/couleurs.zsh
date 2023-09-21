#!/bin/zsh

# {{{ Documentation

# {{{ Escape/Control sequences

# CSI = Control Sequence Introducer
#
# CSI = ESC[ = \033[  ou  \0233

# }}}

# {{{ 8 couleurs de base

# {{{ Effets

# ESC[0;... : effet neutre
# ESC[1;... : effet gras (éclairci en pratique)
# ESC[4;... : effet souligné
# ESC[5;... : effet clignotant
# ESC[7;... : effet inversé
# ESC[8;... : effet masqué

# }}}

# {{{ Avant-plan

# ESC[0;30m : noir
# ESC[0;31m : rouge foncé
# ESC[0;32m : vert foncé
# ESC[0;33m : brun
# ESC[0;34m : bleu foncé
# ESC[0;35m : magenta foncé
# ESC[0;36m : cyan foncé
# ESC[0;37m : blanc foncé = gris clair

# ESC[1;30m : noir clair = gris foncé
# ESC[1;31m : rouge clair
# ESC[1;32m : vert clair
# ESC[1;33m : jaune
# ESC[1;34m : bleu clair
# ESC[1;35m : magenta clair
# ESC[1;36m : cyan clair
# ESC[1;37m : blanc

# }}}

# {{{ Arrière-plan

# ESC[0;40m : noir
# ESC[0;41m : rouge
# ESC[0;42m : vert
# ESC[0;43m : orange
# ESC[0;44m : bleu
# ESC[0;45m : magenta
# ESC[0;46m : cyan
# ESC[0;47m : blanc

# ESC[1;40m : noir avec texte mis en évidence
# ESC[1;41m : rouge  avec texte mis en évidence
# ESC[1;42m : vert  avec texte mis en évidence
# ESC[1;43m : orange avec texte mis en évidence
# ESC[1;44m : bleu  avec texte mis en évidence
# ESC[1;45m : magenta  avec texte mis en évidence
# ESC[1;46m : cyan  avec texte mis en évidence
# ESC[1;47m : blanc avec texte mis en évidence

# }}}

# }}}

# {{{ 256 couleurs

# Avant-plan

# ESC[ ... 38;5;<code> ... m

# Arrière-plan

# ESC[ ... 48;5;<code> ... m

# }}}

# {{{ Couleurs d’après codes RGB

# L’émulateur de terminal konsole le supporte

# Avant-plan

# ESC[ ... 38;2;<r>;<g>;<b> ... m

# Arrière-plan

# ESC[ ... 48;2;<r>;<g>;<b> ... m

# }}}

# {{{ Couleurs konsole de base, codes RGB

# Thème A-Brun

# {{{ Normal

# 	Défaut : 91,60,17
# 	Noir : 0,0,0
# 	Rouge : 178,24,24
# 	Vert : 24,178,24
# 	Brun : 178,104,24
# 	Bleu : 24,24,178
# 	Magenta : 178,24,178
# 	Cyan : 24,178,178
# 	Gris clair : 178,178,178

# }}}

# {{{ Clair (intense, gras)

# 	Défaut : 255,255,255
# 	Gris foncé : 104,104,104
# 	Rouge : 255,84,84
# 	Vert : 84,255,84
# 	Jaune : 255,255,84
# 	Bleu : 84,84,255
# 	Magenta : 255,84,255
# 	Cyan : 84,255,255
# 	Blanc : 255,255,255

# }}}

# }}}

# }}}

# {{{ Neutre

# export COULEUR_NEUTRE="\033[39m"
# export COULEUR_STYLE_NEUTRE="\033[0m"

# }}}

# {{{ Style

# export STYLE_GRAS="\033[1;39m"
# export STYLE_SOULIGNE="\033[4m"

# export STYLE_CLIGNOTANT="\033[5m"
# export STYLE_INVERSE="\033[7m"

# }}}

# {{{ 8 couleurs, avant-plan

# export COULEUR_NOIR="\033[0;30m"
# export COULEUR_BLANC="\033[01;37m"

# export COULEUR_JAUNE="\033[1;33m"
# export COULEUR_BRUN="\033[0;33m"

# export COULEUR_FONCE_GRIS="\033[1;30m"

# export COULEUR_FONCE_ROUGE="\033[0;31m"
# export COULEUR_FONCE_VERT="\033[0;32m"
# export COULEUR_FONCE_BLEU="\033[0;34m"
# export COULEUR_FONCE_MAGENTA="\033[0;35m"
# export COULEUR_FONCE_POURPRE="\033[0;35m"
# export COULEUR_FONCE_CYAN="\033[0;36m"

# export COULEUR_CLAIR_GRIS="\033[0;37m"

# export COULEUR_CLAIR_ROUGE="\033[1;31m"
# export COULEUR_CLAIR_VERT="\033[1;32m"
# export COULEUR_CLAIR_BLEU="\033[1;34m"
# export COULEUR_CLAIR_MAGENTA="\033[1;35m"
# export COULEUR_CLAIR_CYAN="\033[1;36m"
# export COULEUR_CLAIR_POURPRE="\033[1;35m"

# }}}

# {{{ 8 couleurs, arrière-plan

# export COULEUR_BG_NOIR="\033[0;40m"
# export COULEUR_BG_BLANC="\033[01;47m"

# export COULEUR_BG_JAUNE="\033[1;43m"
# export COULEUR_BG_BRUN="\033[0;43m"

# export COULEUR_BG_FONCE_GRIS="\033[1;40m"

# export COULEUR_BG_FONCE_ROUGE="\033[0;41m"
# export COULEUR_BG_FONCE_VERT="\033[0;42m"
# export COULEUR_BG_FONCE_BLEU="\033[0;44m"
# export COULEUR_BG_FONCE_MAGENTA="\033[0;45m"
# export COULEUR_BG_FONCE_POURPRE="\033[0;45m"
# export COULEUR_BG_FONCE_CYAN="\033[0;46m"

# export COULEUR_BG_CLAIR_GRIS="\033[0;47m"

# export COULEUR_BG_CLAIR_ROUGE="\033[1;41m"
# export COULEUR_BG_CLAIR_VERT="\033[1;42m"
# export COULEUR_BG_CLAIR_BLEU="\033[1;44m"
# export COULEUR_BG_CLAIR_MAGENTA="\033[1;45m"
# export COULEUR_BG_CLAIR_CYAN="\033[1;46m"
# export COULEUR_BG_CLAIR_POURPRE="\033[1;45m"

# }}}

# {{{ 256 couleurs, avant-plan

# export COULEUR_GRIS="\033[38;5;246m"

# export COULEUR_ORANGE_LEGER="\033[38;5;215m"
# export COULEUR_ROUGE_LEGER="\033[38;5;203m"

# export COULEUR_ROSE="\033[38;5;211m"
# export COULEUR_ROSE_CHAUD="\033[38;5;198m"
# export COULEUR_ORANGE="\033[38;5;203m"
# export COULEUR_BLEU_CIEL="\033[38;5;111m"
# export COULEUR_LAVANDE="\033[38;5;183m"
# export COULEUR_BRONZE="\033[38;5;179m"
# export COULEUR_FORET="\033[38;5;22m"
# export COULEUR_MARRON="\033[38;5;52m"
# export COULEUR_VERT_MENTHE="\033[38;5;121m"
# export COULEUR_JADE="\033[38;5;35m"
# export COULEUR_LIME="\033[38;5;154m"

# }}}

# {{{ 256 couleurs, arrière-plan

# export COULEUR_BG_ORANGE_LEGER="\033[48;5;215m"
# export COULEUR_BG_ROUGE_LEGER="\033[48;5;203m"

# export COULEUR_BG_ROSE="\033[48;5;211m"
# export COULEUR_BG_ROSE_CHAUD="\033[48;5;198m"
# export COULEUR_BG_ORANGE="\033[48;5;203m"
# export COULEUR_BG_BLEU_CIEL="\033[48;5;111m"
# export COULEUR_BG_GRIS="\033[48;5;246m"
# export COULEUR_BG_LAVANDE="\033[48;5;183m"
# export COULEUR_BG_BRONZE="\033[48;5;179m"
# export COULEUR_BG_FORET="\033[48;5;22m"
# export COULEUR_BG_MARRON="\033[48;5;52m"
# export COULEUR_BG_VERT_MENTHE="\033[48;5;121m"
# export COULEUR_BG_JADE="\033[48;5;35m"
# export COULEUR_BG_LIME="\033[48;5;154m"

# }}}
