" vim: set filetype=vim :

"  Compatibilité {{{1

set nocompatible

"set cpoptions=aABceFs

" ------------------------------------

" Terminal {{{1

set ttyfast

" Pageur {{{1

set more

" Couper, copier, coller {{{1

"set clipboard=
set clipboard=unnamedplus

"  Environnement {{{1

"  Chemins de recherche des fichiers {{{2

" Permet une recherche récursive avec :find

set path=.,,
"set path=**

"  Système de fichier {{{1

"  Sauvegardes {{{2

set backup

set backupdir=~/racine/varia/backup/vim-lite,.

set backupext=~

set writebackup

set backupskip=/tmp/*,/etc/*,neomutt-*-*-*-*

"  Fichier de récupération en cas de crash {{{2

set swapfile
set directory=~/racine/varia/autosave/vim-lite

"set noswapfile

" Fréquence de sauvegarde
" ------------------------------------

set updatecount=100			" Nombre de caractères
set updatetime=1000			" Millisecondes

"  Annulation {{{1

set undolevels=1234

if exists("&undofile")
	set undofile
	set undoreload=12743
	set undodir=~/racine/varia/undo/vim-lite,.
endif

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

"  Encodage {{{1

set encoding=utf-8

setglobal fileencoding=utf-8
setglobal fileencodings=utf-8

" Disponible avec <C-K> char1 char2

" Backspace {{{2

set backspace=indent,eol,start

" Cette option active l’accès au digraph par char1 <BS> char2

"set digraph

"  Orthographe {{{1

set spelllang=fr,en

set spellsuggest=best

"  Dictionnaire {{{1

" Complétion par dictionnaire et synonymes

" Dictionnaires {{{2

set dictionary+=fr-classique+reforme1990.dic
set dictionary+=en_GB.dic

" Thesaurus (dictionnaires de synonymes) {{{2

" Personnel
set thesaurus+=~/racine/index/dict/spell/synonymes.txt

" Officiel
set thesaurus+=~/racine/index/dict/spell/thes_fr.dat

"  Modes {{{1

set virtualedit=block,onemore
"set virtualedit=block,insert,onemore
"set virtualedit=all

set selection=inclusive

" Lignes d'instructionvim dans
" les fichiers édités
" ------------------------------------

set modeline
set modelines=7

"  Périphériques {{{1

"  Clavier {{{2

" Autorise le passage d'une ligne à l'autre avec les flèches

set whichwrap=<,>,[,],~,b,s,h,l

"  Son {{{2

set visualbell
set noerrorbells

"  Souris {{{2

set mouse=a

set mousefocus
set mousehide					
set mousemodel=extend				" Clic droit modifie sélection
"set mousemodel=popup_setpos		" Clic droit menu
set mouseshape=i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow

"  Recherche {{{1

" Casse {{{2

set hlsearch
set incsearch

" Ignore la casse

set ignorecase

" Recherche intelligente : ignore la casse sauf si	des majuscules sont présentes dans le motif

set smartcase

"  Complétion {{{1

" Fichiers à ignorer {{{2
" ------------------------------------

set wildignore=

set wildignore+=*/.git/*,*/.hg/*,*/.bzr/*,*/_darcs/*,*/.svn/*

set wildignore+=*.pyc,*.elc,*.zwc
set wildignore+=*.aux,*.maf,*.toc,*.ptc*,*.mtc*

set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.wav,*.flac,*.ogg,*.mp3

set suffixes=.bak,~,.o,.h,.info,.swp,.obj

" Casse {{{2
" ------------------------------------

set wildignorecase

"  Complétion en mode insertion {{{2

"set completeopt=menuone,preview
"set completeopt=menuone,longest

set completeopt=menu

set pumheight=12

set complete=.,w,b,u,U,
			\s~/racine/index/dict/spell/synonymes.txt,
			\k~/racine/index/dict/spell/fr-classique+reforme1990.dic,
			\k~/racine/index/dict/spell/en_GB.dic,
			\t,i,d

" Casse intelligente pour les complétions {{{3

set infercase

"  Omnicomplétion {{{3

set omnifunc=syntaxcomplete#Complete

"  Complétion dans la ligne de commande {{{2

set wildmenu

set wildchar=<tab>
set wildcharm=<tab>

set wildoptions=pum,tagfile

" Wildmode {{{3

set wildmode=full

"  Formattage du texte {{{1

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

"  Indentation {{{1

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

"  Pliage {{{1

set foldenable

"  Options {{{2

set foldenable

set foldminlines=1

set foldlevel=0

set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

set foldcolumn=7

set foldtext=library#folding_text()

"  Méthode des marqueurs {{{2

set foldmethod=marker

set foldmarker={{{,}}}

"  Tampons {{{1

set hidden
set bufhidden=hide

"  Onglets {{{1

" Barre d'onglets {{{2

set tabline=%!library#tablabel()

set guitablabel=%N\ %t\ %m

set showtabline=1

"  Regarder les onglets quand on change de tampon

set switchbuf=usetab

"  Maximum d’onglets ouverts

set tabpagemax=50

"  Différences entre fichiers {{{1

set diffopt=
			\filler,
			\context:4,
			\vertical,
			\foldcolumn:2,
			\algorithm:patience,
			\linematch:60

"  Labels, etiquettes {{{1

"  Compilation de fichiers {{{1

set makeprg='make'

set makeef=

"  Maps {{{1

"  Options {{{2

" Temps (en millisecondes)
" avant de considérer un map ambigu comme complet

set timeout

set timeoutlen=12750

set ttimeout

set ttimeoutlen=50

"  Aide {{{2

nnoremap <F1> :tab help<space>
nnoremap <S-F1> :tab helpgrep<space>

" Manuels {{{2

runtime ftplugin/man.vim
packadd! helptoc
nnoremap gm <cmd>call library#manual()<cr>

" Quitter {{{2

nnoremap ZZ :qa<cr>
nnoremap ZQ :qa!<cr>

"  Fichiers {{{2

nnoremap <C-G> <cmd>let @+ = expand("%:p:~")<cr>2<C-G>

nnoremap \n :new <bar> only<cr>
nnoremap \e :e <C-R>=expand('%:p:h') . '/' <CR><C-D>
nnoremap \r :r <C-R>=expand('%:p:h') . '/' <CR><C-D>
nnoremap \g <c-w>v:e <c-r>=expand('%:p:h') . '/Grenier'<cr><cr>G
nnoremap \v :tabe ~/racine/config/edit/vim-lite/main.vim<cr>

command -nargs=? -complete=filetype EditSyntaxPlugin
\ exe 'keepjumps vsplit ~/racine/config/edit/vim-lite/after/syntax/' . (empty(<q-args>) ? &filetype : <q-args>) . '.vim'

nnoremap <f2>s :<c-u>EditSyntaxPlugin<cr>

nnoremap \m <cmd>make -k<cr>
nnoremap \x <cmd>call library#text_to_password()<cr>
nnoremap \X <cmd>call library#password_to_text()<cr>

" Arguments {{{2

nnoremap <f7>a :previous<cr>
nnoremap <f8>a :next<cr>

nnoremap <f7>A :first<cr>
nnoremap <f8>A :last<cr>

" Tampons {{{2

nnoremap <f7>b :bprevious<cr>
nnoremap <f8>b :bnext<cr>

nnoremap <f7>B :bfirst<cr>
nnoremap <f8>B :blast<cr>

nnoremap <m-q> <cmd>bw!<cr>
nnoremap <m-s-q> <cmd>bw! #<cr>

nnoremap <f3>s <cmd>%sort<cr>

" Fenêtres {{{2

" see paquets/preload.vim : vim-tmux-navigator

"nnoremap <c-right> <c-w>l
"nnoremap <c-down>  <c-w>j
"nnoremap <c-up>    <c-w>k
"nnoremap <c-left>  <c-w>h

" Les mouvements directionnels sont aussi accessible via h j k l

nnoremap <m-left>  <c-w><left>
nnoremap <m-right> <c-w><right>
nnoremap <m-up>    <c-w><up>
nnoremap <m-down>  <c-w><down>

nnoremap <s-left>  <c-w><left>
nnoremap <s-right> <c-w><right>
nnoremap <s-up>    <c-w><up>
nnoremap <s-down>  <c-w><down>

"  Onglets {{{2

nnoremap <f3>t <cmd>tabnew<cr>
nnoremap <f3>T :tabedit<space>

nnoremap <f7>T <cmd>tabfirst<cr>
nnoremap <f8>T <cmd>tablast<cr>

nnoremap <f7>t <cmd>tabmove -1<cr>
nnoremap <f8>t <cmd>tabmove +1<cr>

nnoremap <c-s-left> <cmd>tabmove -1<cr>
nnoremap <c-s-right> <cmd>tabmove +1<cr>

nnoremap <F3>= <cmd>call library#equal_windows()<cr>

nnoremap <leader><left> <cmd>call library#win2prev_tab()<cr>
nnoremap <leader><right> <cmd>call library#win2next_tab()<cr>

" Liste quickfix {{{2

nnoremap <f7>q <cmd>cprevious<cr>
nnoremap <f8>q <cmd>cnext<cr>

nnoremap <f7>Q <cmd>cfirst<cr>
nnoremap <f8>Q <cmd>clast<cr>

nnoremap <f7><c-q> <cmd>cpfile<cr>
nnoremap <f8><c-q> <cmd>cnfile<cr>

" Listes locales {{{2

nnoremap <f7>l <cmd>lprevious<cr>
nnoremap <f8>l <cmd>lnext<cr>

nnoremap <f7>L <cmd>lfirst<cr>
nnoremap <f8>L <cmd>llast<cr>

nnoremap <f7><c-l> <cmd>lpfile<cr>
nnoremap <f8><c-l> <cmd>lnfile<cr>

" Anciens fichiers {{{2

" Fichiers dont une marque est présente dans viminfo

" Voir la configuration de la librairie tlib

"nnoremap <m-o> :browse oldfiles<cr>

"  Tags {{{2

nnoremap <f7><m-t> <cmd>tprevious<cr>
nnoremap <f8><m-t> <cmd>tnext<cr>

nnoremap <f7><m-s-t> <cmd>tfirst<cr>
nnoremap <f8><m-s-t> <cmd>tlast<cr>

nnoremap <f3>j <cmd>tj /
nnoremap <f3>J <cmd>tab tj /

"  Informations {{{2

nnoremap <C-G> 2<C-G>

"  Déplacements & Copie {{{2

" Début & Fin de fichier {{{3

nnoremap gg gg0
nnoremap G G$zt

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

inoremap <S-Up> <C-o>gk
inoremap <S-Down> <C-o>gj

" Déplacement de lignes {{{3

" Voir plugin textmanip

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

nnoremap Y y$

"  Copies provenant d’un autre logiciel

nnoremap <f3>p :set paste!<cr>

" Permet le shift-insert fonctionnel comme dans les Xterm

vnoremap <C-Insert> "+y
nnoremap <C-Insert> "+yy
inoremap <C-Insert> <esc>"+yy

snoremap <S-Insert> <C-R>+
vnoremap <S-Insert> c<C-R>+
nnoremap <S-Insert> "+p
inoremap <S-Insert> <C-R>+

"  Annulation {{{2

" <C-G>u entame un nouvel atome d'undo {{{3

inoremap <m-u> <c-g>u

"inoremap <BS> <C-G>u<BS>
"inoremap <Del> <C-G>u<Del>

inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Répétition en mode visuel

vnoremap . :normal .<CR>

"  Pliage {{{2

nnoremap ]] ]z
nnoremap [[ [z

nnoremap <f7>z ]z
nnoremap <f8>z [z

vnoremap <f7>z ]z
vnoremap <f8>z [z

nnoremap <f7>) zjzx]z
nnoremap <f8>( zkzx[z

vnoremap <f7>) zjzx]z
vnoremap <f8>( zkzx[z

nnoremap zo zCzO

"  Complétion {{{2

inoremap <PageUp> <C-P>
inoremap <PageDown> <C-N>

inoremap <expr> <tab> library#smart_tab()

"inoremap <C-Space> <C-X><C-O>
"inoremap <M-Space> <C-X><C-L>

" Ligne de commande {{{2

" Complétion {{{3

cnoremap <C-X><C-A> <C-A>
cnoremap <C-X><C-D> <C-D>
cnoremap <C-X><C-L> <C-L>

" C-D & wildcharm = C-Z

"cnoremap <C-Z> <C-D><C-Z>

" Déplacement {{{3

cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

" Mot suivant / précédent

" cnoremap <C-^> <C-Left>
" cnoremap <C-@> <C-Right>

cnoremap <m-b> <C-Left>
cnoremap <m-f> <C-Right>

" Vers début de ligne

cnoremap <C-A> <C-B>

" Remplacer la ligne par le résultat d’une expression {{{3

"cnoremap <C-@> <C-\>e

" Insérer un élément {{{3

" Répertoire du fichier courant

cnoremap <m-,> <c-r>=expand('%:p:h') . '/'<cr>

" Enlever un élément dans le chemin d’un fichier {{{3

cnoremap <C-BS> <C-\>e(<SID>RemoveLastPathComponent())<CR>

function! s:RemoveLastPathComponent()
  return substitute(getcmdline(), '\%(\\ \|[\\/]\@!\f\)\+[\\/]\=$\|.$', '', '')
endfunction

cmap <m-d> <c-right><c-w>

" Mode ex {{{3

" On en sort par :vi

nnoremap QQ gQ

" Hauteur de la fenêtre de commande {{{3

nnoremap <f3>c :set cmdheight=

" Ligne ou sélection courante {{{3

" Comme commande ex

nnoremap <f3>: <cmd>exe getline(".")<CR>

"  Informations {{{2

nnoremap <f3>ig <cmd>call library#highlight_group()<cr>

" Émulateur de terminal {{{2

nnoremap <C-!> <cmd>call library#terminal()<cr>

set termwinkey=<C-W>

tnoremap <f3>n <c-\><c-n>

"  Shell {{{2

nnoremap \s <cmd>tabe ~/racine/snippet/hist/$OPERASYS.sh<cr>
nnoremap \S <cmd>w! >> ~/racine/snippet/hist/$OPERASYS.sh<cr>
nnoremap \h <cmd>tabe ~/racine/hist/zsh/$HOST<cr>

" Pavé numérique {{{2

nmap <kEnter> <Enter>

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

nnoremap <f3>l :set cursorline!<cr>

"  Présentation {{{1

"  Lignes {{{2

" Numérotation

set number
set relativenumber

set linespace=1

set wrap

set linebreak
set showbreak=┅
set showbreak=↪
set breakat=" ^I!@*-+;:,./?"

"  Caractères non imprimables {{{2

set display=lastline

"  Mise en évidence {{{2

" Souligne une colonne après textwidth
" ------------------------------------

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

set sidescroll=7

" Minimum de lignes visibles à l'écran
" au-dessus et en-dessous du curseur

set scrolloff=7

" Minimum de colonnes visibles à l'écran
" à gauche et à droite du curseur

set sidescrolloff=84

" Saut lorsque le curseur dépasse les limites hauts / bas

set scrolljump=1

"  Tabulation et espaces de fin de lignes {{{2

set list

set listchars=

set listchars+=tab:┆\ ,nbsp:▒
set listchars+=precedes:❮,extends:❯
set listchars+=conceal:Δ

"  Curseur {{{2

" Essaye de garder le curseur dans la même colonne
" quand on change de ligne

set nostartofline

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

set laststatus=2

" Affiche la position du curseur ligne, colonne
" ------------------------------------

set ruler

" Affiche les commandes incomplètes
" ------------------------------------

set showcmd

" Affiche une barre de statut en bas de l'écran
" ------------------------------------

if ! exists("g:colors_name")
	let g:colors_name = ''
endif

if has('statusline')
	set statusline=
	"set statusline+=%#statut#
	set statusline+=\ %.43F
	set statusline+=%(\ %m%)
	set statusline+=%(\ %r%)
	set statusline+=\ \ Tamp\ %n
	set statusline+=%(%a%)
	set statusline+=\ \ %(%{(&filetype==\"\"?\"\":\"Type\")}\ %Y\ %)
	set statusline+=\ \ Enc\ %{(&fenc==\"\"?&enc:&fenc)}
	set statusline+=\ \ Pos
	set statusline+=\ %P\ /\ %l\ x\ %v
	set statusline+=%(%{(virtcol(\'.\')==col(\'.\')?\"\":\"\ /\ \".col(\'.\'))}%)
	set statusline+=\ %=
	set statusline+=\ \ Color\ %{g:colors_name}
	set statusline+=\ \ \ \ |
	set statusline+=%<
endif

"  Zone de commande {{{2

" Hauteur
" ------------------------------------

set cmdheight=3

" Conceal {{{2

"set conceallevel=1

"set concealcursor=i

" Voir aussi ~/racine/config/edit/vim-lite/after/syntax/html/concealvim

" Couleurs dans le terminal {{{2

if has("termguicolors")
	set termguicolors
endif

if &term =~# '^tmux'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"  Syntaxe {{{1

"  Activation {{{2

syntax enable

"  Options {{{2

"syntax sync fromstart

syntax sync minlines=7
syntax sync maxlines=84

" Ligne de commande :ex {{{1

" Édition de la ligne de commande avec l’historique dans un tampon
" Défaut = <C-F>

"set cedit=<Esc>
"set cedit=<Ins>

"  Auto-commandes {{{1

source ~/racine/config/edit/vim-lite/autocommand.vim

"  Types de fichiers {{{1

"filetype plugin indent on

filetype on
filetype plugin on
filetype indent on

"  Thèmes {{{1

colo golden-night

"  Historique {{{1

set viminfo=
	\!,
	\f1,
	\c,
	\h,
	\<12,
	\s12,
	\'60,
	\:7543,
	\/1234,
	\@1234,
	\n~/racine/session/vim-lite/main.info

" Remplacé par neomru
" 	\%30,

" Nombre par défaut pour lignes de commande,
" recherches, nombre de lignes d’entrée

set history=10000

" ------------------------------------

