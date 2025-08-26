" vim: set filetype=vim :

" paths {{{1

" Pas nécessaire : ~/.config/nvim -> ~config/edit/neovim
" Provoque des doublons avec ultisnips
"
"set runtimepath+=~/racine/config/edit/neovim

" avoid to read specific legacy vim conf
set runtimepath-=/usr/share/vim/vimfiles

" load neovim-qt files

set runtimepath+=/usr/share/nvim-qt/runtime

" lilypond {{{2

" interfere with config
"
" filetype off
" set runtimepath+=/usr/share/vim/vimfiles
" filetype on
" syntax on

" plugins needed before config {{{1

packadd matchit

" main {{{1

source ~/racine/config/edit/neovim/main.vim

" auto-commands {{{1

source ~/racine/config/edit/neovim/autocommand.vim

" python {{{1

if ['arch', 'manjaro', 'artix', 'void', 'ubuntu', 'linux']->index($OPERASYS) >= 0
	let g:python3_host_prog = '/bin/python3'
	let g:python_host_prog = '/bin/python2'
elseif $OPERASYS == 'freebsd'
	let g:python3_host_prog = '/usr/local/bin/python3'
	let g:python_host_prog = '/usr/local/bin/python2'
endif

" all remaining plugins {{{1

source ~/racine/config/edit/neovim/paquet/packager.vim
source ~/racine/config/edit/neovim/paquet/preload.vim

" load everything to be able to use some conf functions

packloadall

" plugins autoload functions call have to stand after packloadall

source ~/racine/config/edit/neovim/paquet/postload.vim

" maps replacing plugins ones {{{1

nnoremap <c-left> <c-w>h
nnoremap <c-down> <c-w>j
nnoremap <c-up> <c-w>k
nnoremap <c-right> <c-w>l

nnoremap <c-pageup> gT
nnoremap <c-pagedown> gt

nnoremap <c-home> <cmd>tabfirst<cr>
nnoremap <c-end> <cmd>tablast<cr>

nnoremap <s-pageup> <cmd>tabmove -1<cr>
nnoremap <s-pagedown> <cmd>tabmove +1<cr>

" nnoremap <c-s-pageup> <cmd>tabmove -1<cr>
" nnoremap <c-s-pagedown> <cmd>tabmove +1<cr>

" plugins auto-commands {{{1

source ~/racine/config/edit/neovim/paquet/autocmd-plugin.vim
