# golden-night theme

evaluate-commands %sh{
    # first we define the colors
    golden_night_brun="rgb:5b3c11"
    golden_night_pale="rgb:754321"
    golden_night_gris="rgb:120507"
    golden_night_gris_fonce="rgb:070707"
    golden_night_rouge="rgb:872e30"
    golden_night_rouge_intense="rgb:88421d"
    golden_night_rouge_vif="rgb:ab1c11"
    golden_night_rouge_pale="rgb:845a3b"
    golden_night_fond="rgb:000000"

    echo "
        # then we map them to code
        face global value ${golden_night_brun}
        face global type ${golden_night_rouge}
        face global variable ${golden_night_rouge}
        face global module ${golden_night_rouge}
        face global function ${golden_night_rouge}
        face global string ${golden_night_rouge}
        face global keyword ${golden_night_rouge}
        face global operator ${golden_night_rouge}
        face global attribute ${golden_night_rouge}
        face global comment ${golden_night_pale}
        face global meta ${golden_night_rouge}
        face global builtin default+b

        # and markup
        face global title ${golden_night_rouge}
        face global header ${golden_night_rouge}
        face global bold ${golden_night_rouge}
        face global italic ${golden_night_pale}
        face global mono ${golden_night_brun}
        face global block ${golden_night_brun}
        face global link ${golden_night_brun}
        face global bullet ${golden_night_brun}
        face global list ${golden_night_brun}

        # and built in faces
        face global Default ${golden_night_brun},${golden_night_fond}
        face global PrimarySelection ${golden_night_fond},${golden_night_rouge_intense}+fg
        face global SecondarySelection ${golden_night_fond},${golden_night_brun}+fg
        face global PrimaryCursor ${golden_night_fond},${golden_night_rouge}+fg
        face global SecondaryCursor ${golden_night_fond},${golden_night_brun}+fg
        face global PrimaryCursorEol ${golden_night_fond},${golden_night_rouge_intense}+fg
        face global SecondaryCursorEol ${golden_night_fond},${golden_night_brun}+fg
        face global LineNumbers ${golden_night_brun},${golden_night_fond}
        face global LineNumberCursor ${golden_night_fond},${golden_night_brun}+b
        face global MenuForeground ${golden_night_rouge_vif},${golden_night_gris}
        face global MenuBackground ${golden_night_pale},${golden_night_gris_fonce}
        face global MenuInfo ${golden_night_brun}
        face global Information ${golden_night_brun},${golden_night_fond}
        face global Error ${golden_night_rouge},${golden_night_fond}
        face global StatusLine ${golden_night_rouge},${golden_night_fond}
        face global StatusLineMode ${golden_night_rouge},${golden_night_fond}+b
        face global StatusLineInfo ${golden_night_rouge},${golden_night_fond}
        face global StatusLineValue ${golden_night_brun}
        face global StatusCursor ${golden_night_fond},${golden_night_brun}
        face global Prompt ${golden_night_brun}
        face global MatchingChar ${golden_night_brun},${golden_night_fond}
        face global BufferPadding ${golden_night_brun},${golden_night_fond}
        face global Whitespace ${golden_night_fond}+f
    "
}
