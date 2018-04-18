" vim: set filetype=vim :

" {{{ Documentation

"    " Make sure you use single quotes
"
"    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"    Plug 'junegunn/vim-easy-align'
"
"    " Any valid git URL is allowed
"    Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"    " Group dependencies, vim-snippets depends on ultisnips
"    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"    " On-demand loading
"    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"    Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"    " Using a non-master branch
"    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"    " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"    Plug 'fatih/vim-go', { 'tag': '*' }
"
"    " Plugin options
"    Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"    " Plugin outside ~/.vim/plugged with post-update hook
"    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"    " Unmanaged plugin (manually installed and updated)
"    Plug '~/my-prototype-plugin'

" }}}

call plug#begin('~/racine/plugin/manager/plugged')

let g:plug_threads = 7

" ------------------------------

" {{{ Libraries

" Il faut placer les librairies avant les autres plugins
" pour éviter que certains de ceux-ci ne croient à tort
" que la librairie n’est pas installée

" Objets texte

Plug 'kana/vim-textobj-user'

" Pour tcomment_vim

Plug 'tomtom/tlib_vim'

" Pour cmdalias

Plug 'coot/CRDispatcher'

" Pour crunch

Plug 'arecarn/selection.vim'

" Pour LineJuggler

Plug 'vim-scripts/ingo-library'

" }}}

" ------------------------------

" {{{ Aide

Plug 'chrisbra/vim_faq'

" }}}

" {{{ Gui

" Aussi contenu dans neovim-qt

"Plug 'equalsraf/neovim-gui-shim'

" }}}

" {{{ Exploration

Plug 'Shougo/denite.nvim'

Plug 'Shougo/unite.vim'

Plug 'ujihisa/unite-locate'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'hewes/unite-gtags'
Plug 'tsukkee/unite-help'
Plug 'osyo-manga/unite-quickfix'
Plug 'tacroe/unite-mark'
Plug 'tsukkee/unite-tag'

Plug 'Shougo/denite.nvim'
Plug 'Shougo/defx.nvim'
Plug 'Shougo/deol.nvim'

Plug 'vim-ctrlspace/vim-ctrlspace', { 'as': 'ctrlspace' }

Plug 'junegunn/fzf', { 'do' : './install --all'}
Plug 'junegunn/fzf.vim'

" }}}

" {{{ Déplacement & Copie

Plug 't9md/vim-textmanip'

Plug 'vim-scripts/LineJuggler'
Plug 'vim-scripts/LineJugglerCommands'

Plug 'tommcdo/vim-exchange'

Plug 'vim-utils/vim-vertical-move'

" }}}

" {{{ Copier & Coller

Plug 'Shougo/neoyank.vim'

Plug 'vim-scripts/YankRing.vim'

" }}}

" {{{ Complétion

Plug 'Shougo/deoplete.nvim'

Plug 'vim-scripts/CmdlineComplete'

" }}}

" {{{ Bouts de codes (abrev, snippets, bits, skeletons, ...)

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'tpope/vim-abolish', { 'on' : 'Abolish' }

" }}}

" {{{ Orthographe

Plug 'kopischke/unite-spell-suggest'

" }}}

" {{{ Objets texte

Plug 'wellle/targets.vim'

Plug 'thinca/vim-textobj-between'
Plug 'machakann/vim-textobj-delimited'
Plug 'thinca/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'

Plug 'vim-utils/vim-line'
Plug 'vim-utils/vim-space'

" }}}

" {{{ Paires : parenthèses, crochets, accolades, etc

Plug 'tpope/vim-surround'

" Correspondance

Plug 'jiangmiao/auto-pairs'

" }}}

" {{{ Recherche & Remplacement

Plug 'eugen0329/vim-esearch'

Plug 'mhinz/vim-grepper'

Plug 'stefandtw/quickfix-reflector.vim'

Plug 'sk1418/QFGrep'

Plug 'justinmk/vim-sneak'

Plug 'vim-scripts/LogiPat'

" }}}

" Multiples curseurs {{{1

"Plug 'terryma/vim-multiple-cursors'

" }}}1

" {{{ Automatisation

Plug 'kana/vim-repeat'

" }}}

" {{{ Commentaires

Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdcommenter'

" }}}

" {{{ Espaces, tabs, fins de lignes, ...

Plug 'vim-scripts/DeleteTrailingWhitespace'

" }}}

" {{{ Alignement

Plug 'godlygeek/tabular', { 'on' : 'Tabularize' }

Plug 'junegunn/vim-easy-align'

" }}}

" {{{ Tableaux

Plug 'dhruvasagar/vim-table-mode', { 'on' : 'TableModeToggle' }

" }}}

" {{{ Tri

Plug 'yaroot/vissort'

" }}}

" {{{ Filtres

" 'NR' cause des problèmes avec airline

Plug 'chrisbra/NrrwRgn', { 'on' : 'NarrowRegion' }

" }}}

" {{{ Annulation

Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle' }

" }}}

" {{{ Contrôle de version

Plug 'vim-scripts/rcs.vim'

Plug 'vim-scripts/vcscommand.vim'

Plug 'kmnk/vim-unite-giti'

" }}}

" {{{ Modes

Plug 'coot/cmdalias_vim'

Plug 'vim-utils/vim-husk'

Plug 'vim-scripts/vis'
Plug 'vim-scripts/visualrepeat'
Plug 'thinca/vim-visualstar'

Plug 'kana/vim-submode'

" }}}

" {{{ Liens

Plug 'vim-scripts/utl.vim', { 'on' : 'Utl' }

" }}}

" {{{ Calcul

Plug 'arecarn/crunch.vim', { 'on' : 'Crunch' }

Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/visSum.vim'
Plug 'nishigori/increment-activator'

" }}}

" {{{ Terminal

Plug 'kassio/neoterm'

Plug 'neomake/neomake'

Plug 'brettanomyces/nvim-terminus'

" }}}

" {{{ Shell

Plug 'tpope/vim-eunuch'

" }}}

" {{{ Système de fichiers

Plug 'justinmk/vim-dirvish'

Plug 'vifm/neovim-vifm'

" }}}

" {{{ Pages de manuel

Plug 'vim-utils/vim-man'

" }}}

" {{{ Documents

Plug 'vim-pandoc/vim-pandoc', { 'on' : 'Pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax'

" }}}

" {{{ Crypte

Plug 'jamessan/vim-gnupg'

" }}}

" {{{ Thèmes

"Plug 'flazz/vim-colorschemes'

Plug 'chriskempson/base16-vim'

" }}}

" {{{ Organisation

Plug 'blindFS/vim-taskwarrior'

" }}}

" {{{ Sans distraction

Plug 'junegunn/goyo.vim', { 'on' : 'Goyo' }

Plug 'junegunn/limelight.vim', { 'on' : 'Limelight' }

" }}}

" {{{ Divers

Plug 'tpope/vim-unimpaired'

" }}}

" ------------------------------

" Add plugins to &runtimepath

call plug#end()
