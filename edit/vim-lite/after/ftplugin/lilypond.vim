" vim: set ft=vim:

" remove default ftplugin lilypond maps {{{1

nunmap <buffer> <F4>
nunmap <buffer> <F5>
nunmap <buffer> <F6>
nunmap <buffer> <F7>
nunmap <buffer> <F8>
nunmap <buffer> <F9>

" custom options {{{1

setlocal commentstring=%%s

" custom maps {{{1

nnoremap <buffer> <f5> <cmd>call library#make_midi()<cr>
