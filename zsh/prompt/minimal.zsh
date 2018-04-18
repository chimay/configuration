# vim: set ft=zsh :

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
# %F{red} début couleur rouge du texte
# %f fin couleur du texte
#
# %K{red} début couleur rouge du fond
# %k fin couleur du fond

# }}}

autoload -U colors

autoload -U zsh/terminfo

# Fonction
# ------------------------------------------------------------

function precmd_prompt_minimal {

emulate -R zsh

setopt local_options

setopt warn_create_global

PROMPT="
 %! ! %D{%H:%M} %(1j:bg %j & :)%f%(0?::code %? ? )%f%(!:#:$) "

RPROMPT="%(!:%F{1}%UROOT%u%f:%n) @ %M : %3~ "
}

typeset -ga precmd_functions

precmd_functions+=precmd_prompt_minimal
