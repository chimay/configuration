" vim: set filetype=vim :

" {{{ Réglages de base

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "personnel"

" }}}

" {{{ Couleurs intéressantes

" #5B3C11  5B3C11 606060  872E30 5B3C11  872E30  5B3C11 5B3C11  5B3C11 5B3C11  872E30
" #5B3C11  5B3C11 5B3C11  5B3C11 404040  404040  5B3C11 88421D  872E30 606060  872E30
" #872E30  872E30 872E30  872E30 845A3B  5B3C11  5B3C11 5B3C11  5B3C11 872E30  606060
" #5B3C11  5B3C11 434343  872E30 872E30  5B3C11  5B3C11 5B3C11  5B3C11 5B3C11  120507
" #120507

" }}}

" {{{ Mode gui

" {{{ Générique

hi Normal			guifg=#5B3C11		guibg=black			gui=NONE
hi Visual			guifg=black			guibg=#5B3C11		gui=NONE

hi Comment			guifg=#754321		guibg=black			gui=italic
hi Delimiter		guifg=#5B3C11		guibg=black			gui=NONE
hi Constant     	guifg=#872E30		guibg=NONE			gui=NONE
hi Number			guifg=#5B3C11		guibg=NONE			gui=NONE
hi Title			guifg=#872E30		guibg=NONE			gui=NONE

hi Conceal			guifg=#5B3C11		guibg=black			gui=NONE

hi LineNr			guifg=#5B3C11		guibg=NONE			gui=NONE

hi Identifier		guifg=brown			guibg=black			gui=NONE
hi Macro			guifg=#5B3C11		guibg=black			gui=NONE
hi PreProc 			guifg=#5B3C11		guibg=black			gui=NONE

" }}}

" {{{ More prompt

hi MoreMsg			guifg=#872E30		guibg=black			gui=NONE
hi Question			guifg=#872E30		guibg=black			gui=NONE

" }}}

" {{{ Erreurs

hi Error 			guifg=darkred		guibg=black			gui=undercurl
hi ErrorMsg			guifg=darkred		guibg=black			gui=undercurl

" }}}

" {{{ Curseur

" hi Cursor			guifg=#5B3C11		guibg=NONE		gui=NONE
" hi TermCursor		guifg=#5B3C11		guibg=NONE		gui=NONE
" hi TermCursorNC		guifg=#5B3C11		guibg=NONE		gui=NONE
" hi iCursor			guifg=#5B3C11		guibg=NONE		gui=NONE
" hi vCursor			guifg=#5B3C11		guibg=#4E1609	gui=NONE
" 
" hi CursorLineNr		guifg=#5B3C11		guibg=NONE			gui=NONE
" hi CursorLine		guifg=NONE			guibg=#120507		gui=NONE
" hi CursorColumn		guifg=NONE			guibg=#120507		gui=NONE

" }}}

" {{{ Onglets

hi TabLineSel		guifg=NONE		guibg=NONE			gui=NONE
hi TabLine			guifg=NONE		guibg=#151515		gui=NONE
hi TabLineFill		guifg=NONE		guibg=#151515		gui=NONE

" }}}

" {{{ Barre de statut

" Pris en charge par vim-airline

" hi StatusLine		guifg=NONE		guibg=NONE			gui=bold,reverse
" hi StatusLineNC	guifg=NONE		guibg=NONE			gui=bold,reverse

" }}}

" {{{ Menu de complétion en mode insertion

hi Pmenu			guifg=#88421D		guibg=#070707		gui=NONE
hi PmenuSbar		guifg=#88421D		guibg=#070707		gui=NONE
hi PmenuSel			guifg=black			guibg=#5B3C11		gui=bold
hi PmenuThumb		guifg=#88421D		guibg=#122312		gui=NONE

" }}}

" {{{ Menu de complétion de la ligne de commande

hi WildMenu		guifg=brown			guibg=#070707		gui=NONE

" }}}

" {{{ Pliage

hi Folded			guifg=#5B3C11		guibg=black			gui=NONE
hi FoldColumn		guifg=#5B3C11		guibg=black			gui=NONE
"hi Folded			guifg=black			guibg=#5B3C11		gui=italic
"hi FoldColumn		guifg=black			guibg=#5B3C11		gui=NONE

" }}}

" {{{ Recherche

hi Search			guifg=black			guibg=#5B3C11	gui=underline

" }}}

" {{{ Correspondances de paires (), [], ...

hi MatchParen		guifg=darkred		guibg=black			gui=NONE

" }}}

" {{{ Caractères spéciaux & invisibles

highlight SpecialKey	guifg=#751212

"highlight NonText		guifg=#230707
highlight NonText		guifg=#751212

" }}}

" {{{ Différences

" hi DiffAdd			guifg=#1B4F08		guibg=NONE			gui=NONE
" hi DiffDelete		guifg=#872E30		guibg=NONE			gui=NONE

hi DiffAdd			guifg=darkgreen		guibg=NONE			gui=NONE
hi DiffDelete		guifg=darkred		guibg=NONE			gui=NONE

hi DiffChange		guifg=brown			guibg=NONE			gui=NONE
hi DiffText			guifg=#872E30		guibg=NONE			gui=NONE

" }}}

" {{{ Signes

highlight SignColumn	guifg=#5B3C11		guibg=black			gui=NONE

" }}}

" {{{ Plugins

" {{{ Bufferline

hi Bufferline_Inactive	ctermfg=NONE			ctermbg=NONE	cterm=NONE
hi Bufferline_Active	ctermfg=NONE			ctermbg=NONE	cterm=reverse

" }}}

" {{{ CtrlP

hi CtrlPMatch		guifg=brown			guibg=black			gui=NONE
hi CtrlPPrtCursor	guifg=brown			guibg=black			gui=NONE

" }}}

" {{{ CtrlSpace

hi	CtrlSpaceSearch		guifg=#5B3C11	guibg=black		gui=NONE
hi	CtrlSpaceStatus		guifg=#5B3C11	guibg=black		gui=NONE
hi	CtrlSpaceSelected	guifg=black		guibg=#5B3C11	gui=bold

hi	link CtrlSpaceNormal	Normal
hi	link CtrlSpaceFound		Visual

"hi	link CtrlSpaceSelected	Visual
"hi	link CtrlSpaceStatus	StatusLine

" }}}

" {{{ Exchange

hi ExchangeRegion	guifg=brown			guibg=black			gui=NONE

" }}}

" {{{ Showtrailingwhitespace

hi ShowTrailingWhitespace guifg=NONE guibg=NONE gui=underline

" }}}

" {{{ Sneak

hi SneakPluginTarget	guifg=#872E30		guibg=NONE		gui=underline
hi SneakPluginScope		guifg=black			guibg=#872E30	gui=underline

hi SneakStreakTarget	guifg=#872E30		guibg=NONE		gui=underline
hi SneakStreakMask		guifg=NONE			guibg=NONE		gui=underline

" }}}

" {{{ Table mode

hi Table			guifg=#5B3C11	guibg=NONE		gui=NONE
hi TableSeparator	guifg=#5B3C11	guibg=NONE		gui=NONE

" }}}

" {{{ Utl

hi UtlUrl		guifg=NONE			guibg=NONE		gui=underline

" }}}

" }}}

" }}}

" {{{ Mode console

" {{{ Générique

hi Normal			ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi Comment			ctermfg=DarkGrey	ctermbg=NONE		cterm=NONE
hi Constant     	ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi Delimiter		ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi Number			ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi Conceal			ctermfg=NONE		ctermbg=black		cterm=NONE

hi LineNr			ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi CursorLineNr		ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi CursorLine		ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi CursorColumn		ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi Macro			ctermfg=NONE		ctermbg=NONE		cterm=NONE

" }}}

" {{{ More prompt

hi MoreMsg			ctermfg=brown		ctermbg=black			cterm=NONE
hi Question			ctermfg=brown		ctermbg=black			cterm=NONE

" }}}

" {{{ Erreurs

hi Error 			ctermfg=darkred		ctermbg=NONE		cterm=underline
hi ErrorMsg			ctermfg=darkred		ctermbg=NONE		cterm=underline

" }}}

" {{{ Curseur

hi Cursor			ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi TermCursor		ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi TermCursorNC		ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi iCursor			ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi vCursor			ctermfg=NONE		ctermbg=NONE		cterm=NONE

hi CursorLineNr		ctermfg=NONE			ctermbg=NONE		cterm=NONE
hi CursorLine		ctermfg=NONE			ctermbg=NONE		cterm=NONE
hi CursorColumn		ctermfg=NONE			ctermbg=NONE		cterm=NONE

" }}}

" {{{ Onglets

hi TabLine			ctermfg=NONE		ctermbg=NONE		cterm=NONE
hi TabLineSel		ctermfg=0			ctermbg=3			cterm=NONE
hi TabLineFill		ctermfg=NONE		ctermbg=NONE		cterm=NONE

" }}}

" {{{ Barre de statut

hi StatusLine		ctermfg=0			ctermbg=3			cterm=NONE
hi StatusLineNC		ctermfg=0			ctermbg=3			cterm=NONE

" }}}

" {{{ Menu de complétion en mode insertion

hi Pmenu			ctermfg=NONE	ctermbg=232		cterm=NONE
hi PmenuSbar		ctermfg=NONE	ctermbg=232		cterm=NONE
hi PmenuSel			ctermfg=black 	ctermbg=3		cterm=NONE
hi PmenuThumb		ctermfg=NONE	ctermbg=237		cterm=NONE

" }}}

" {{{ Menu de complétion de la ligne de commande

hi WildMenu		ctermfg=NONE			ctermbg=NONE		cterm=NONE

" }}}

" {{{ Pliage

hi Folded			ctermfg=NONE		ctermbg=black			cterm=italic
hi FoldColumn		ctermfg=NONE		ctermbg=black			cterm=NONE
"hi Folded			ctermfg=black			ctermbg=NONE		cterm=italic
"hi FoldColumn		ctermfg=black			ctermbg=NONE		cterm=NONE

" }}}

" {{{ Recherche

hi Search			ctermfg=NONE			ctermbg=NONE	cterm=reverse

" }}}

" {{{ Correspondances de paires (), [], ...

hi MatchParen		ctermfg=NONE			ctermbg=NONE	cterm=underline

" }}}

" {{{ Caractères spéciaux & invisibles

highlight NonText		ctermfg=darkred
highlight SpecialKey	ctermfg=darkred

" }}}

" {{{ Différences

hi DiffAdd			ctermfg=green			ctermbg=NONE	cterm=NONE
hi DiffDelete		ctermfg=red				ctermbg=NONE	cterm=NONE

hi DiffChange		ctermfg=NONE			ctermbg=NONE	cterm=underline
hi DiffText			ctermfg=NONE			ctermbg=NONE	cterm=underline

" }}}

" {{{ Signes

highlight SignColumn	ctermfg=NONE		ctermbg=NONE		cterm=NONE

" }}}

" {{{ Plugins

" {{{ Bufferline

hi Bufferline_Active			guifg=#872E30		guibg=NONE			gui=NONE
hi Bufferline_Inactive			guifg=NONE			guibg=NONE			gui=NONE

" }}}

" {{{ CtrlP

hi CtrlPMatch		ctermfg=NONE			ctermbg=NONE	cterm=NONE
hi CtrlPPrtCursor	ctermfg=NONE			ctermbg=NONE	cterm=NONE

" }}}

" {{{ CtrlSpace

hi	CtrlSpaceSelected	ctermfg=NONE	ctermbg=NONE	cterm=reverse
hi	CtrlSpaceNormal		ctermfg=NONE	ctermbg=0	cterm=NONE
hi	CtrlSpaceFound		ctermfg=NONE	ctermbg=0	cterm=NONE

" }}}

" {{{ Exchange

hi ExchangeRegion	ctermfg=NONE	ctermbg=NONE	cterm=reverse

" }}}

" {{{ Table mode

hi Table			ctermfg=NONE	ctermbg=NONE	cterm=NONE
hi TableSeparator	ctermfg=NONE	ctermbg=NONE	cterm=NONE

" }}}

" {{{ Utl

hi UtlUrl 		ctermfg=NONE		ctermbg=NONE	cterm=underline

" }}}

" }}}

" }}}
