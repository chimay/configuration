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
	call packager#add('justinmk/vim-sneak', always)
	call packager#add('jiangmiao/auto-pairs', always)
	call packager#add('Jorengarenar/miniSnip', always)
	call packager#add('kana/vim-textobj-entire', always)
	call packager#add('kana/vim-textobj-fold', always)
	call packager#add('kana/vim-textobj-function', always)
	call packager#add('kana/vim-textobj-indent', always)
	call packager#add('kana/vim-textobj-line', always)
	call packager#add('kana/vim-textobj-user', always)
	call packager#add('machakann/vim-highlightedyank', always)
	call packager#add('nishigori/increment-activator', always)
	call packager#add('scrooloose/nerdcommenter', always)
	call packager#add('thinca/vim-textobj-comment', always)
	call packager#add('tommcdo/vim-exchange', always)
	call packager#add('tomtom/tcomment_vim', always)
	call packager#add('tpope/vim-repeat', always)
	call packager#add('tpope/vim-surround', always)
	call packager#add('urbainvaes/vim-ripple', always)
	call packager#add('vim-scripts/CmdlineComplete', always)
	call packager#add('vim-scripts/DeleteTrailingWhitespace', always)
	call packager#add('vim-scripts/VisIncr', always)
	call packager#add('vim-scripts/utl.vim', always)
	call packager#add('wellle/targets.vim', always)
	call packager#add('McSinyx/vim-octave', always)
	call packager#add('christoomey/vim-tmux-navigator', always)
	" -- plugins with deps
	call packager#add('vim-scripts/LineJuggler', {
				\ 'type' : 'start',
				\ 'requires' : ['vim-scripts/ingo-library', 'vim-scripts/LineJugglerCommands']
				\ })
	" ---- optional plugins, loaded on some filetypes
	call packager#add('mzlogin/vim-markdown-toc', optional)
	call packager#add('vim-latex/vim-latex', optional)
	" ---- optional plugins loaded manually
	call packager#add('axvr/org.vim', optional)
	call packager#add('SirVer/ultisnips', optional)
	call packager#add('mbbill/undotree', optional)
	call packager#add('junegunn/vim-easy-align', optional)
	call packager#add('dhruvasagar/vim-table-mode', optional)
	call packager#add('arecarn/crunch.vim', optional)
	call packager#add('chrisbra/NrrwRgn', optional)
	call packager#add('dstein64/vim-startuptime', optional)
	call packager#add('flazz/vim-colorschemes', optional)
	call packager#add('water-sucks/darkrose.nvim', optional)
	call packager#add('justinmk/vim-dirvish', optional)
	call packager#add('kana/vim-submode', optional)
	call packager#add('liuchengxu/vim-which-key', optional)
	call packager#add('machakann/vim-textobj-delimited', optional)
	call packager#add('skywind3000/asyncrun.vim', optional)
	call packager#add('stefandtw/quickfix-reflector.vim', optional)
	call packager#add('thinca/vim-textobj-between', optional)
	call packager#add('tpope/vim-fugitive', optional)
	call packager#add('vim-scripts/YankRing.vim', optional)
	call packager#add('mhinz/neovim-remote', optional)
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
