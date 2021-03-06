# ornuit theme

evaluate-commands %sh{
    # first we define the lucius colors as named colors
    ornuit_brun="rgb:5b3c11"
    ornuit_pale="rgb:754321"
    ornuit_gris="rgb:120507"
    ornuit_gris_fonce="rgb:070707"
    ornuit_rouge="rgb:872e30"
    ornuit_rouge_intense="rgb:88421d"
    ornuit_rouge_pale="rgb:845a3b"
    ornuit_fond="rgb:000000"

    echo "
        # then we map them to code
        face global value ${ornuit_brun}
        face global type ${ornuit_rouge}
        face global variable ${ornuit_rouge}
        face global module ${ornuit_rouge}
        face global function ${ornuit_rouge}
        face global string ${ornuit_rouge}
        face global keyword ${ornuit_rouge}
        face global operator ${ornuit_rouge}
        face global attribute ${ornuit_rouge}
        face global comment ${ornuit_rouge}
        face global meta ${ornuit_rouge}
        face global builtin default+b

        # and markup
        face global title ${ornuit_rouge}
        face global header ${ornuit_rouge}
        face global bold ${ornuit_rouge}
        face global italic ${ornuit_pale}
        face global mono ${ornuit_brun}
        face global block ${ornuit_brun}
        face global link ${ornuit_brun}
        face global bullet ${ornuit_brun}
        face global list ${ornuit_brun}

        # and built in faces
        face global Default ${ornuit_brun},${ornuit_fond}
        face global PrimarySelection ${ornuit_fond},${ornuit_brun}+fg
        face global SecondarySelection  ${ornuit_fond},${ornuit_pale}+fg
        face global PrimaryCursor ${ornuit_fond},${ornuit_pale}+fg
        face global SecondaryCursor ${ornuit_fond},${ornuit_brun}+fg
        face global PrimaryCursorEol ${ornuit_fond},${ornuit_rouge_intense}+fg
        face global SecondaryCursorEol ${ornuit_fond},${ornuit_brun}+fg
        face global LineNumbers ${ornuit_brun},${ornuit_fond}
        face global LineNumberCursor ${ornuit_fond},${ornuit_brun}+b
        face global MenuForeground ${ornuit_rouge},${ornuit_gris}
        face global MenuBackground ${ornuit_pale},${ornuit_gris_fonce}
        face global MenuInfo ${ornuit_brun}
        face global Information ${lucius_lighter_grey},${lucius_dark_green}
        face global Error ${ornuit_rouge},${ornuit_fond}
        face global StatusLine ${ornuit_fond},${ornuit_brun}
        face global StatusLineMode ${ornuit_fond},${ornuit_brun}+b
        face global StatusLineInfo ${ornuit_fond},${ornuit_brun}
        face global StatusLineValue ${ornuit_brun}
        face global StatusCursor default,${ornuit_fond}
        face global Prompt ${ornuit_brun}
        face global MatchingChar ${ornuit_brun},${ornuit_fond}
        face global BufferPadding ${ornuit_brun},${ornuit_fond}
        face global Whitespace ${ornuit_fond}+f
    "
}
