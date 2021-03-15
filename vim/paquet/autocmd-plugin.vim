" vim: set filetype=vim :

if ! has("autocmd")
	finish
endif

" Plugins standard

" {{{ Netrw

augroup ExtensionNetRW
	au!
	au FileType netrw nmap <buffer> <kEnter> <Enter>
augroup END

" }}}

" ------------------------------------

" Wheel {{{1

autocmd VimEnter * call wheel#void#init()
autocmd VimLeave * call wheel#void#exit()
autocmd User WheelAfterJump norm zMzx
autocmd BufEnter * call wheel#projection#follow()
autocmd BufLeave * call wheel#vortex#update()
autocmd BufRead * call wheel#attic#record()
autocmd TextYankPost * call wheel#codex#add()

" }}}1

" Sneak {{{1

autocmd ColorScheme * hi Sneak
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

autocmd ColorScheme * hi SneakScope
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

" }}}1

" Vim Markdown Folding {{{1

au BufEnter *.md setlocal foldmethod=expr

" }}}1
