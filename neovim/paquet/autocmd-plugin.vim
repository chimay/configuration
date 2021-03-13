" vim: set filetype=vim :

if !has("autocmd")
	finish
endif

" Wheel {{{1

augroup Wheel
	autocmd VimEnter * call wheel#void#init()
	autocmd VimLeave * call wheel#void#exit()
	"autocmd User WheelAfterJump echomsg 'Jump'
	autocmd User WheelAfterJump normal! zMzx
	autocmd BufEnter * call wheel#projection#follow()
	autocmd BufLeave * call wheel#vortex#update()
	autocmd BufRead * call wheel#attic#record()
	autocmd TextYankPost * call wheel#codex#add()
augroup END

" }}}1

" Sneak {{{1

autocmd ColorScheme * hi Sneak
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

autocmd ColorScheme * hi SneakScope
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

" }}}1

" Vimwiki {{{1

autocmd BufRead *.wiki nmap <buffer> \we :Vimwiki2HTML<cr>
autocmd BufRead *.wiki nmap <buffer> \wc :VimwikiTOC<cr>

" }}}1

" Vim Markdown Folding {{{1

au BufEnter *.md setlocal foldmethod=expr

" }}}1
