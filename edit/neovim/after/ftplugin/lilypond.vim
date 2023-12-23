" vim: set ft=vim:

" remove default ftplugin lilypond maps {{{1

silent! unmap <buffer> <F4>
silent! unmap <buffer> <F5>
silent! unmap <buffer> <F6>
silent! unmap <buffer> <F7>
silent! unmap <buffer> <F8>
silent! unmap <buffer> <F9>
silent! unmap <buffer> <F10>
silent! unmap <buffer> <F12>
silent! unmap <buffer> <S-F12>

" custom options {{{1

setlocal commentstring=%%s

" custom maps {{{1

nnoremap <buffer> <f5> <cmd>call library#make_midi()<cr>
