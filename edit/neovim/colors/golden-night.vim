" vim: set filetype=vim :

" Réglages de base {{{1

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "golden-night"

" Couleurs intéressantes {{{1

" #5B3C11
" #341207

" #872E30
" #88421D
" #845A3B
" #AB1C11

" #754321
" #434343
" #120507

" #947454

" Mode gui {{{1

" Générique {{{2

hi Normal			guifg=#5B3C11		guibg=black			gui=NONE
hi Visual			guifg=black			guibg=#5B3C11		gui=NONE

hi Italic			guifg=#5B3C11		guibg=black			gui=italic
hi Underlined		guifg=#5B3C11		guibg=black			gui=underline

hi Comment			guifg=#754321		guibg=black			gui=italic
hi Delimiter		guifg=#5B3C11		guibg=black			gui=NONE
hi Constant     	guifg=#872E30		guibg=NONE			gui=NONE
hi Number			guifg=#5B3C11		guibg=NONE			gui=NONE
hi Title			guifg=#872E30		guibg=NONE			gui=NONE

hi Conceal			guifg=#5B3C11		guibg=black			gui=NONE

hi LineNr			guifg=#5B3C11		guibg=NONE			gui=NONE
hi CursorLineNr		guifg=#7B3C11		guibg=NONE			gui=NONE

hi Identifier		guifg=brown			guibg=black			gui=NONE
hi Conditional		guifg=#872e30		guibg=black			gui=NONE
hi Macro			guifg=#5B3C11		guibg=black			gui=NONE
hi PreProc 			guifg=#5B3C11		guibg=black			gui=NONE

hi Statement		guifg=#5B3C11		guibg=black			gui=NONE

" More prompt {{{2

hi MoreMsg			guifg=#872E30		guibg=black			gui=NONE
hi Question			guifg=#872E30		guibg=black			gui=NONE

" Erreurs {{{2

" hi Error 			guifg=darkred		guibg=black			gui=undercurl
" hi ErrorMsg			guifg=darkred		guibg=black			gui=undercurl

hi Error 			guifg=darkred		guibg=black			gui=NONE
hi ErrorMsg			guifg=darkred		guibg=black			gui=NONE

" Curseur {{{2

hi Cursor			guifg=NONE			guibg=NONE			gui=reverse
hi Cursor2			guifg=NONE			guibg=NONE			gui=reverse

hi iCursor			guifg=#5b3c11		guibg=NONE	   		gui=reverse
hi lCursor			guifg=NONE			guibg=NONE	   		gui=reverse
hi vCursor			guifg=#5B3C11		guibg=#4E1609		gui=NONE

hi CursorLine		guifg=NONE			guibg=#170507		gui=bold

hi CursorColumn		guifg=NONE			guibg=#120507		gui=NONE

hi TermCursor		guifg=NONE			guibg=#5b3c11		gui=NONE
hi TermCursorNC		guifg=NONE			guibg=#B21818		gui=NONE

" Onglets {{{2

hi TabLineSel		guifg=NONE		guibg=NONE			gui=bold
hi TabLine			guifg=#000000	guibg=#503010		gui=bold
hi TabLineFill		guifg=NONE		guibg=#070707		gui=NONE

" Barre de statut {{{2

hi StatusLineNC		guifg=#5b3c11	guibg=#120705		gui=bold
hi StatusLine		guifg=NONE		guibg=NONE			gui=reverse,bold

"hi StatusLineNC	guifg=NONE		guibg=#050505		gui=NONE
"hi StatusLine		guifg=#7b3c11	guibg=#070707		gui=bold

hi WheelStatusLine		guifg=#5b3c11	guibg=NONE		gui=NONE

" Menu de complétion en mode insertion {{{2

hi Pmenu			guifg=#88421D		guibg=#070707		gui=NONE
hi PmenuSbar		guifg=#88421D		guibg=#070707		gui=NONE
"hi PmenuSel			guifg=black			guibg=#5B3C11		gui=bold
"hi PmenuSel			guifg=#ab1c11		guibg=#070707		gui=bold
hi PmenuSel			guifg=#88601d		guibg=#341207		gui=bold
hi PmenuThumb		guifg=#88421D		guibg=#122312		gui=NONE

" Menu de complétion de la ligne de commande {{{2

hi WildMenu		guifg=brown			guibg=#070707		gui=NONE

" Pliage {{{2

hi Folded			guifg=#5B3C11		guibg=black			gui=NONE
hi FoldColumn		guifg=#5B3C11		guibg=black			gui=NONE
"hi Folded			guifg=black			guibg=#5B3C11		gui=italic
"hi FoldColumn		guifg=black			guibg=#5B3C11		gui=NONE

" Recherche {{{2

hi Search		guifg=#721919		guibg=NONE		gui=italic
hi Search		guifg=#841919		guibg=NONE		gui=italic
"hi Search		guifg=#88421d		guibg=NONE		gui=italic

" Correspondances de paires (), [], ... {{{2

hi MatchParen		guifg=darkred		guibg=black			gui=NONE

" Caractères spéciaux & invisibles {{{2

highlight SpecialKey	guifg=#3b3c11
highlight NonText		guifg=#3b3c11

" Différences {{{2

" hi DiffAdd			guifg=#1B4F08		guibg=NONE			gui=NONE
" hi DiffDelete		guifg=#872E30		guibg=NONE			gui=NONE

hi DiffAdd			guifg=darkgreen		guibg=NONE			gui=NONE
hi DiffDelete		guifg=darkred		guibg=NONE			gui=NONE

hi DiffChange		guifg=brown			guibg=NONE			gui=NONE
hi DiffText			guifg=#872E30		guibg=NONE			gui=NONE

" Signes {{{2

highlight SignColumn	guifg=#5B3C11		guibg=black			gui=NONE

" Plugins {{{2

" Bufferline {{{3

hi Bufferline_Inactive	ctermfg=NONE			ctermbg=NONE	cterm=NONE
hi Bufferline_Active	ctermfg=NONE			ctermbg=NONE	cterm=reverse

" CtrlP {{{3

hi CtrlPMatch		guifg=brown			guibg=black			gui=NONE
hi CtrlPPrtCursor	guifg=brown			guibg=black			gui=NONE

" CtrlSpace {{{3

hi	CtrlSpaceSearch		guifg=#5B3C11	guibg=black		gui=NONE
hi	CtrlSpaceStatus		guifg=#5B3C11	guibg=black		gui=NONE
hi	CtrlSpaceSelected	guifg=black		guibg=#5B3C11	gui=bold

hi	link CtrlSpaceNormal	Normal
hi	link CtrlSpaceFound		Visual

"hi	link CtrlSpaceSelected	Visual
"hi	link CtrlSpaceStatus	StatusLine

" Exchange {{{3

hi ExchangeRegion	guifg=brown			guibg=black			gui=NONE

" Highlighted Yank {{{3

hi HighlightedyankRegion		guifg=#921717		guibg=black			gui=NONE

" Visual multi {{{3

hi VisualMultiMono			guifg=black			guibg=#4a1c07		gui=bold
hi VisualMultiExtend		guifg=darkgreen		guibg=#120705		gui=NONE
hi VisualMultiExtendCursors	guifg=darkgreen		guibg=#120705		gui=italic,underline
hi VisualMultiInsert		guifg=darkred		guibg=#120705		gui=italic,underline

" Showtrailingwhitespace {{{3

hi ShowTrailingWhitespace guifg=NONE guibg=NONE gui=underline

" Sneak {{{3

hi SneakPluginTarget	guifg=#872E30		guibg=NONE		gui=underline
hi SneakPluginScope		guifg=black			guibg=#872E30	gui=underline

hi SneakStreakTarget	guifg=#872E30		guibg=NONE		gui=underline
hi SneakStreakMask		guifg=NONE			guibg=NONE		gui=underline

" Table mode {{{3

hi Table			guifg=#5B3C11	guibg=NONE		gui=NONE
hi TableSeparator	guifg=#5B3C11	guibg=NONE		gui=NONE

" Utl {{{3

hi UtlUrl		guifg=NONE			guibg=NONE		gui=underline

" Mode console {{{1

" Générique {{{2

hi Normal			ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi Comment			ctermfg=DarkGrey	ctermbg=NONE		cterm=italic
hi Constant     	ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi Delimiter		ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi Number			ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi Conceal			ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi LineNr			ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi CursorLineNr		ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi CursorLine		ctermfg=NONE		ctermbg=NONE		cterm=reverse
hi CursorColumn		ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi Macro			ctermfg=NONE		ctermbg=NONE		cterm=NONE

" More prompt {{{2

hi MoreMsg			ctermfg=brown		ctermbg=NONE			cterm=NONE
hi Question			ctermfg=brown		ctermbg=NONE			cterm=NONE

" Erreurs {{{2

hi Error 			ctermfg=darkred		ctermbg=NONE		cterm=underline
hi ErrorMsg			ctermfg=darkred		ctermbg=NONE		cterm=underline

" Curseur {{{2

hi Cursor			ctermfg=NONE		ctermbg=NONE		cterm=reverse
hi iCursor			ctermfg=NONE		ctermbg=NONE		cterm=reverse
hi lCursor			ctermfg=NONE		ctermbg=NONE		cterm=reverse
hi vCursor			ctermfg=NONE		ctermbg=NONE		cterm=reverse

hi TermCursor		ctermfg=NONE		ctermbg=NONE		cterm=reverse
hi TermCursorNC		ctermfg=NONE		ctermbg=NONE		cterm=reverse

hi CursorLine		ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi CursorColumn		ctermfg=NONE		ctermbg=NONE		cterm=NONE

" Onglets {{{2

hi TabLine			ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi TabLineSel		ctermfg=0			ctermbg=3			cterm=NONE
hi TabLineFill		ctermfg=NONE		ctermbg=NONE		cterm=NONE

" Barre de statut {{{2

hi StatusLine		ctermfg=NONE		ctermbg=NONE		cterm=reverse
hi StatusLineNC		ctermfg=NONE		ctermbg=NONE		cterm=reverse

hi WheelStatusLine	ctermfg=NONE		ctermbg=NONE		cterm=NONE

" Menu de complétion en mode insertion {{{2

hi Pmenu			ctermfg=NONE	ctermbg=232		cterm=NONE
hi PmenuSbar		ctermfg=NONE	ctermbg=232		cterm=NONE
hi PmenuSel			ctermfg=black 	ctermbg=3		cterm=NONE
hi PmenuThumb		ctermfg=NONE	ctermbg=237		cterm=NONE

" Menu de complétion de la ligne de commande {{{2

hi WildMenu		ctermfg=NONE			ctermbg=NONE		cterm=NONE

" Pliage {{{2

hi Folded			ctermfg=NONE		ctermbg=NONE			cterm=italic
hi FoldColumn		ctermfg=NONE		ctermbg=NONE			cterm=NONE

"hi Folded			ctermfg=black			ctermbg=NONE		cterm=italic
"hi FoldColumn		ctermfg=black			ctermbg=NONE		cterm=NONE

" Recherche {{{2

hi Search			ctermfg=NONE			ctermbg=NONE	cterm=italic,underline

" Correspondances de paires (), [], ... {{{2

hi MatchParen		ctermfg=NONE			ctermbg=NONE	cterm=underline

" Caractères spéciaux & invisibles {{{2

highlight NonText		ctermfg=darkred
highlight SpecialKey	ctermfg=darkred

" Différences {{{2

hi DiffAdd			ctermfg=green			ctermbg=NONE	cterm=NONE
hi DiffDelete		ctermfg=red				ctermbg=NONE	cterm=NONE

hi DiffChange		ctermfg=NONE			ctermbg=NONE	cterm=underline
hi DiffText			ctermfg=NONE			ctermbg=NONE	cterm=underline

" Signes {{{2

highlight SignColumn	ctermfg=NONE		ctermbg=NONE		cterm=NONE

" Plugins {{{2

" Bufferline {{{3

hi Bufferline_Active			guifg=#872E30		guibg=NONE			gui=NONE
hi Bufferline_Inactive			guifg=NONE			guibg=NONE			gui=NONE

" CtrlP {{{3

hi CtrlPMatch		ctermfg=NONE			ctermbg=NONE	cterm=NONE
hi CtrlPPrtCursor	ctermfg=NONE			ctermbg=NONE	cterm=NONE

" CtrlSpace {{{3

hi	CtrlSpaceSelected	ctermfg=NONE	ctermbg=NONE	cterm=reverse
hi	CtrlSpaceNormal		ctermfg=NONE	ctermbg=0	cterm=NONE
hi	CtrlSpaceFound		ctermfg=NONE	ctermbg=0	cterm=NONE

" Exchange {{{3

hi ExchangeRegion	ctermfg=NONE	ctermbg=NONE	cterm=reverse

" Highlighted Yank {{{3

hi HighlightedyankRegion		ctermfg=darkred		ctermbg=NONE		cterm=NONE

" Visual multi {{{3

" Table mode {{{3

hi Table			ctermfg=NONE	ctermbg=NONE	cterm=NONE
hi TableSeparator	ctermfg=NONE	ctermbg=NONE	cterm=NONE

" Utl {{{3

hi UtlUrl 		ctermfg=NONE		ctermbg=NONE	cterm=underline
