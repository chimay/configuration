" vim: set filetype=vim:

" Plugin list {{{1

if exists('g:loaded_minpac')

	call minpac#init()

	" Plugins dans start {{{2

	" Personnels

	call minpac#add('chimay/wheel', { 'type' : 'start' })

	" Others

	call minpac#add('skywind3000/asyncrun.vim', { 'type' : 'start' })

	call minpac#add('tpope/vim-repeat', { 'type' : 'start' })

	call minpac#add('gelguy/wilder.nvim', { 'type' : 'start' })

	call minpac#add('vim-scripts/CmdlineComplete', { 'type' : 'start' })
	call minpac#add('vim-scripts/utl.vim', { 'type' : 'start' })

	call minpac#add('justinmk/vim-sneak', { 'type' : 'start' })

	call minpac#add('SirVer/ultisnips', { 'type' : 'start' })
	call minpac#add('jiangmiao/auto-pairs', { 'type' : 'start' })

	call minpac#add('machakann/vim-highlightedyank', { 'type' : 'start' })

	call minpac#add('mbbill/undotree', { 'type' : 'start' })

	call minpac#add('tommcdo/vim-exchange', { 'type' : 'start' })
	call minpac#add('junegunn/vim-easy-align', { 'type' : 'start' })
	" requis par LineJuggler
	call minpac#add('vim-scripts/ingo-library', { 'type' : 'start' })
	call minpac#add('vim-scripts/LineJuggler', { 'type' : 'start' })
	call minpac#add('vim-scripts/LineJugglerCommands', { 'type' : 'start' })

	call minpac#add('kana/vim-textobj-user', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-entire', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-fold', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-function', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-indent', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-line', { 'type' : 'start' })
	call minpac#add('thinca/vim-textobj-comment', { 'type' : 'start' })

	call minpac#add('wellle/targets.vim', { 'type' : 'start' })

	call minpac#add('nishigori/increment-activator', { 'type' : 'start' })

	call minpac#add('tomtom/tcomment_vim', { 'type' : 'start' })
	call minpac#add('scrooloose/nerdcommenter', { 'type' : 'start' })

	call minpac#add('vim-scripts/VisIncr', { 'type' : 'start' })
	call minpac#add('tpope/vim-surround', { 'type' : 'start' })

	call minpac#add('vim-scripts/DeleteTrailingWhitespace', { 'type' : 'start' })

	call minpac#add('justinmk/vim-dirvish', { 'type' : 'start' })

	call minpac#add('nvim-treesitter/nvim-treesitter', { 'type' : 'start' })

	call minpac#add('dhruvasagar/vim-table-mode', { 'type' : 'start' })

	call minpac#add('kristijanhusak/orgmode.nvim', { 'type' : 'start' })

	call minpac#add('masukomi/vim-markdown-folding', { 'type' : 'start' })
	call minpac#add('mzlogin/vim-markdown-toc', { 'type' : 'start' })

	" Calculatrice
	call minpac#add('arecarn/crunch.vim', { 'type' : 'start' })

	" }}}2

	" Plugins dans opt {{{2

	call minpac#add('chrisbra/NrrwRgn', { 'type' : 'opt' })
	call minpac#add('kana/vim-submode', { 'type' : 'opt' })
	call minpac#add('liuchengxu/vim-which-key', { 'type' : 'opt' })
	call minpac#add('stefandtw/quickfix-reflector.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/YankRing.vim', { 'type' : 'opt' })

	call minpac#add('machakann/vim-textobj-delimited', { 'type' : 'opt' })
	call minpac#add('thinca/vim-textobj-between', { 'type' : 'opt' })

	" requis par cmdalias
	call minpac#add('coot/CRDispatcher', { 'type' : 'opt' })
	call minpac#add('coot/cmdalias_vim', { 'type' : 'opt' })

	" }}}2

endif

" }}}1

" Functions {{{1

if ! exists('*Pack_init')
	fun! Pack_init ()
		if ! exists('*minpac#init')
			packadd minpac
		endif
		source ~/racine/config/edit/neovim/paquet/minpac.vim
	endfun
endif

if ! exists('*Pack_update')
	fun! Pack_update ()
		call Pack_init ()
		call minpac#update()
	endfun
endif

if ! exists('*Pack_clean')
	fun! Pack_clean ()
		call Pack_init ()
		call minpac#clean()
	endfun
endif

if ! exists('*Pack_status')
	fun! Pack_status ()
		call Pack_init ()
		call minpac#status()
	endfun
endif

" }}}1

" Commands {{{1

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads this file to register
" the information of plugins, then performs the task.

command! PackUpdate call Pack_update()
command! PackClean  call Pack_clean()
command! PackStatus  call Pack_status()

nnoremap <F12>u <cmd>PackUpdate<cr>
nnoremap <F12>c <cmd>PackClean<cr>
nnoremap <F12>s <cmd>PackStatus<cr>

" }}}1
