" vim: set filetype=vim :

" Titre {{{1

" ab = abbreviation
" au = autocmd

" norm = normal
" exe = execute

" fu = function

" setf = setfiletype

" sy = syntax
" hi = highlight

" Changements dans Neovim par rapport à Vim :

" - 'autoindent' is set by default
" - 'autoread' is set by default
" - 'backspace' defaults to "indent,eol,start"
" - 'complete' doesn't include "i"
" - 'display' defaults to "lastline"
" - 'encoding' defaults to "utf-8"
" - 'formatoptions' defaults to "tcqj"
" - 'history' defaults to 10000 (the maximum)
" - 'hlsearch' is set by default
" - 'incsearch' is set by default
" - 'langnoremap' is set by default
" - 'laststatus' defaults to 2 (statusline is always shown)
" - 'listchars' defaults to "tab:> ,trail:-,nbsp:+"
" - 'mouse' defaults to "a"
" - 'nocompatible' is always set
" - 'nrformats' defaults to "hex"
" - 'sessionoptions' doesn't include "options"
" - 'smarttab' is set by default
" - 'tabpagemax' defaults to 50
" - 'tags' defaults to "./tags;,tags"
" - 'ttyfast' is always set
" - 'viminfo' includes "!"
" - 'wildmenu' is set by default

" }}}1

"  Compatibilité {{{1

"set cpoptions-=C

" }}}1

" Chemins de chargement {{{1

" Pas nécessaire : ~/.config/nvim -> ~config/edit/neovim
" Provoque des doublons avec ultisnips

"set runtimepath+=~/racine/config/edit/neovim

" }}}1

" Debug {{{1

" 	>= 1	When the shada file is read or written.
" 	>= 2	When a file is ":source"'ed.
" 	>= 5	Every searched tags file and include file.
" 	>= 8	Files for which a group of autocommands is executed.
" 	>= 9	Every executed autocommand.
" 	>= 12	Every executed function.
" 	>= 13	When an exception is thrown, caught, finished, or discarded.
" 	>= 14	Anything pending in a ":finally" clause.
" 	>= 15	Every executed Ex command (truncated at 200 characters).

"set verbose=9

"set verbosefile=~/Documents/neovim.log

" }}}1

" ------------------------------------

"  Caractères utilisés dans les mots {{{1

"set iskeyword=48-57, ,192-255,@,:,/,-,_

" }}}1

" Pageur interne {{{1

set more

" }}}1

" Couper, copier, coller {{{1

set clipboard=

" }}}1

"  Environnement {{{1

"  Chemins de recherche des fichiers {{{2

" Permet une recherche récursive avec :find

set path=**

" }}}2

"  Chemins de recherche des répertoires {{{2

set cdpath=,

set cdpath+=~/racine
set cdpath+=~

" }}}2

" }}}1

"  Shell {{{1

let g:terminal_scrollback_buffer_size = 50000

" }}}1

"  Système de fichier {{{1

"  Répertoire du fichier courant {{{2

" Se place dans le répertoire du fichier courant

" Voir aussi autocommandes

"set autochdir

" }}}2

"  Explorateur de fichier {{{2

" Répertoire de départ

set browsedir=current
"set browsedir=buffer
"set browsedir=last

" }}}2

"  Lecture / Écriture {{{2

"set autowrite				" Sauvegarde automatique des fichiers lors de navigation
							" dans les arguments, :stop, :suspend, :tag, :!, :make, ^],
							" ou quand un :buffer, ctrl-^, ^O, ^I ou une marque dirige vers un autre fichier

"set autowriteall			" Sauvegarde automatique des fichiers aussi pour :e, :enew, :q, :qall, :x, :recover

" }}}2

"  Sauvegardes {{{2

set backup

set backupdir=~/racine/varia/backup/neovim,.

set backupext=~

set writebackup

set backupskip=/tmp/*,/etc/*,mutt-*-*-*-*

" }}}2

" Patchmode {{{2

"set patchmode=.original

" }}}2

"  Fichier de récupération en cas de crash {{{2

set swapfile
set directory=~/racine/varia/autosave/neovim

"set noswapfile

" Fréquence de sauvegarde

set updatecount=100			" Nombre de caractères
set updatetime=1000			" Millisecondes

" }}}2

" }}}1

"  Annulation {{{1

set undolevels=1234

if exists("&undofile")
	set undofile
	set undoreload=12743
	set undodir=~/racine/varia/undo/neovim,.
endif

" }}}1

"  Session {{{1

set sessionoptions=

set sessionoptions+=blank
set sessionoptions+=buffers
set sessionoptions+=curdir
set sessionoptions+=folds
set sessionoptions+=globals
set sessionoptions+=help
set sessionoptions+=localoptions
set sessionoptions+=options
set sessionoptions+=resize
set sessionoptions+=slash
set sessionoptions+=tabpages
set sessionoptions+=unix
set sessionoptions+=winpos
set sessionoptions+=winsize

" }}}1

"  Encodage {{{1

setglobal fileencoding=utf-8
setglobal fileencodings=utf-8

" Digraph {{{2

" Disponible avec <C-K> char1 char2

" Cette option active l’accès au digraph par char1 <BS> char2

"set digraph

" Convertir les codes hexadécimaux de wikipédia en codes décimaux via
" par exemple : python -c "print 0x<code>"

" Alphabet phonétique {{{3

"dig ia 0592			" ɐ
"dig oo 0596			" ɔ
"dig ee 0601			" ə
"dig ep 0603			" ɛ
"dig in 0643			" ʃ
"dig zd 0658			" ʒ
"dig ER 0640			" ʀ
"dig Gn 0626			" ɲ
"dig Ng 0627			" ɳ
"dig uu 0613			" ɥ
"dig ?? 0660			" ʔ

" }}}3

" Divers {{{3

" dig -n 8208				" ‐
" dig -m 8211				" –

"dig ~~ 0771			" tilde supérieur

" }}}3

" }}}2

" }}}1

"  Orthographe {{{1

set spelllang=fr,en

set spellsuggest=best

" }}}1

"  Dictionnaire {{{1

" Complétion par dictionnaire et synonymes

" Dictionnaires {{{2

set dictionary+=~/racine/index/spell/dictionnaire.txt
set dictionary+=~/racine/index/spell/fr-classique+reforme1990.dic
set dictionary+=~/racine/index/spell/en_GB.dic

" }}}2

" Thesaurus (dictionnaires de synonymes) {{{2

" Personnel
set thesaurus+=~/racine/index/spell/synonymes.txt

" Officiel
set thesaurus+=~/racine/index/spell/thes_fr.dat

" }}}2

" }}}1

"  Modes {{{1

set virtualedit=block,onemore
"set virtualedit=block,insert,onemore
"set virtualedit=all

set selection=inclusive

" Lignes d'instruction neovim dans les fichiers édités

set modeline
set modelines=7

" }}}1

"  Périphériques {{{1

"  Clavier {{{2

" Autorise le passage d'une ligne à l'autre avec les flèches

set whichwrap=<,>,[,],~,b,s,h,l

" }}}2

"  Son {{{2

set visualbell
set noerrorbells

" }}}2

"  Souris {{{2

set mouse=a

set mousefocus

set mousehide					" Cache le pointeur de souris lorsque l'on tape

set mousemodel=extend				" Clic droit modifie sélection
"set mousemodel=popup_setpos		" Clic droit menu

set mouseshape=i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow

" }}}2

" Sélection {{{2

"set selectmode+=key
"set selectmode+=mouse

"set keymodel+=startsel
"set keymodel+=stopsel

" }}}2

" }}}1

"  Recherche {{{1

" Casse {{{2

" Ignore la casse

set ignorecase

" Recherche intelligente : ignore la casse sauf si
" des majuscules sont présentes dans le motif

set smartcase

" }}}2

" Grep {{{2

if executable('rg')
	set grepprg=rg\ --vimgrep\ --smart-case\ $*
	set grepformat=%f:%l:%c:%m
elseif executable('ag')
	set grepprg=ag\ --nocolor\ --vimgrep\ --smart-case\ $*
	set grepformat=%f:%l:%c:%m
elseif executable('ack')
	set grepprg=ack\ --nocolor\ --nogroup\ --column\ --smart-case\ $*
	set grepformat=%f:%l:%c:%m
elseif executable('grep')
	set grepprg=grep\ --line-number\ --ignore-case\ --no-messages\ $*\ /dev/null
	set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
else
	set grepprg=internal
endif

" }}}2

" }}}1

"  Complétion {{{1

" Fichiers à ignorer {{{2

set wildignore=

set wildignore+=*/.git/*,*/.hg/*,*/.bzr/*,*/_darcs/*,*/.svn/*

set wildignore+=*.pyc,*.elc,*.zwc
set wildignore+=*.aux,*.maf,*.toc,*.ptc*,*.mtc*

set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.wav,*.flac,*.ogg,*.mp3

set suffixes=.bak,~,.o,.h,.info,.swp,.obj

" }}}2

" Casse {{{2

set wildignorecase

" }}}2

"  Complétion en mode insertion {{{2

"set completeopt=menuone,preview

set completeopt=menuone,longest

set pumheight=12

" Compléter par quoi lors d'un ctrl-n/p ? {{{3

"    This option specifies how keyword completion works
"	when CTRL-P or CTRL-N are used.  It is also used for whole-line
"	completion |i_CTRL-X_CTRL-L|.  It indicates the type of completion
"	and the places to scan.  It is a comma separated list of flags:
"
"	.	scan the current buffer ('wrapscan' is ignored)
"	w	scan buffers from other windows
"	b	scan other loaded buffers that are in the buffer list
"	u	scan the unloaded buffers that are in the buffer list
"	U	scan the buffers that are not in the buffer list
"	k	scan the files given with the 'dictionary' option
"	kspell  use the currently active spell checking |spell|
"	k{dict}	scan the file {dict}.  Several "k" flags can be given,
"		patterns are valid too.  For example: :set cpt=k/usr/dict/*,k~/spanish
"	s	scan the files given with the 'thesaurus' option
"	s{tsr}	scan the file {tsr}.  Several "s" flags can be given, patterns
"		are valid too.
"	i	scan current and included files
"	d	scan current and included files for defined name or macro
"	]	tag completion
"	t	same as "]"

set complete=.,w,b,u,U,
			\s~/racine/index/spell/synonymes.txt,
			\k~/racine/index/spell/fr-classique+reforme1990.dic,
			\k~/racine/index/spell/en_GB.dic,
			\t,i,d

" }}}3

" Casse intelligente pour les complétions {{{3

set infercase

" }}}3

"  Omnicomplétion {{{3

set omnifunc=syntaxcomplete#Complete

"if has("autocmd") && exists("+omnifunc")
	"autocmd Filetype *
	"\ if &omnifunc == "" |
	"\ setlocal omnifunc=syntaxcomplete#Complete |
	"\ endif
"endif

" }}}3

" Complétion personalisée, gérée par certains plugins comme neocomplete

"set completefunc=

" }}}2

"  Complétion dans la ligne de commande {{{2

set wildchar=<TAB>

set wildcharm=<C-Z>

" Wildmode {{{3

" 'wildmode' 'wim'	string	neovim default: "full")
" 			global
" 			{not in Vi}
" 	Completion mode that is used for the character specified with
" 	'wildchar'.  It is a comma separated list of up to four parts.  Each
" 	part specifies what to do for each consecutive use of 'wildchar'.  The
" 	first part specifies the behavior for the first use of 'wildchar',
" 	The second part for the second use, etc.
" 	These are the possible values for each part:
" 	""				Complete only the first match.
" 	"full"			Complete the next full match.  After the last match,
" 					the original string is used and then the first match again.
" 	"longest"		Complete till longest common string.  If this doesn't
" 					result in a longer string, use the next part.
" 	"longest:full"	Like "longest", but also start 'wildmenu' if it is enabled.
" 	"list"			When more than one match, list all matches.
" 	"list:full"		When more than one match, list all matches and
" 					complete first match.
" 	"list:longest"	When more than one match, list all matches and
" 					complete till longest common string.

set wildmode=longest,full

" }}}3

" }}}2

" }}}1

"  Formatage du texte {{{1

set textwidth=72
set wrapmargin=7

set nojoinspaces

set formatoptions+=t
set formatoptions+=c
set formatoptions+=q
set formatoptions+=j

set formatoptions+=b
set formatoptions+=l
set formatoptions+=1
set formatoptions+=r
set formatoptions+=n

set formatexpr=

" Rien, fmt, par, ...

set formatprg=fmt
"set formatprg=par\ -w85rjq

" }}}1

"  Indentation {{{1

" Tabulation {{{2

" Largeur d'une tabulation

set tabstop=4

set softtabstop=4
set shiftwidth=4

set noexpandtab
set nosmarttab

" }}}2

" Indentation {{{2

" Indentation calquée sur la ligne précédente et des caractères clef

set smartindent

" Contrôle

set indentkeys=!^F,*<Return>,:,o,O,{,0=},0=#,e,=fi,=esac,=done

" Indentation à la C

set cindent

"set cinkeys=0{,0},0),:,0#,!^F,o,O,e

" Indentation basée sur l’évaluation d’une expression

"set indentexpr=

" }}}2

" }}}1

"  Pliage {{{1

"  Options {{{2

set foldenable

" Nombre minimum de lignes

set foldminlines=1

" Nombre de niveaux visibles

set foldlevel=0

"set foldlevelstart=0

" Ouverture automatique

" Commandes ouvrant automatiquement un pli

" set foldopen=all

set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Fermeture automatique

" Si curseur en-dehors et > à foldlevel

" set foldclose=all

" Nombre de colonnes pour afficher l'arborescence

set foldcolumn=7

" Titre des textes pliés

set foldtext=biblio#folding_text()

" }}}2

"  Méthode des marqueurs {{{2

set foldmethod=marker

set foldmarker={{{,}}}

" }}}2

"  Autocommandes {{{2

augroup Pliage

	au BufEnter,BufRead *.snippets set foldlevel=2

augroup END

" }}}2

" }}}1

"  Tampons (buffers) {{{1

" Autorise les fichiers modifiés à être cachés

set hidden
set bufhidden=hide

"set confirm

" }}}1

"  Onglets {{{1

" Barre d'onglets {{{2

set tabline=%!biblio#tabline()

"set guitablabel=%N\ %t\ %m

" 0: never
" 1: only if there are at least two tab pages
" 2: always

set showtabline=1

" }}}2

"  Regarder les onglets quand on change de tampon

set switchbuf=usetab

"  Maximum d’onglets ouverts

set tabpagemax=50

" }}}1

"  Différences entre fichiers {{{1

set diffopt=filler,context:4,vertical,foldcolumn:2

" }}}1

"  Labels, etiquettes {{{1

"  Tags {{{2

" Voir autocommandes.vim

"set tags=./tags,tags

"set tags=./tags,./TAGS,tags,TAGS

" }}}2

"  Cscope {{{2

set cscopeverbose

" Relatif au basename de cscope.out ?

"set cscoperelative

" Utilisation de la fenêtre quickfix

set cscopequickfix=s-,c-,d-,i-,t-,e-

" Tags ordinaires puis tags cscope

set cscopetagorder=1

" On utilise gtags pour remplacer cscope

set cscopeprg=gtags-cscope

" Nombre de répertoires à afficher

set cscopepathcomp=0

"cs add cscope.out %:p:h

"cd ~/bin

"cs add GTAGS
"cs add GRTAGS
"cs add GPATH
"cs add GSYMS

" }}}2

" }}}1

"  Compilation de fichiers {{{1

set makeprg='make'

set makeef=
" set makeef='make-errors-##'

" }}}1

"  Maps {{{1

" Idées de touches pour maps / préfixes de maps {{{2

" ’ : non utilisé
" ` : map ' = `

" <cr> = <enter>
" <s-cr>
" <m-cr>
" <c-cr>

" <m-!>
" <c-!>

" <m-$>
" <c-$>

" <m-=>
" <c-=>

" <space>
" <s-space>
" <m-space>
" <c-space>

" <tab>
" <s-tab>
" <m-tab>
" <c-tab>

" <bs> = backspace
" <s-bs>
" <m-bs>
" <c-bs>

" <Bar> = |
" <Bslash> = \

" <Bar> = |
" <Bslash> = \

" <m-_>
" <c-_>

" }}}2

" Mapping with Meta/Alt key {{{2

" Xterm, by default, sets eightBitInput to true, meaning that the eighth
"bit is set for meta characters (combinations with the Alt key, for
"instance). Not all terminals have this feature enabled by default, and
"therefore work differently (they send an Esc before the character key).
"
" So for the xterm, with enables the eight bit, you can just do
"something like:
"
" map <m-a> ggVG
"
" However, with a terminal that is in 7 bit mode, you have to do this:
"
" set <m-a> = ^[a map <m-a> ggVG " the ^[ is an Esc char that comes
"before the 'a' In most default configs, ^[a may be typed by pressing
"first <C-v>, then <M-a>

" }}}2

"  Options {{{2

" Temps (en millisecondes)
" avant de considérer un map ambigu comme complet

set timeout

set timeoutlen=12750

set ttimeout

set ttimeoutlen=50

" }}}2

" Préfixe pour les plugins {{{2

" Remarque : certains mapleaders causent des problèmes avec l’indentation <<

" let mapleader="\<d-,>"
" let maplocalleader="\<d-,>"

" }}}2

"  Aide {{{2

" Voir <url:paquet/postload.vim#tn=Denite>

"nnoremap <F1> <nop>

nnoremap <F1> :tab help<space>
nnoremap <S-F1> :tab helpgrep<space>

" }}}2

" Quitter {{{2

nnoremap ZZ :qa<cr>
nnoremap ZQ :qa!<cr>

" }}}2

" Déplacement {{{2

nnoremap <PageUp> <C-B>
nnoremap <PageDown> <C-F>

" }}}2

" Phrases {{{2

noremap (s (
noremap )s )

vnoremap (s (
vnoremap )s )

" }}}2

"  Fichiers {{{2

" Fichier courant aussi disponible dans le registre %
" Fichier alternatif aussi disponible dans le registre #
"nnoremap <C-G> :let @" = expand("%:p")<cr>2<C-G>

nnoremap <C-G> 2<C-G>

nnoremap <f5>e :tabe ~/racine/config/edit/neovim/init.vim<cr>
inoremap <f5>e :tabe ~/racine/config/edit/neovim/init.vim<cr>

nnoremap <f5>r :so ~/racine/config/edit/neovim/init.vim<cr>
inoremap <f5>r :so ~/racine/config/edit/neovim/init.vim<cr>

command! -nargs=? -complete=filetype EditSyntaxPlugin
\ exe 'keepjumps vsplit ~/racine/config/edit/neovim/after/syntax/' . (empty(<q-args>) ? &filetype : <q-args>) . '.vim'

nnoremap <f5>s :<c-u>EditSyntaxPlugin<cr>

nnoremap <f2>n :new <bar> only<cr>
nnoremap <f2>r :e!<cr>
nnoremap <f2>w :wa<cr>

nnoremap <kEnter> :wa<cr>

" nnoremap <m-e> :e <c-r>=expand('%:p:h') . '/*' <cr><c-d>
" nnoremap <m-s-e> :e **/*

nnoremap <m-e> :e <c-r>=expand('%:p:h') . '/' <cr>

nnoremap <f2>g <c-w>v:e <c-r>=expand('%:p:h') . '/Grenier'<cr><cr>G

" }}}2

" Arguments {{{2

nnoremap (a :previous<cr>
nnoremap )a :next<cr>

nnoremap (A :first<cr>
nnoremap )A :last<cr>

" }}}2

" Tampons (buffers) {{{2

nnoremap (b :bprevious<cr>
nnoremap )b :bnext<cr>

nnoremap (B :bfirst<cr>
nnoremap )B :blast<cr>

" Wipe current buffer
nnoremap <m-q> :ls!<cr>:silent bwipe!<space>
" Wipe all buffers
nnoremap <m-s-q> :%bwipe<cr>

" Lecture seule {{{3

nnoremap <f2>o :call ToggleReadonly()<cr>

func! ToggleReadonly()
	if &modifiable || ! &readonly
		setlocal readonly nomodifiable
	else
		setlocal noreadonly modifiable
	endif
	setlocal readonly? modifiable?
endfunc

" }}}3

" }}}2

" Fenêtres {{{2

nnoremap <s-tab>  <c-w>w
nnoremap <m-s-tab>  <c-w>p

nnoremap <m-left>  <c-w><left>
nnoremap <m-right> <c-w><right>
nnoremap <m-up>    <c-w><up>
nnoremap <m-down>  <c-w><down>

nnoremap <s-left> <c-w><left>
nnoremap <s-right> <c-w><right>
nnoremap <s-up> <c-w><up>
nnoremap <s-down> <c-w><down>

" }}}2

"  Onglets {{{2

nnoremap <f2>e :tabedit<space>
nnoremap <f2>t :tabnew<cr>

nnoremap <c-left> gT
nnoremap <c-right> gt

nnoremap (T :tabfirst<cr>
nnoremap )T :tablast<cr>

nnoremap (t :tabm -1<cr>
nnoremap )t :tabm +1<cr>

nnoremap <c-up> :tabm -1<cr>
nnoremap <c-down> :tabm +1<cr>

" }}}2

" Liste quickfix {{{2

nnoremap (q :cprevious<cr>
nnoremap )q :cnext<cr>

nnoremap (Q :cfirst<cr>
nnoremap )Q :clast<cr>

nnoremap (<c-q> :cpfile<cr>
nnoremap )<c-q> :cnfile<cr>

" }}}2

" Listes locales {{{2

nnoremap (l :lprevious<cr>
nnoremap )l :lnext<cr>

nnoremap (L :lfirst<cr>
nnoremap )L :llast<cr>

nnoremap (<c-l> :lpfile<cr>
nnoremap )<c-l> :lnfile<cr>

" }}}2

" Anciens fichiers {{{2

" Fichiers dont une marque est présente dans shada

" Voir la configuration de la librairie tlib

"nnoremap <m-o> :browse oldfiles<cr>

" }}}2

"  Tags {{{2

nnoremap (<m-t> :tprevious<cr>
nnoremap )<m-t> :tnext<cr>

nnoremap (<m-s-t> :tfirst<cr>
nnoremap )<m-s-t> :tlast<cr>

nnoremap <f2>j :tj /
nnoremap <f2>J :tab tj /

" }}}2

"  Déplacements & Copie {{{2

" Début & Fin de fichier {{{3

nnoremap gg gg0
nnoremap G G$zt

" }}}3

" Lignes-écran {{{3

nnoremap + gj
nnoremap - gk

inoremap <S-Up> <C-o>gk
inoremap <S-Down> <C-o>gj

" }}}3

" Déplacement de lignes {{{3

" Voir plugin textmanip

" }}}3

" Signets {{{3

" ` = ' : plus pratique sur les claviers be, fr

nnoremap ' `

" }}}3

" }}}2

"  Recherche & Remplacement {{{2

" Recherche {{{3

" Plus besoin avec xcape
"nnoremap ’ /

" }}}3

" Recherche d’un mot {{{3

nnoremap <f2>, /\<\><left><left>
vnoremap <f2>, /\<\><left><left>

" }}}3

"  Remplacement {{{3

nnoremap <f2>; :%s/\<\>//<left><left><left><left>
vnoremap <f2>; :%s/\<\>//<left><left><left><left>

" }}}3

" }}}2

"  Copier / Coller {{{2

"  Copie jusqu'à la fin de la ligne pour rester consistant avec D et C

nnoremap Y y$

" Copie de toutes les lignes correspondant à un motif

command! -nargs=1 GlobalYank :call biblio#global_yank(<q-args>, 'a')

nnoremap <f2>y :GlobalYank<space>

" Couper toutes les lignes correspondant à un motif

command! -nargs=1 GlobalDelete :call biblio#global_delete(<q-args>, 'a')

nnoremap <f2>d :GlobalDelete<space>

"  Copies provenant d’un autre logiciel

nnoremap <f2>p :set paste!<cr>

" Permet le shift-insert fonctionnel comme dans les Xterm

nnoremap <C-Insert> ^"+y$
vnoremap <C-Insert> "+y
inoremap <C-Insert> <esc>l"+y$ha

nnoremap <C-Delete> ^d$
vnoremap <C-Delete> "+d
inoremap <C-Delete> <esc>l"+d$ha

nnoremap <C-S-Insert> ggyG''

nnoremap <C-S-Delete> ggdG

nnoremap <silent> <S-Insert> "+p
vnoremap <silent> <S-Insert> c<C-R>+
snoremap <silent> <S-Insert> <C-R>+
inoremap <silent> <S-Insert> <C-R>+
cnoremap <silent> <S-Insert> <C-R>+

" noremap <S-Insert> <MiddleMouse>

" }}}2

"  Annulation {{{2

" <C-G>u entame un nouvel atome d'undo {{{3

inoremap <m-u> <c-g>u

inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" }}}3

" }}}2

"  Pliage {{{2

nnoremap ]] ]z
nnoremap [[ [z

nnoremap )z ]z
nnoremap (z [z

vnoremap )z ]z
vnoremap (z [z

nnoremap )) zjzx]z
nnoremap (( zkzx[z

vnoremap )) zjzx]z
vnoremap (( zkzx[z

nnoremap zo zCzO

" }}}2

" Insertion {{{2

" Date
inoremap <m-d> <c-r>=strftime("%d %B %Y")<cr>

" }}}2

"  Complétion {{{2

inoremap <PageUp> <C-P>
inoremap <PageDown> <C-N>

"inoremap <C-Space> <C-X><C-O>
"inoremap <M-Space> <C-X><C-L>

cnoremap <PageUp> <C-P>
cnoremap <PageDown> <C-N>

" }}}2

" Ligne de commande {{{2

" Complétion {{{3

cnoremap <C-X><C-A> <C-A>
cnoremap <C-X><C-D> <C-D>
cnoremap <C-X><C-L> <C-L>

" }}}3

" Déplacement {{{3

" Mot suivant / précédent

cnoremap <m-b> <C-Left>
cnoremap <m-f> <C-Right>

" Vers début de ligne

cnoremap <C-A> <C-B>

" }}}3

" Remplacer la ligne par le résultat d’une expression {{{3

"cnoremap <C-@> <C-\>e

" }}}3

" Insérer un élément {{{3

" Répertoire du fichier courant

cnoremap <m-,> <c-r>=expand('%:p:h') . '/'<cr>

" }}}3

" Enlever un élément dans le chemin d’un fichier {{{3

cnoremap <C-BS> <C-\>e(<SID>RemoveLastPathComponent())<CR>

function! s:RemoveLastPathComponent()
  return substitute(getcmdline(), '\%(\\ \|[\\/]\@!\f\)\+[\\/]\=$\|.$', '', '')
endfunction

cmap <m-d> <c-right><c-w>

" }}}3

" Mode ex {{{3

" Q ou gQ : mode ex
" On en sort par :vi

"nnoremap QQ gQ

" }}}3

" Hauteur de la fenêtre de commande {{{3

nnoremap <f2>c :set cmdheight=

" }}}3

" Ligne ou sélection courante {{{3

" Comme commande ex

nnoremap <m-:> :exe getline(".")<CR>
vnoremap <m-:> :<C-U>exe join(getline("'<","'>"),'<Bar>')<CR>

" Comme commande externe

nnoremap <m-!> :exe '!'.getline('.')<CR>

" }}}3

" }}}2

"  Orthographe {{{2

" underline ~~~ wrong words
nnoremap <silent> <f2>~ :setlocal spell!<cr>

" }}}2

"  Informations {{{2

nnoremap <f2>ih :echo biblio#highlight_group()<cr>

" }}}2

"  Shell {{{2

nnoremap <f2>s :tabe ~/racine/snippet/hist/$OPERASYS.zsh<cr>
nnoremap <f2>S :w! >> ~/racine/snippet/hist/$OPERASYS.zsh<cr>

nnoremap <f2>h :tabe ~/racine/hist/zsh/$HOST<cr>

" }}}2

" Journal de bord {{{2

nnoremap <f2>L :tabe ~/racine/log/captain<cr>

" }}}2

" Pavé numérique {{{2

" used for :wa
" nmap <kEnter> <Enter>

nmap <k0> 0
nmap <k1> 1
nmap <k2> 2
nmap <k3> 3
nmap <k4> 4
nmap <k5> 5
nmap <k6> 6
nmap <k7> 7
nmap <k8> 8
nmap <k9> 9

" }}}2

" Présentation {{{2

" Numérotation des lignes {{{3

func! InterrupteurNumerotationAbsolueRelative()

	if &relativenumber
		set number norelativenumber
	else
		set number relativenumber
	endif

	set relativenumber?

endfunc

nnoremap <silent> <M-n> :call InterrupteurNumerotationAbsolueRelative()<cr>

" }}}3

" Curseur {{{3

set guicursor=
			\n:block-Cursor/lCursor,
			\v:block-vCursor,
			\i:ver25-iCursor,
			\o:hor50-Cursor-blinkwait100-blinkon700-blinkoff700,
			\r:hor15-iCursor,
			\c:block-Cursor,
			\ci:ver25,
			\cr:hor25,
			\sm:block

" }}}3

set termguicolors

nnoremap <f2>l :set cursorline!<cr>

" }}}2

" Émulateur de terminal {{{2

nnoremap <C-$> :term $SHELL -l<cr>

nnoremap <C-!> :term<space>

" Passer en mode normal

" En référence à Ctrl-Q / Ctrl-S

tnoremap <D-n> <C-\><C-n>
tnoremap <D-v> <C-\><C-n>
tnoremap <D-i> <C-\><C-n>

tnoremap <D-^> <C-\><C-n><C-^>

tnoremap <m-tab> <C-\><C-n><C-W>w

tnoremap <D-w> <C-\><C-n><C-W>w

tnoremap <D-h> <C-\><C-n><C-W><Left>
tnoremap <D-j> <C-\><C-n><C-W><Down>
tnoremap <D-k> <C-\><C-n><C-W><Up>
tnoremap <D-l> <C-\><C-n><C-W><Right>

tnoremap <D-q> <C-\><C-n>:ls!<cr>:silent bd!<space>

" }}}2

" }}}1

"  Abréviations {{{1

" Abréviations {{{2

"iab cad c’est-à-dire

"iab dd <c-r>=strftime("%H : %M %a %d %b %Y")<cr>

" Remplacé par le plugin cmdalias

"cab hh tab help
"cab dd <c-r>=strftime("[=] %A %d %B %Y  (o) %H : %M : %S  %z")<cr>

" }}}2

" Fautes de frappe courantes {{{2

iab totu tout
iab sosu sous

" }}}2

" }}}1

"  Présentation {{{1

"  Lignes {{{2

" Numérotation

set number

set relativenumber

" Espacement

set linespace=3

" Longues lignes occupent plusieurs lignes (wrap) écran ou une seule (nowrap)

set wrap

" Coupe aux caractères donnés par breakat

set linebreak
set showbreak=┅
set showbreak=↪
set breakat=" ^I!@*-+;:,./?"

" }}}2

"  Caractères non imprimables {{{2

"set display+=uhex

" }}}2

"  Mise en évidence {{{2

" Souligne une colonne après textwidth

"if exists("&colorcolumn")
	"set colorcolumn=+1
"endif

" }}}2

"  Correspondances {{{2

set matchpairs=(:),{:},[:],<:>

" Affiche les correspondances entre
" (), [], {}, ...

set showmatch

" Fréquence de showmatch

set matchtime=7

" }}}2

"  Défilement {{{2

" Nombre de lignes qui défilent lors d’un <C-U> <C-D>

set scroll=12

" Nombre minimal de colonnes qui défilent

set sidescroll=3

" Minimum de lignes visibles à l'écran
" au-dessus et en-dessous du curseur

set scrolloff=3

" Minimum de colonnes visibles à l'écran
" à gauche et à droite du curseur

set sidescrolloff=15

" Saut lorsque le curseur dépasse les limites hauts / bas

set scrolljump=1

" }}}2

"  Tabulation et espaces de fin de lignes {{{2

set list

set listchars=

set listchars+=tab:┆\ ,nbsp:▒
set listchars+=precedes:❮,extends:❯
set listchars+=conceal:Δ

" }}}2

"  Curseur {{{2

" Essaye de garder le curseur dans la même colonne
" quand on change de ligne

set nostartofline

" Mets en évidence la ligne courante

"set cursorline

" Mets en évidence la colonne courante

"set cursorcolumn

" }}}2

" Mise en évidence {{{2

"set colorcolumn=+1

" }}}2

" Splits {{{2

set splitbelow
set splitright

" }}}2

"  Messages {{{2

" Rapport à partir de 0 lignes modifiées,
" autrement dit tout le temps

set report=0

" Messages courts

set shortmess=
"set shortmess=a

set showmode

" }}}2

"  Barre de statut {{{2

" Affiche la position du curseur ligne, colonne

set ruler

" Affiche les commandes incomplètes

set showcmd

" Affiche une barre de statut en bas de l'écran

if ! exists("g:colors_name")
	let g:colors_name = ''
endif

if has('statusline')
	set statusline=
	"set statusline+=%#statut#
	set statusline+=\ %.43F
	set statusline+=%(\ %m%)
	set statusline+=%(\ %r%)
	set statusline+=\ \ buf\ %n
	set statusline+=\ \ win\ %{winnr()}/%{win_getid()}
	set statusline+=%(%a%)
	set statusline+=\ \ %(%{(&filetype==\"\"?\"\":\"ft\")}\ %Y\ %)
	set statusline+=\ \ enc\ %{(&fenc==\"\"?&enc:&fenc)}
	set statusline+=\ \ pos
	set statusline+=\ %P\ %l\ x\ %c
	set statusline+=%(%{(col(\'.\')==virtcol(\'.\')?\"\":\"/\".virtcol(\'.\'))}%)
	set statusline+=\ %=
	set statusline+=\ \ color\ %{g:colors_name}
	set statusline+=\ \ \ \ |
	set statusline+=%<
endif

" 	set statusline+=\ \ Color\ %{g:colors_name}
" 	set statusline+=\ \ %{strftime('%H:%M\ %a\ %d\ %b\ %Y')}
" 	set statusline+=\ \ %{strftime('%H:%M')}
" 	set statusline+=\ \ Car\ %2.2B
" 	set statusline+=\ \ Car\ %3.3b\ x\ %2.2B

"highlight statut ctermfg=green guifg=green
"highlight statut ctermbg=black guibg=black
"highlight statut cterm=bold gui=bold

" }}}2

"  Zone de commande {{{2

" Hauteur

set cmdheight=5

" }}}2

" Conceal {{{2

"set conceallevel=1

"set concealcursor=i

" Voir aussi ~/racine/config/edit/neovim/after/syntax/html/conceal/neovim

" }}}2

" Couleurs dans le terminal {{{2

if has("termguicolors")
	set termguicolors
endif

" }}}2

" }}}1

"  Syntaxe {{{1

"  Activation {{{2

syntax enable

" }}}2

"  Options {{{2

"syntax sync fromstart

syntax sync minlines=7
syntax sync maxlines=84

" }}}2

" }}}1

" Ligne de commande :ex {{{1

" Hauteur de la fenêtre d'historique
set cmdwinheight=15

" Édition de la ligne de commande avec l’historique dans un tampon
" Défaut = <C-F>

"set cedit=<Esc>
"set cedit=<Ins>

" Prévisualisation du résultat {{{2

set inccommand=split

" }}}2

" Commandes {{{2

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" }}}2

" }}}1

" Terminal {{{1



" }}}1

"  Auto-commandes {{{1

source ~/racine/config/edit/neovim/autocommandes.vim

" }}}1

"  Types de fichiers {{{1

"filetype plugin indent on

filetype on
filetype plugin on
filetype indent on

" }}}1

"  Thèmes {{{1

colo ornuit

" }}}1

"  {{{ Historique

set shada=
	\!,
	\f1,
	\h,
	\<12,
	\s12,
	\'60,
	\:10000,
	\/10000,
	\@10000,
	\n~/racine/session/neovim/main.shada

" Remplacé par wheel mru
" 	\%30,

" Nombre par défaut pour lignes de commande,
" recherches, nombre de lignes d’entrée

set history=10000

" }}}

" ------------------------------

"  {{{ Plugins

if $OPERASYS == 'archlinux'
	let g:python3_host_prog = '/bin/python3'
	let g:python_host_prog = '/bin/python2'
elseif $OPERASYS == 'freebsd'
	let g:python3_host_prog = '/usr/local/bin/python3'
	let g:python_host_prog = '/usr/local/bin/python2'
endif

source ~/racine/config/edit/neovim/paquet/minpac.vim
source ~/racine/config/edit/neovim/paquet/plugged.vim

source ~/racine/config/edit/neovim/paquet/preload.vim

" On charge tout, pour pouvoir utiliser certaines fonctions
" de configuration

packloadall

" Les appels aux fonctions autoload des plugins
" doivent se situer après packloadall

source ~/racine/config/edit/neovim/paquet/postload.vim

" }}}

"  {{{ Auto-commandes pour plugins

source ~/racine/config/edit/neovim/paquet/autocmd-plugin.vim

" }}}
