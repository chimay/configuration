" vim: set filetype=vim :

if ! has("autocmd")
	finish
endif

augroup filetype-packages
	" ---- load optional plugin on given filetypes
	autocmd!
	"autocmd FileType markdown packadd vim-markdown-toc
	autocmd FileType tex packadd vim-latex
augroup END

" Wheel {{{1

augroup wheel
	autocmd!
	autocmd VimEnter * call wheel#void#init()
	autocmd VimLeave * call wheel#void#exit()
	autocmd User WheelAfterJump norm zMzx
	autocmd BufEnter * call wheel#projection#follow()
	autocmd BufLeave * call wheel#vortex#update()
	autocmd BufRead * call wheel#attic#record()
	autocmd TextYankPost * call wheel#codex#add()
augroup END


" Sneak {{{1

augroup sneak
	autocmd!
	autocmd ColorScheme * hi Sneak
				\ guifg=black guibg=#5B3C11 gui=NONE
				\ ctermfg=NONE ctermbg=NONE cterm=reverse
	autocmd ColorScheme * hi SneakScope
				\ guifg=black guibg=#5B3C11 gui=NONE
				\ ctermfg=NONE ctermbg=NONE cterm=reverse
augroup END

