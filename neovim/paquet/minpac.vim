" vim: set filetype=vim:

if exists('g:loaded_minpac')

	call minpac#init()

	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Plugins dans start
	" ------------------------------

	" Personnels
	call minpac#add('chimay/wheel', { 'type' : 'start' })

	call minpac#add('skywind3000/asyncrun.vim', { 'type' : 'start' })

	call minpac#add('tpope/vim-repeat', { 'type' : 'start' })

	call minpac#add('urbainvaes/vim-ripple', { 'type' : 'start' })

	call minpac#add('vim-scripts/CmdlineComplete', { 'type' : 'start' })
	call minpac#add('vim-scripts/utl.vim', { 'type' : 'start' })

	call minpac#add('justinmk/vim-sneak', { 'type' : 'start' })

	call minpac#add('chrisbra/NrrwRgn', { 'type' : 'start' })

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

	call minpac#add('kana/vim-textobj-entire', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-fold', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-function', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-indent', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-line', { 'type' : 'start' })
	call minpac#add('kana/vim-textobj-user', { 'type' : 'start' })
	call minpac#add('machakann/vim-textobj-delimited', { 'type' : 'start' })
	call minpac#add('thinca/vim-textobj-between', { 'type' : 'start' })
	call minpac#add('thinca/vim-textobj-comment', { 'type' : 'start' })

	call minpac#add('nishigori/increment-activator', { 'type' : 'start' })

	call minpac#add('tomtom/tcomment_vim', { 'type' : 'start' })
	call minpac#add('scrooloose/nerdcommenter', { 'type' : 'start' })

	call minpac#add('vim-scripts/VisIncr', { 'type' : 'start' })
	call minpac#add('tpope/vim-surround', { 'type' : 'start' })

	call minpac#add('vim-scripts/DeleteTrailingWhitespace', { 'type' : 'start' })

	call minpac#add('justinmk/vim-dirvish', { 'type' : 'start' })

	call minpac#add('vimwiki/vimwiki', { 'type' : 'start' })
	call minpac#add('masukomi/vim-markdown-folding', { 'type' : 'start' })
	call minpac#add('mzlogin/vim-markdown-toc', { 'type' : 'start' })

	" Calculatrice
	call minpac#add('arecarn/crunch.vim', { 'type' : 'start' })

	" Plugins dans opt
	" ------------------------------

	call minpac#add('stefandtw/quickfix-reflector.vim', { 'type' : 'opt' })

	call minpac#add('liuchengxu/vim-which-key', { 'type' : 'opt' })

	call minpac#add('nvim-lua/popup.nvim', { 'type' : 'opt' })
	call minpac#add('nvim-lua/plenary.nvim', { 'type' : 'opt' })
	call minpac#add('nvim-telescope/telescope.nvim', { 'type' : 'opt' })

	" requis par cmdalias
	call minpac#add('coot/CRDispatcher', { 'type' : 'opt' })
	call minpac#add('coot/cmdalias_vim', { 'type' : 'opt' })

	call minpac#add('hauleth/vim-backscratch', { 'type' : 'opt' })

	call minpac#add('jceb/vim-orgmode', { 'type' : 'opt' })
	call minpac#add('vimoutliner/vimoutliner', { 'type' : 'opt' })

	call minpac#add('Shougo/denite.nvim', { 'type' : 'opt' })
	call minpac#add('Shougo/defx.nvim', { 'type' : 'opt' })
	call minpac#add('Shougo/deol.nvim', { 'type' : 'opt' })
	call minpac#add('Shougo/deoplete.nvim', { 'type' : 'opt' })
	call minpac#add('Shougo/neobundle-vim-recipes', { 'type' : 'opt' })
	call minpac#add('Shougo/neomru.vim', { 'type' : 'opt' })
	call minpac#add('Shougo/neoyank.vim', { 'type' : 'opt' })
	call minpac#add('Shougo/unite-outline', { 'type' : 'opt' })
	call minpac#add('Shougo/unite.vim', { 'type' : 'opt' })
	call minpac#add('Shougo/vimfiler.vim', { 'type' : 'opt' })
	call minpac#add('arecarn/selection.vim', { 'type' : 'opt' })
	call minpac#add('brettanomyces/nvim-terminus', { 'type' : 'opt' })
	call minpac#add('chrisbra/vim_faq', { 'type' : 'opt' })
	call minpac#add('dbeniamine/vim-mail', { 'type' : 'opt' })
	call minpac#add('dhruvasagar/vim-table-mode', { 'type' : 'opt' })
	call minpac#add('eugen0329/vim-esearch', { 'type' : 'opt' })
	call minpac#add('flazz/vim-colorschemes', { 'type' : 'opt' })
	call minpac#add('cideM/yui', { 'type' : 'opt' })
	call minpac#add('francoiscabrol/ranger.vim', { 'type' : 'opt' })
	call minpac#add('godlygeek/tabular', { 'type' : 'opt' })
	call minpac#add('hewes/unite-gtags', { 'type' : 'opt' })
	call minpac#add('honza/vim-snippets', { 'type' : 'opt' })
	call minpac#add('jamessan/vim-gnupg', { 'type' : 'opt' })
	call minpac#add('kana/vim-submode', { 'type' : 'opt' })
	call minpac#add('kassio/neoterm', { 'type' : 'opt' })
	call minpac#add('kmnk/vim-unite-giti', { 'type' : 'opt' })
	call minpac#add('kopischke/unite-spell-suggest', { 'type' : 'opt' })
	call minpac#add('maralla/completor.vim', { 'type' : 'opt' })
	call minpac#add('mg979/vim-visual-multi', { 'type' : 'opt' })
	call minpac#add('mhinz/vim-grepper', { 'type' : 'opt' })
	call minpac#add('neomake/neomake', { 'type' : 'opt' })
	call minpac#add('nixprime/cpsm', { 'type' : 'opt' })
	call minpac#add('osyo-manga/unite-quickfix', { 'type' : 'opt' })
	call minpac#add('rbgrouleff/bclose.vim', { 'type' : 'opt' })
	call minpac#add('rhysd/open-pdf.vim', { 'type' : 'opt' })
	call minpac#add('simnalamburt/vim-mundo', { 'type' : 'opt' })
	call minpac#add('sjl/gundo.vim', { 'type' : 'opt' })
	call minpac#add('sk1418/QFGrep', { 'type' : 'opt' })
	call minpac#add('t9md/vim-textmanip', { 'type' : 'opt' })
	call minpac#add('tacroe/unite-mark', { 'type' : 'opt' })
	call minpac#add('thinca/vim-visualstar', { 'type' : 'opt' })
	call minpac#add('tomtom/tlib_vim', { 'type' : 'opt' })
	call minpac#add('tpope/vim-abolish', { 'type' : 'opt' })
	call minpac#add('tpope/vim-eunuch', { 'type' : 'opt' })
	call minpac#add('tpope/vim-unimpaired', { 'type' : 'opt' })
	call minpac#add('tsukkee/unite-help', { 'type' : 'opt' })
	call minpac#add('tsukkee/unite-tag', { 'type' : 'opt' })
	call minpac#add('ujihisa/unite-locate', { 'type' : 'opt' })
	call minpac#add('vifm/neovim-vifm', { 'type' : 'opt' })
	call minpac#add('vim-ctrlspace/vim-ctrlspace', { 'type' : 'opt' })
	call minpac#add('vim-scripts/LogiPat', { 'type' : 'opt' })
	call minpac#add('vim-scripts/YankRing.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/rcs.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/vcscommand.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/vis', { 'type' : 'opt' })
	call minpac#add('vim-scripts/visSum.vim', { 'type' : 'opt' })
	call minpac#add('vim-scripts/visualrepeat', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-husk', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-line', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-space', { 'type' : 'opt' })
	call minpac#add('vim-utils/vim-vertical-move', { 'type' : 'opt' })
	call minpac#add('voldikss/vim-floaterm', { 'type' : 'opt' })
	call minpac#add('wellle/targets.vim', { 'type' : 'opt' })
	call minpac#add('yaroot/vissort', { 'type' : 'opt' })
	call minpac#add('yuki-ycino/fzf-preview.vim', { 'type' : 'opt' })

endif

" Commandes

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.

if ! exists('*Pack_init')
	fun Pack_init ()
		if ! exists('*minpac#init')
			packadd minpac
		endif
		source ~/racine/config/edit/neovim/paquet/minpac.vim
	endfu
endif

if ! exists('*Pack_update')
	fun Pack_update ()
		call Pack_init ()
		call minpac#update()
	endfu
endif

if ! exists('*Pack_clean')
	fun Pack_clean ()
		call Pack_init ()
		call minpac#clean()
	endfu
endif

if ! exists('*Pack_status')
	fun Pack_status ()
		call Pack_init ()
		call minpac#status()
	endfu
endif

command! PackUpdate call Pack_update()
command! PackClean  call Pack_clean()
command! PackStatus  call Pack_status()

nnoremap <F12>u :PackUpdate<cr>
nnoremap <F12>c :PackClean<cr>
nnoremap <F12>s :PackStatus<cr>
