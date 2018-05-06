" vim: set filetype=vim:

" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.

if &compatible

  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.

  set nocompatible
endif

if exists('*minpac#init')

	" Minpac is loaded.

	call minpac#init()

	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Plugins dans start

	call minpac#add('drmikehenry/vim-fixkey', { 'type' : 'start' })

	call minpac#add('Shougo/denite.nvim', { 'type' : 'start' })
	call minpac#add('Shougo/unite.vim', { 'type' : 'start' })
	call minpac#add('Shougo/neomru.vim', { 'type' : 'start' })
	call minpac#add('Shougo/unite-outline', { 'type' : 'start' })
	call minpac#add('vim-ctrlspace/vim-ctrlspace', { 'type' : 'start' })
	 
	call minpac#add('roxma/vim-hug-neovim-rpc', { 'type' : 'start' })
	call minpac#add('roxma/nvim-yarp', { 'type' : 'start' })
	call minpac#add('Shougo/deoplete.nvim', { 'type' : 'start' })
	call minpac#add('SirVer/ultisnips', { 'type' : 'start' })
	call minpac#add('jiangmiao/auto-pairs', { 'type' : 'start' })
	 
	call minpac#add('vim-scripts/YankRing.vim', { 'type' : 'start' })
	call minpac#add('Shougo/neoyank.vim', { 'type' : 'start' })
	call minpac#add('machakann/vim-highlightedyank', { 'type' : 'start' })

	call minpac#add('kana/vim-textobj-entire', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-fold', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-function', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-indent', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-line', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-user', { 'type' : 'start' })
	call minpac#add('vim-scripts/ingo-library', { 'type' : 'start' })
	call minpac#add('vim-scripts/LineJuggler', { 'type' : 'start' })
	call minpac#add('vim-scripts/LineJugglerCommands', { 'type' : 'start' })

	call minpac#add('nishigori/increment-activator', { 'type' : 'start' })

	call minpac#add('tomtom/tcomment_vim', { 'type' : 'start' })
	call minpac#add('scrooloose/nerdcommenter', { 'type' : 'start' })

	call minpac#add('vim-scripts/utl.vim', { 'type' : 'start' })

	call minpac#add('coot/CRDispatcher', { 'type' : 'start' })
	call minpac#add('coot/cmdalias_vim', { 'type' : 'start' })
	call minpac#add('kana/vim-submode', { 'type' : 'start' })

	" Plugins dans opt

	call minpac#add('Shougo/neobundle-vim-recipes', { 'type' : 'opt' })
	call minpac#add('Shougo/vimfiler.vim', { 'type' : 'opt' })
	call minpac#add('arecarn/crunch.vim', { 'type' : 'opt' })
	call minpac#add('arecarn/selection.vim', { 'type' : 'opt' })
	call minpac#add('chrisbra/NrrwRgn', { 'type' : 'opt' })
	call minpac#add('chrisbra/vim_faq', { 'type' : 'opt' })
	call minpac#add('dbeniamine/vim-mail', { 'type' : 'opt' })
	call minpac#add('dhruvasagar/vim-table-mode', { 'type' : 'opt' })
	call minpac#add('flazz/vim-colorschemes', { 'type' : 'opt' })
	call minpac#add('godlygeek/tabular', { 'type' : 'opt' })
	call minpac#add('hewes/unite-gtags', { 'type' : 'opt' })
	call minpac#add('honza/vim-snippets', { 'type' : 'opt' })
	call minpac#add('jamessan/vim-gnupg', { 'type' : 'opt' })
	call minpac#add('junegunn/vim-easy-align', { 'type' : 'opt' })
	call minpac#add('justinmk/vim-sneak', { 'type' : 'start' })
	call minpac#add('kana/vim-repeat', { 'type' : 'opt' })
	call minpac#add('kmnk/vim-unite-giti', { 'type' : 'opt' })
	call minpac#add('kopischke/unite-spell-suggest', { 'type' : 'opt' })
	call minpac#add('machakann/vim-textobj-delimited', { 'type' : 'opt' })
	call minpac#add('maralla/completor.vim', { 'type' : 'opt' })
	call minpac#add('mbbill/undotree', { 'type' : 'opt' })
	call minpac#add('osyo-manga/unite-quickfix', { 'type' : 'opt' })
	call minpac#add('sk1418/QFGrep', { 'type' : 'opt' })
	call minpac#add('skywind3000/asyncrun.vim', { 'type' : 'opt' })
	call minpac#add('stefandtw/quickfix-reflector.vim', { 'type' : 'opt' })
	call minpac#add('t9md/vim-textmanip', { 'type' : 'opt' })
	call minpac#add('tacroe/unite-mark', { 'type' : 'opt' })
	call minpac#add('thinca/vim-textobj-between', { 'type' : 'opt' })
	call minpac#add('thinca/vim-textobj-comment', { 'type' : 'opt' })
	call minpac#add('thinca/vim-visualstar', { 'type' : 'opt' })
	call minpac#add('tommcdo/vim-exchange', { 'type' : 'opt' })
	call minpac#add('tomtom/tlib_vim', { 'type' : 'opt' })
	call minpac#add('tpope/vim-abolish', { 'type' : 'opt' })
	call minpac#add('tpope/vim-eunuch', { 'type' : 'opt' })
	call minpac#add('tsukkee/unite-help', { 'type' : 'opt' })
	call minpac#add('tsukkee/unite-tag', { 'type' : 'opt' })
	call minpac#add('ujihisa/unite-locate', { 'type' : 'opt' })
	call minpac#add('vim-scripts/CmdlineComplete', { 'type' : 'opt' })
	call minpac#add('vim-scripts/LogiPat', { 'type' : 'opt' })
	call minpac#add('vim-scripts/VisIncr', { 'type' : 'opt' })
	call minpac#add('vim-scripts/rcs.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/vcscommand.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/vis', { 'type' : 'opt' })
	call minpac#add('vim-scripts/visSum.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/visualrepeat', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-husk', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-line', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-space', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-vertical-move', { 'type' : 'opt' })
	call minpac#add('wellle/targets.vim', { 'type' : 'opt' })
	call minpac#add('yaroot/vissort', { 'type' : 'opt' })

endif

" Commandes

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
