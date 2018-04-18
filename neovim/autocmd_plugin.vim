" vim: set filetype=vim :

" {{{ Neoyank

autocmd BufWinEnter \(*.asc\|*.gpg\) let g:neoyank_disable = 1

" }}}

" Sneak {{{1

autocmd ColorScheme * hi Sneak
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

autocmd ColorScheme * hi SneakScope
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

" }}}1
