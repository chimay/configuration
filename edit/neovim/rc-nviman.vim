" vim: set filetype=vim :

filetype plugin on
syntax on

nnoremap t gg
nnoremap <space> <c-f>
nnoremap b <c-b>
nnoremap u <c-u>
nnoremap d <c-d>

" manpage with table of contents sidebar with neovim
" https://asciinema.org/a/165076
" add to shellrc: export MANPAGER="nvim +set\ filetype=man -"

" augroup manlaunchtoc
"     autocmd!
"     if has('nvim')
"         autocmd FileType man
"             \ call man#show_toc() |
"             \ setlocal laststatus=0 nonumber norelativenumber |
"             \ nnoremap <buffer> l <Enter> |
"             \ wincmd H |
"             \ vert resize 35 |
"             \ wincmd p
"     endif
" augroup end
