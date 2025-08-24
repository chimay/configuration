" vim: set filetype=vim :

" documentation {{{1

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

" debug {{{1

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

" ------------------------------------

"  compatibility {{{1

"set cpoptions-=C

"  word chars {{{1

"set iskeyword=@,48-57,_,192-255
"set iskeyword=48-57,_,192-255

set iskeyword-=/,:,#,@,-

" internal pager {{{1

set more

" insertion {{{1

" nostop = don’t stop at beginning of insert

set backspace=indent,eol,start

" cut, copy, paste {{{1

"set clipboard=

set clipboard=unnamedplus

"  environment {{{1

"  Chemins de recherche des fichiers {{{2

"set path=.,,
set path=.,,**

"  Chemins de recherche des répertoires {{{2

"set cdpath=,

"set cdpath+=~/racine
"set cdpath+=~

"  filesystem {{{1

"  Répertoire du fichier courant {{{2

" Se place dans le répertoire du fichier courant

" Voir aussi autocommand.vim

"set autochdir

"  Lecture / Écriture {{{2

"set autowrite				" Sauvegarde automatique des fichiers lors de navigation
							" dans les arguments, :stop, :suspend, :tag, :!, :make, ^],
							" ou quand un :buffer, ctrl-^, ^O, ^I ou une marque dirige vers un autre fichier

"set autowriteall			" Sauvegarde automatique des fichiers aussi pour :e, :enew, :q, :qall, :x, :recover

"set autoread

"  Sauvegardes {{{2

set backup

set backupdir=~/racine/varia/backup/neovim,.

set backupext=~

set writebackup

set backupskip=/tmp/*,/etc/*,mutt-*-*-*-*

" Patchmode {{{2

"set patchmode=.original

"  Fichier de récupération en cas de crash {{{2

set swapfile
set directory=~/racine/varia/autosave/neovim

"set noswapfile

" Fréquence de sauvegarde

set updatecount=100			" Nombre de caractères
set updatetime=1000			" Millisecondes

" undos {{{1

set undolevels=1234

if exists("&undofile")
	set undofile
	set undoreload=12743
	set undodir=~/racine/varia/undo/neovim,.
endif

"  session {{{1

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

"  encodage {{{1

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

" Divers {{{3

" dig -n 8208				" ‐
" dig -m 8211				" –

"dig ~~ 0771			" tilde supérieur

"  language {{{1

set spelllang=fr,en

set spellsuggest=best

"set imsearch
"set keymap=french-azerty

"  dictionary {{{1

" Complétion par dictionnaire et synonymes

" Dictionnaires {{{2

set dictionary+=~/racine/index/dict/spell/dictionnaire.txt
set dictionary+=~/racine/index/dict/spell/fr-classique+reforme1990.dic
set dictionary+=~/racine/index/dict/spell/en_GB.dic

" Thesaurus (synonymes) {{{2

" personal
set thesaurus+=~/racine/index/dict/spell/synonymes.txt
" french
set thesaurus+=~/racine/index/dict/spell/thes_fr.dat

" modes {{{1

set virtualedit=block,onemore
"set virtualedit=block,insert,onemore
"set virtualedit=all

set selection=inclusive

" Lignes d'instruction neovim dans les fichiers édités

set modeline
set modelines=7

" devices {{{1

"  Clavier {{{2

" Autorise le passage d'une ligne à l'autre avec les flèches

set whichwrap=<,>,[,],~,b,s,h,l

"  Son {{{2

set visualbell
set noerrorbells

"  Souris {{{2

set mouse=a

set mousefocus

set mousehide					" Cache le pointeur de souris lorsque l'on tape

set mousemodel=extend				" Clic droit modifie sélection
"set mousemodel=popup_setpos		" Clic droit menu

"set mouseshape=i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow

" Sélection {{{2

"set selectmode+=key
"set selectmode+=mouse

"set keymodel+=startsel
"set keymodel+=stopsel

" search {{{1

" Casse {{{2

" Ignore la casse

set ignorecase

" Recherche intelligente : ignore la casse sauf si
" des majuscules sont présentes dans le motif

set smartcase

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

" completion {{{1

" Fichiers à ignorer {{{2

set wildignore=

set wildignore+=*/.git/*,*/.hg/*,*/.bzr/*,*/_darcs/*,*/.svn/*

set wildignore+=*.pyc,*.elc,*.zwc
set wildignore+=*.aux,*.maf,*.toc,*.ptc*,*.mtc*

set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.wav,*.flac,*.ogg,*.mp3

set suffixes=.bak,~,.o,.h,.info,.swp,.obj

" Casse {{{2

set wildignorecase

"  Complétion en mode insertion {{{2

"set completeopt=menuone,preview
"set completeopt=menuone,longest

set completeopt=menu

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

" set complete=.,w,b,u,U,
" 			\s~/racine/index/dict/spell/synonymes.txt,
" 			\k~/racine/index/dict/spell/fr-classique+reforme1990.dic,
" 			\k~/racine/index/dict/spell/en_GB.dic,
" 			\t,i,d

set complete=.,b,u,U,i,d
" use c-x c-k for dictionary and c-x c-t for thesaurus

" Casse intelligente pour les complétions {{{3

set infercase

"  Omnicomplétion {{{3

set omnifunc=syntaxcomplete#Complete

" Complétion personalisée, gérée par certains plugins comme neocomplete

"set completefunc=

"  Complétion dans la ligne de commande {{{2

set wildchar=<tab>

" set wildcharm=<C-Z>
set wildcharm=<tab>

set wildoptions=pum,tagfile

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

"set wildmode=longest,full
set wildmode=full

" text formatting {{{1

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

" indentation {{{1

" Tabulation {{{2

" Largeur d'une tabulation

set tabstop=4

set softtabstop=4
set shiftwidth=4

set noexpandtab
set nosmarttab

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

" folding {{{1

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

set foldtext=library#folding_text()

"  Méthode des marqueurs {{{2

set foldmethod=marker

set foldmarker={{{,}}}

" buffers {{{1

" Autorise les fichiers modifiés à être cachés

set hidden
set bufhidden=hide

" Demande si il faut sauver un buffer avant de le cacher

"set confirm

" tabs (onglets) {{{1

" Barre d'onglets {{{2

" managed by wheel
"set tabline=%!library#tabline()

"set guitablabel=%N\ %t\ %m

" 0: never
" 1: only if there are at least two tab pages
" 2: always

set showtabline=1

"  Regarder les onglets quand on change de tampon

set switchbuf=usetab

"  Maximum d’onglets ouverts

set tabpagemax=50

" diff between files {{{1

set diffopt=filler,context:4,vertical,foldcolumn:2

" tags (labels, etiquettes) {{{1

"  Tags {{{2

" Voir autocommand.vim

"set tags=./tags,tags

"set tags=./tags,./TAGS,tags,TAGS

" compilation {{{1

set makeprg=make

set makeef=
" set makeef='make-errors-##'

" maps {{{1

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

" altgr-...

" Mapping with Meta/Alt key {{{2

" Xterm, by default, sets eightBitInput to true, meaning that the eighth
" bit is set for meta characters (combinations with the Alt key, for
" instance). Not all terminals have this feature enabled by default, and
" therefore work differently (they send an Esc before the character key).
"
" So for the xterm, with enables the eight bit, you can just do
"something like:
"
" map <m-a> ggVG
"
" However, with a terminal that is in 7 bit mode, you have to do this:
"
" set <m-a> = ^[a map <m-a> ggVG " the ^[ is an Esc char that comes
" before the 'a' In most default configs, ^[a may be typed by pressing
" first <C-v>, then <M-a>

"  Options {{{2

" Temps (en millisecondes)
" avant de considérer un map ambigu comme complet

set timeout

set timeoutlen=12750

set ttimeout

set ttimeoutlen=50

" Préfixe pour les plugins {{{2

" Remarque : certains mapleaders causent des problèmes avec l’indentation <<

let g:mapleader="\\"
let g:maplocalleader="_"

" let mapleader="\<d-,>"
" let maplocalleader="\<d-,>"

"  Aide {{{2

" Voir <url:paquet/postload.vim#tn=Denite>

"nnoremap <F1> <nop>

nnoremap <F1> :tab help<space>
nnoremap <S-F1> :tab helpgrep<space>
nnoremap <C-F1> <cmd>call library#toggle_help_filetype()<cr>
inoremap <C-F1> <cmd>call library#toggle_help_filetype()<cr>
vnoremap <C-F1> <cmd>call library#toggle_help_filetype()<cr>
nnoremap <M-F1> <cmd>call library#helptags()<cr>

"nnoremap K K<c-w>T

" does not work
"nnoremap K <cmd>tab normal! K<cr>

" Manuels {{{2

nnoremap gm <cmd>call library#manual()<cr>

" Quitter {{{2

nnoremap ZZ <cmd>qa<cr>
nnoremap ZQ <cmd>qa!<cr>

" Phrases {{{2

" noremap <f5>s (
" noremap <f6>s )

" vnoremap <f5>s (
" vnoremap <f6>s )

"  Fichiers {{{2

nnoremap <kEnter> <cmd>call library#write_all()<cr>

"nnoremap <C-G> 2<C-G>

" Fichier courant aussi disponible dans le registre %
" Fichier alternatif aussi disponible dans le registre #

nnoremap <C-G> <cmd>let @+ = expand("%:p:~")<cr>2<C-G>

nnoremap <f2>n <cmd>new <bar> only<cr>
nnoremap <f2>e :e <c-r>=expand('%:p:h') . '/' <cr>
nnoremap <f2>r :r <c-r>=expand('%:p:h') . '/' <cr>
nnoremap <f2>g <c-w>v:e <c-r>=expand('%:p:h') . '/Grenier'<cr><cr>G
nnoremap <f2>v <cmd>tabedit ~/racine/config/edit/neovim/main.vim<cr>
nnoremap <f2>c <cmd>tabedit ~/racine/plain/organize/cronos.org<cr>
nnoremap <f2>d <cmd>call library#dream()<cr>
nnoremap <f2>f <cmd>tabedit ~/racine/plain/orgmode/fix.org <bar> normal ggzx<cr>
nnoremap <f2>l <cmd>tabedit ~/racine/log/ship/captain.md <bar> normal ggzx<cr>
nnoremap <f2>t <cmd>tabedit ~/racine/plain/orgmode/tasks.org <bar> normal ggzx<cr>

command! -nargs=? -complete=filetype EditSyntaxPlugin
\ exe 'keepjumps vsplit ~/racine/config/edit/neovim/after/syntax/' . (empty(<q-args>) ? &filetype : <q-args>) . '.vim'

nnoremap <f2>s <cmd>EditSyntaxPlugin<cr>

nnoremap <f2>x <cmd>call library#chmodexec()<cr>

" figlet banner
nnoremap <f3>b <cmd>call library#figlet()<cr>

nnoremap <f3>x <cmd>call library#text_to_password()<cr>
nnoremap <f3>X <cmd>call library#password_to_text()<cr>

nnoremap <f3>m :make! -k<space>

" lilypond
nnoremap <f9>m <cmd>call library#make_midi()<cr>
nnoremap <f9>o <cmd>call library#make_ogg()<cr>
nnoremap <f9>p <cmd>call library#display_pdf()<cr>

" Arguments {{{2

"nnoremap <f5>a <cmd>previous<cr>
"nnoremap <f6>a <cmd>next<cr>

"nnoremap <f5>A <cmd>first<cr>
"nnoremap <f6>A <cmd>last<cr>

" Tampons (buffers) {{{2

"nnoremap <f5>b <cmd>bprevious<cr>
"nnoremap <f6>b <cmd>bnext<cr>

"nnoremap <f5>B <cmd>bfirst<cr>
"nnoremap <f6>B <cmd>blast<cr>

" wipe buffer
nnoremap <m-q> <cmd>bwipe!<cr>
" wipe alternate buffer
nnoremap <d-q> <cmd>bwipe! #<cr>
" wipe all buffers
nnoremap <m-s-q> <cmd>%bwipe<cr>

nnoremap <f3>s <cmd>%sort<cr>

" Lecture seule {{{3

nnoremap <f3>r <cmd>call library#toggle_readonly()<cr>

" Fenêtres {{{2

" nnoremap <s-tab>  <c-w>w
" nnoremap <m-s-tab>  <c-w>p

" nnoremap <s-left> <c-w><left>
" nnoremap <s-right> <c-w><right>
" nnoremap <s-up> <c-w><up>
" nnoremap <s-down> <c-w><down>

" doesnt work
" nnoremap <d-7>  <c-w>w
" nnoremap <d-4> <c-w><left>
" nnoremap <d-6> <c-w><right>
" nnoremap <d-8> <c-w><up>
" nnoremap <d-5> <c-w><down>

"  Onglets {{{2

nnoremap <f3>t <cmd>tabnew<cr>
nnoremap <f3>T :tabedit<space>

"nnoremap <f5>T <cmd>tabfirst<cr>
"nnoremap <f6>T <cmd>tablast<cr>

"nnoremap <f5>t <cmd>tabmove -1<cr>
"nnoremap <f6>t <cmd>tabmove +1<cr>

nnoremap <F3>= <cmd>call library#equal_windows()<cr>

nnoremap <leader><left> <cmd>call library#win2prev_tab()<cr>
nnoremap <leader><right> <cmd>call library#win2next_tab()<cr>

" Liste quickfix {{{2

"nnoremap <f5>q <cmd>cprevious<cr>
"nnoremap <f6>q <cmd>cnext<cr>

"nnoremap <f5>Q <cmd>cfirst<cr>
"nnoremap <f6>Q <cmd>clast<cr>

"nnoremap <f5><c-q> <cmd>cpfile<cr>
"nnoremap <f6><c-q> <cmd>cnfile<cr>

" Listes locales {{{2

"nnoremap <f5>l <cmd>lprevious<cr>
"nnoremap <f6>l <cmd>lnext<cr>

"nnoremap <f5>L <cmd>lfirst<cr>
"nnoremap <f6>L <cmd>llast<cr>

"nnoremap <f5><c-l> <cmd>lpfile<cr>
"nnoremap <f6><c-l> <cmd>lnfile<cr>

" Anciens fichiers {{{2

" Fichiers dont une marque est présente dans shada

" Voir la configuration de la librairie tlib

"nnoremap <m-o> <cmd>browse oldfiles<cr>

"  Tags {{{2

"nnoremap <f5><m-t> <cmd>tprevious<cr>
"nnoremap <f6><m-t> <cmd>tnext<cr>

"nnoremap <f5><m-s-t> <cmd>tfirst<cr>
"nnoremap <f6><m-s-t> <cmd>tlast<cr>

nnoremap <f3>j <cmd>tj /
nnoremap <f3>J <cmd>tab tj /

"  Déplacements & Copie {{{2

" Début & Fin de fichier {{{3

nnoremap gg gg0
nnoremap G G$

" Pages {{{3

nnoremap <PageUp> <C-B>
nnoremap <PageDown> <C-F>

" Lignes {{{3

nnoremap <silent> j <cmd>call library#wrap_down()<cr>
nnoremap <silent> k <cmd>call library#wrap_up()<cr>
nnoremap <silent> <up> <cmd>call library#wrap_up()<cr>
nnoremap <silent> <down> <cmd>call library#wrap_down()<cr>

" Lignes-écran {{{3

nnoremap + gj
nnoremap - gk

nnoremap <kplus> gj
nnoremap <kminus> gk

inoremap <S-Up> <C-o>gk
inoremap <S-Down> <C-o>gj

" Déplacement de lignes {{{3

" Voir plugin textmanip

" Echange {{3

" see also
" <url:~/racine/config/edit/neovim/lua/config/keybinds.lua#tn=Move lines up/down>

" chars
nnoremap <f4>c xp
nnoremap <f4>C Xp
" words
nnoremap <f4>w bdwelp
" lines
nnoremap <f4>l ddp
nnoremap <f4>L ddkP
" paragraphs
nnoremap <f4>p {dap}P{

" Signets {{{3

" ` = ' : plus pratique sur les claviers be, fr

nnoremap ' `

"  Recherche & Remplacement {{{2

" Recherche {{{3

" Plus besoin avec xcape
"nnoremap ’ /

" Recherche d’un mot {{{3

nnoremap <f3>, /\<\><left><left>
vnoremap <f3>, /\<\><left><left>

"  Remplacement {{{3

nnoremap <f3>; :%s/\<\>//<left><left><left><left>
vnoremap <f3>; :%s/\<\>//<left><left><left><left>

"  Copier / Coller {{{2

"  Copie jusqu'à la fin de la ligne pour rester consistant avec D et C

" by default in neovim
"nnoremap Y y$

" Copie de toutes les lignes correspondant à un motif

command! -nargs=1 GlobalYank :call library#global_yank(<q-args>, 'a')<cr>

nnoremap <f3>y :GlobalYank<space>

" Couper toutes les lignes correspondant à un motif

command! -nargs=1 GlobalDelete :call library#global_delete(<q-args>, 'a')<cr>

nnoremap <f3>d :GlobalDelete<space>

" Option paste

nnoremap <f3>p :set paste!<cr>

" Comme dans les Xterm

" c-insert = yank
" s-insert = paste

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

 "  Annulation {{{2

inoremap <c-z> <cmd>undo<cr>
inoremap <m-z> <cmd>redo<cr>

" <C-G>u entame un nouvel atome d'undo

inoremap <m-u> <c-g>u

" by default in neovim
"inoremap <C-U> <C-G>u<C-U>
"inoremap <C-W> <C-G>u<C-W>

"  Pliage {{{2

nnoremap ]] ]z
nnoremap [[ [z

nnoremap ]f ]]
nnoremap [f [[

"nnoremap <f5>z ]z
"nnoremap <f6>z [z

"vnoremap <f5>z ]z
"vnoremap <f6>z [z

"nnoremap <f5>) zjzx]z
"nnoremap <f6>( zkzx[z

"vnoremap <f5>) zjzx]z
"vnoremap <f6>( zkzx[z

nnoremap zo zCzO

" Insertion {{{2

" Date
inoremap <d-d> <c-r>=strftime("%a %d %b %Y")<cr>

"  Complétion {{{2

inoremap <PageUp> <C-P>
inoremap <PageDown> <C-N>

inoremap <expr> <tab> library#smart_tab()

"inoremap <C-Space> <C-X><C-O>
"inoremap <M-Space> <C-X><C-L>

cnoremap <PageUp> <C-P>
cnoremap <PageDown> <C-N>

" Ligne de commande {{{2

" Complétion {{{3

" insère tous
cnoremap <C-X><C-A> <C-A>
" affiche les candidats
cnoremap <C-X><C-D> <C-D>
" insère le plus long
cnoremap <C-X><C-L> <C-L>

" Déplacement {{{3

" Mot suivant / précédent

cnoremap <m-b> <C-Left>
cnoremap <m-f> <C-Right>

" Vers début de ligne

cnoremap <C-A> <C-B>

" Remplacer la ligne par le résultat d’une expression {{{3

"cnoremap <C-@> <C-\>e

" Insérer un élément {{{3

" Répertoire du fichier courant

cnoremap <m-,> <c-r>=expand('%:p:h') . '/'<cr>

" Effacer {{{3

cmap <m-d> <c-right><c-w>

" Mode ex {{{3

" Q ou gQ : mode ex
" On en sort par :vi

nnoremap QQ gQ

" Hauteur de la fenêtre de commande {{{3

nnoremap <f3>c :set cmdheight=

" Ligne ou sélection courante {{{3

" Comme commande ex

nnoremap <m-:> <cmd>exe getline(".")<CR>

" Comme commande externe

nnoremap <m-!> <cmd>exe '!'.getline('.')<CR>

"  Orthographe {{{2

" underline ~~~ wrong words
nnoremap <silent> <f3>~ <cmd>setlocal spell!<cr>

"  Informations {{{2

nnoremap <f3>ig <cmd>call library#highlight_group()<cr>

"  Shell {{{2

nnoremap \s <cmd>tabe ~/racine/snippet/hist/$OPERASYS.zsh<cr>
nnoremap \S <cmd>w! >> ~/racine/snippet/hist/$OPERASYS.zsh<cr>
nnoremap \h <cmd>tabe ~/racine/hist/zsh/$HOST<cr>

" Journal de bord {{{2

nnoremap <f3>L <cmd>tabe ~/racine/omni/log/captain<cr>

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

" Présentation {{{2

" Numérotation des lignes {{{3

nnoremap <silent> <D-l> <cmd>call library#toggle_relative_linum()<cr>

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

set termguicolors

nnoremap <f3>l <cmd>set cursorline!<cr>

" Fonte de caractères {{{3

" dans neovim-qt

nnoremap <f3>f :GuiFont DejaVu Sans Mono:h12

" Émulateur de terminal {{{2

nnoremap <C-!> <cmd>call library#terminal()<cr>

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

" abbreviations {{{1

" Abréviations {{{2

"iab cad c’est-à-dire

"iab dd <c-r>=strftime("%H : %M %a %d %b %Y")<cr>

" Remplacé par le plugin cmdalias

"cab hh tab help
"cab dd <c-r>=strftime("[=] %A %d %B %Y  (o) %H : %M : %S  %z")<cr>

" Fautes de frappe courantes {{{2

iab totu tout
iab sosu sous

" display {{{1

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

"  Caractères non imprimables {{{2

"set display+=uhex

"  Mise en évidence {{{2

" Souligne une colonne après textwidth

"if exists("&colorcolumn")
	"set colorcolumn=+1
"endif

"  Correspondances {{{2

set matchpairs=(:),{:},[:],<:>

" Affiche les correspondances entre
" (), [], {}, ...

set showmatch

" Fréquence de showmatch

set matchtime=7

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

"  Tabulation et espaces de fin de lignes {{{2

" non breakable space : ctrl-k puis <space><space>

set list

set listchars=

"set listchars+=tab:>\ ,nbsp:▒
"set listchars+=tab:>\ ,nbsp:‗

set listchars+=tab:>\ ,nbsp:_
set listchars+=precedes:❮,extends:❯
set listchars+=conceal:Δ

"  Curseur {{{2

" Essaye de garder le curseur dans la même colonne
" quand on change de ligne

set nostartofline

" Mets en évidence la ligne courante

"set cursorline

" Mets en évidence la colonne courante

"set cursorcolumn

" Mise en évidence {{{2

"set colorcolumn=+1

" Splits {{{2

set splitbelow
set splitright

"  Messages {{{2

" Rapport à partir de 0 lignes modifiées,
" autrement dit tout le temps

set report=0

" Messages courts

set shortmess=
"set shortmess=a

set showmode

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
	set statusline+=\ %=
	set statusline+=\ \ col\ %{g:colors_name}
	set statusline+=\ \ \ \ |
	set statusline+=%<
endif

"  Zone de commande {{{2

" Hauteur

set cmdheight=3

" Conceal {{{2

"set conceallevel=1

"set concealcursor=i

" Voir aussi ~/racine/config/edit/neovim/after/syntax/html/conceal/neovim

" Couleurs dans le terminal {{{2

if has("termguicolors")
	set termguicolors
endif

" syntax {{{1

"  Activation {{{2

syntax enable

"  Options {{{2

"syntax sync fromstart

syntax sync minlines=7
syntax sync maxlines=84

" :ex commandline {{{1

" Hauteur de la fenêtre d'historique
set cmdwinheight=15

" Édition de la ligne de commande avec l’historique dans un tampon
" Défaut = <C-F>

"set cedit=<Esc>
"set cedit=<Ins>

" Prévisualisation du résultat {{{2

set inccommand=split

" Commandes {{{2

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" terminal {{{1

" filetypes {{{1

filetype on
filetype plugin on
filetype indent on

" themes {{{1

colorscheme golden-night
"colorscheme Atelier_ForestLight
"colorscheme Atelier_HeathDark
"colorscheme Atelier_SeasideLight
"colorscheme zazen

"  {{{ Historique

set shada=
	\!,
	\f1,
	\h,
	\<12,
	\s12,
	\'120,
	\:10000,
	\/10000,
	\@10000,
	\n~/racine/session/neovim/main.shada

"set shadafile=~/racine/session/neovim/main.shada

" Remplacé par wheel mru
" 	\%30,

" Nombre par défaut pour lignes de commande,
" recherches, nombre de lignes d’entrée

set history=10000

" Lua {{{1

"source ~/racine/config/edit/neovim/meta.lua
lua require('meta')
