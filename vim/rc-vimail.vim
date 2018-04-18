" vim: set filetype=vim :

set nocompatible

syntax enable

set runtimepath+=~/racine/config/edit/vim
set runtimepath+=~/racine/plugin/manager/vim-plugged/vim-fixkey

set backspace=indent,eol,start

set foldmethod=marker

set wildmenu
set wildmode=list:full

set wildchar=<tab>
set wildcharm=<c-t>

set completeopt=menu,preview

set complete=.,w,b,u,t,i,s,k

set whichwrap=<,>,[,],~,b,s,h,l

set infercase

set number

set hidden
set bufhidden=hide

set hlsearch

set number
set relativenumber

set linespace=5

set wrap

set display+=lastline

set linebreak
set showbreak=┅
set breakat=" ^I!@*-+;:,./?"

set matchpairs=(:),{:},[:],<:>

set showmatch

set matchtime=7

set scroll=12
set sidescroll=12
set scrolloff=7
set sidescrolloff=84

set listchars=tab:▶\ ,eol:╋
set listchars+=trail:\ ,nbsp:▒
set listchars+=precedes:←,extends:→

set nostartofline

set report=0

set ruler

set showcmd

set history=1234

set laststatus=2

set cmdheight=4

colo personnel

nnoremap <m-t> :tabnew<cr>

nnoremap <S-Left> gT
nnoremap <S-Right> gt

nnoremap \s :tabe ~/racine/snippet/shell/hist-$OPERASYS.zsh<cr>
nnoremap \w :w! >> ~/racine/snippet/shell/hist-$OPERASYS.zsh<cr>

nnoremap \h :tabe ~/racine/hist/zsh/$HOST<cr>

set textwidth=72
set formatprg='fmt'

set foldmethod=manual

set filetype=mail

" {{{ Autocommandes

augroup FichiersCourriel

	au!

	" Lignes consécutives vides --> une seule ligne vide
	" ------------------------------------

	au Filetype mail g/^$/,/./-j

	" Va à la première ligne vide
	" ------------------------------------

	au BufRead mutt-* call mail#bibliotheque#ligneEdition()

	" Efface les signatures citées
	" ------------------------------------

	au Filetype mail nnoremap ,mds :call mail#bibliotheque#supprimeSignaturesCitees()<cr>

	" Efface les > des lignes vides
	" ------------------------------------

	au Filetype mail nnoremap ,mdel :%s/^>\s*$//e<cr>
	au Filetype mail nnoremap ,mgdel :g/^>\s*$/d<cr>

augroup END

" }}}
