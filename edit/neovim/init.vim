" vim: set filetype=vim :

" plugins needed before config {{{1

packadd matchit

" main {{{1

source ~/racine/config/edit/neovim/main.vim

" all remaining plugins {{{1

source ~/racine/config/edit/neovim/paquet/packager.vim
source ~/racine/config/edit/neovim/paquet/preload.vim

" on charge tout dans start, pour pouvoir utiliser certaines fonctions
" de configuration

packloadall

" les appels aux fonctions autoload des plugins
" doivent se situer après packloadall

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

" lua {{{1

source ~/racine/config/edit/neovim/meta.lua
