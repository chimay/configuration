" vim: set filetype=vim:

" Plugin list {{{1

fun! PackagerInit ()
	" Init vim-packager & define plugins
	" ---- init
	packadd vim-packager
	call packager#init ()
	" --- variables
	let always = { 'type': 'start' }
	let optional = { 'type': 'opt' }
	" ---- self
	call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
	" ---- local
	" adds a symlink ~/racine/public/wheel/wheel -> ~/racine/public/wheel, why ?
	"call packager#local('~/racine/public/wheel', always)
	"call packager#local('~/racine/public/organ', always)
	"call packager#local('~/racine/public/vimscript-tricks', always)
	" ---- auto loaded plugins
	"call packager#add('justinmk/vim-sneak', always)
	" -- plugins with deps
	call packager#add('vim-scripts/LineJuggler', {
				\ 'type' : 'start',
				\ 'requires' : ['vim-scripts/ingo-library', 'vim-scripts/LineJugglerCommands']
				\ })
	" ---- optional plugins, loaded on some filetypes
	call packager#add('sayanarijit/xplr.vim', optional)
	call packager#add('mzlogin/vim-markdown-toc', optional)
	call packager#add('vim-latex/vim-latex', optional)
	" ---- optional plugins loaded manually
	"call packager#add('chriszarate/yazi.vim', optional)
	" -- plugins with deps
	" ---- does not work
	" freezes nvim with undo
" 	call packager#add('nvim-treesitter/nvim-treesitter')
" 	call packager#add('nvim-orgmode/orgmode')
endfun

" Functions {{{1

fun! PackagerInstall (...)
	call PackagerInit ()
	call call('packager#install', a:000)
endfun

fun! PackagerUpdate (...)
	call PackagerInit ()
	call call('packager#update', a:000)
endfun

fun! PackagerClean ()
	call PackagerInit ()
	call packager#clean()
endfun

fun! PackagerStatus ()
	call PackagerInit ()
	call packager#status()
endfun

" Commands {{{1

command! -nargs=* PackagerInstall call PackagerInstall(<f-args>)
command! -nargs=* PackagerUpdate  call PackagerUpdate(<f-args>)
command! -bar PackagerClean   call PackagerClean()
command! -bar PackagerStatus  call PackagerStatus()

nnoremap <F12>i <cmd>PackagerInstall<cr>
nnoremap <F12>u <cmd>PackagerUpdate<cr>
nnoremap <F12>c <cmd>PackagerClean<cr>
nnoremap <F12>s <cmd>PackagerStatus<cr>
