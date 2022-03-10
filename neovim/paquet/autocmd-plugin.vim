" vim: set filetype=vim :

if !has("autocmd")
	finish
endif

" Packager {{{1

augroup packager_filetype
  autocmd!
  " ---- load optional plugin on given filetypes
  autocmd FileType markdown packadd foltext_vim
  autocmd FileType org packadd foltext_vim
  autocmd FileType markdown packadd vim-markdown-toc
augroup END

" }}}1

" Wheel {{{1

augroup wheel
	autocmd!
	autocmd VimEnter * call wheel#void#init()
	autocmd VimLeave * call wheel#void#exit()
	autocmd User WheelBeforeJump call wheel#vortex#update()
	autocmd User WheelBeforeOrganize call wheel#vortex#update()
	autocmd User WheelBeforeWrite call wheel#vortex#update()
	autocmd BufLeave * call wheel#vortex#update()
	autocmd User WheelAfterJump silent! normal! zCzO
	"autocmd User WheelAfterNative call wheel#projection#follow()
	autocmd WinEnter * call wheel#projection#follow()
	"autocmd BufRead * call wheel#projection#follow()
	"autocmd BufEnter * call wheel#projection#follow()
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

