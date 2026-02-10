" vim: set ft=vim fdm=indent iskeyword&:

if ! has("autocmd")
	finish
endif

augroup filetype-packages
	" ---- load optional plugin on given filetypes
	autocmd!
	"autocmd FileType markdown packadd vim-markdown-toc
	autocmd BufReadPre **.md packadd vim-markdown-toc
	autocmd BufReadPre **.tex packadd vim-latex
augroup END

" augroup torustree
" 	autocmd!
" 	autocmd VimEnter * call torustree#void#init()
" 	autocmd VimLeave * call torustree#void#exit()
" 	autocmd User TorustreeBeforeJump call torustree#vortex#update()
" 	autocmd User TorustreeBeforeOrganize call torustree#vortex#update()
" 	autocmd User TorustreeBeforeWrite call torustree#vortex#update()
" 	autocmd BufLeave * call torustree#vortex#update()
" 	autocmd BufLeave * call torustree#caduceus#update_window()
" 	autocmd User TorustreeAfterJump silent! normal! zCzO
" 	"autocmd User TorustreeAfterNative call torustree#projection#follow()
" 	autocmd WinEnter * call torustree#projection#follow()
" 	"autocmd BufRead * call torustree#projection#follow()
" 	"autocmd BufEnter * call torustree#projection#follow()
" 	autocmd BufRead * call torustree#attic#record()
" 	autocmd TextYankPost * call torustree#codex#add()
" 	" overwrite generic <cr> mapping
" 	"autocmd filetype torustree nnoremap <buffer> <cr> <cr>
" augroup END

augroup wheel
	autocmd!
	autocmd VimEnter * call wheel#void#init()
	autocmd VimLeave * call wheel#void#exit()
	autocmd User WheelBeforeJump call wheel#vortex#update()
	autocmd User WheelBeforeOrganize call wheel#vortex#update()
	autocmd User WheelBeforeWrite call wheel#vortex#update()
	autocmd BufLeave * call wheel#vortex#update()
	autocmd BufLeave * call wheel#caduceus#update_window()
	autocmd User WheelAfterJump silent! normal! zCzO
	"autocmd User WheelAfterNative call wheel#projection#follow()
	autocmd WinEnter * call wheel#projection#follow()
	"autocmd BufRead * call wheel#projection#follow()
	"autocmd BufEnter * call wheel#projection#follow()
	autocmd BufRead * call wheel#attic#record()
	autocmd TextYankPost * call wheel#codex#add()
	" overwrite generic <cr> mapping
	"autocmd filetype wheel nnoremap <buffer> <cr> <cr>
augroup END

augroup organ
	autocmd!
	autocmd InsertLeave *.org,*.md call organ#table#update ()
	" ---- enable on some filetypes
	"autocmd filetype text,vim,python call organ#void#enable ()
	" ---- convert links org -> markdown
	"autocmd bufwritepre *.md call organ#vine#org2markdown ()
	"autocmd bufwritepre *.org call organ#vine#markdown2org ()
augroup END

augroup sneak
	autocmd!
	autocmd ColorScheme * hi Sneak
				\ guifg=black guibg=#5B3C11 gui=NONE
				\ ctermfg=NONE ctermbg=NONE cterm=reverse
	autocmd ColorScheme * hi SneakScope
				\ guifg=black guibg=#5B3C11 gui=NONE
				\ ctermfg=NONE ctermbg=NONE cterm=reverse
augroup END

augroup autopairs
	autocmd!
	autocmd filetype vim let b:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '`':'`' }
	autocmd filetype lisp let b:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', '"':'"', '`':'`' }
	autocmd filetype lilypond let b:AutoPairs = { '[':']', '{':'}', '<':'>', '"':'"', '`':'`' }
augroup END
