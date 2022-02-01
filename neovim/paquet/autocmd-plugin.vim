" vim: set filetype=vim :

if !has("autocmd")
	finish
endif

" Wheel {{{1

augroup wheel
	autocmd!
	autocmd VimEnter * call wheel#void#init()
	autocmd VimLeave * call wheel#void#exit()
	autocmd User WheelUpdate call wheel#vortex#update()
	autocmd User WheelAfterJump silent! normal! zCzO
	autocmd WinEnter * call wheel#projection#follow()
	"autocmd BufRead * call wheel#projection#follow()
	"autocmd BufEnter * call wheel#projection#follow()
	autocmd BufLeave * call wheel#vortex#update()
	autocmd BufRead * call wheel#attic#record()
	autocmd TextYankPost * call wheel#codex#add()
augroup END

" }}}1

" Sneak {{{1

augroup Sneak
	autocmd!
	autocmd ColorScheme * hi Sneak
				\ guifg=black guibg=#5B3C11 gui=NONE
				\ ctermfg=NONE ctermbg=NONE cterm=reverse
	autocmd ColorScheme * hi SneakScope
				\ guifg=black guibg=#5B3C11 gui=NONE
				\ ctermfg=NONE ctermbg=NONE cterm=reverse
augroup END

" }}}1

" Vim Markdown Folding {{{1

au BufEnter *.md setlocal foldmethod=expr

" }}}1
