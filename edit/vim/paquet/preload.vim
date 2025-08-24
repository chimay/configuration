" vim: set filetype=vim :

" wheel {{{1

if ! exists("g:wheel_loaded")
	" Init
	let g:wheel_config                 = {}
	let g:wheel_config.project         = {}
	let g:wheel_config.storage         = {}
	let g:wheel_config.storage.wheel   = {}
	let g:wheel_config.storage.session = {}
	let g:wheel_config.maxim           = {}
	let g:wheel_config.completion      = {}
	let g:wheel_config.frecency        = {}
	let g:wheel_config.display         = {}
	let g:wheel_config.display.sign    = {}

	" The bigger it is, the more mappings available
	let g:wheel_config.mappings = 2
	" Prefix for mappings
	let g:wheel_config.prefix = '<space>'
	" Locate database ; default one if left empty
	let g:wheel_config.locate_db = '~/racine/index/locate/racine.db'
	" Grep command : :grep or :vimpgrep
	let g:wheel_config.grep = 'vimgrep'

	" Marker of project root
	"let g:wheel_config.project.markers = '.git'
	"let g:wheel_config.project.markers = '.racine-projet'
	" List of markers
	" The project dir is found as soon as one marker is found in it
	let g:wheel_config.project.markers = ['.hg' , '.git', '.racine-projet']
	" Auto cd to project root if > 0
	let g:wheel_config.project.auto_chdir = 1

	" The folder where toruses and circles will be stored and read
	let g:wheel_config.storage.wheel.folder = '~/racine/plugin/data/vim/wheel'
	" Name of the default wheel file
	let g:wheel_config.storage.wheel.name = 'roue.vim'
	" Auto read wheel file on startup if > 0
	let g:wheel_config.storage.wheel.autoread = 0
	" Auto write wheel file on exit if > 0
	let g:wheel_config.storage.wheel.autowrite = 1
	" The folder where sessions will be stored and read
	let g:wheel_config.storage.session.folder = '~/racine/plugin/data/vim/wheel/session'
	" Name of the default session file
	let g:wheel_config.storage.session.name = 'layout.vim'
	" Auto read default session file on startup if > 0
	let g:wheel_config.storage.session.autoread = 0
	" Auto write default session file on exit if > 0
	let g:wheel_config.storage.session.autowrite = 1
	" Number of backups for the wheel or session file
	let g:wheel_config.storage.backups = 5

	" Maximum number of elements in history
	let g:wheel_config.maxim.history = 700
	" Maximum number of elements in input history
	let g:wheel_config.maxim.input = 700

	" Maximum number of elements in mru
	let g:wheel_config.maxim.mru = 700

	" Maximum number of elements in yank wheel
	let g:wheel_config.maxim.unnamed_yanks = 700
	let g:wheel_config.maxim.other_yanks = 300
	" Maximum lines of yank to add in yank ring
	let g:wheel_config.maxim.yank_lines = 30
	" Maximum size of yank to add in yank ring
	let g:wheel_config.maxim.yank_size = 3000

	" Maximum size of layer ring
	let g:wheel_config.maxim.layers = 7

	" Maximum number of tabs
	let g:wheel_config.maxim.tabs = 12
	" Maximum number of horizontal splits
	let g:wheel_config.maxim.horizontal = 3
	" Maximum number of vertical splits
	let g:wheel_config.maxim.vertical = 4

	" completion
	let g:wheel_config.completion.vocalize = 1
	let g:wheel_config.completion.wordize = 1
	let g:wheel_config.completion.fuzzy = 0
	let g:wheel_config.completion.scores = 1

	" Frecency
	let g:wheel_config.frecency.reward = 120
	let g:wheel_config.frecency.penalty = 1

	" Mandala & leaf status in statusline ?
	"let g:wheel_config.display.statusline = 1
	" Wheel message : one-line or multi-line
	let g:wheel_config.display.dedibuf_msg = 'multi-line'
	" Filter prompt in dedicated buffers
	"let g:wheel_config.display.prompt = 'wheel $ '
	"let g:wheel_config.display.prompt_writable = 'wheel # '
	" Selection marker in dedicated buffers
	"let g:wheel_config.display.selection = '-> '
	" Sign text at wheel locations
	"let g:wheel_config.display.sign.switch = 1
	"let g:wheel_config.display.sign.settings = { 'text' : '@' }

	"let g:wheel_config.debug = 1

	set tabline=%!wheel#status#tabline()

	nnoremap <leader>w :<c-u>Wheel<space>

	nmap <silent> <c-l> <cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)
	imap <silent> <c-l> <esc><cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)a
endif

" organ {{{1

if ! exists("g:organ_loaded")
	" ---- init dicts
	let g:organ_config = {}
	let g:organ_config.prefixless_plugs = {}
	let g:organ_config.list = {}
	let g:organ_config.list.unordered = {}
	let g:organ_config.list.ordered = {}
	let g:organ_config.links = {}
	let g:organ_config.templates = {}
	let g:organ_config.expr = {}
	let g:organ_config.completion = {}
	" ---- config
	let g:organ_config.everywhere = 1
	let g:organ_config.speedkeys = 1
	let g:organ_config.previous = '<m-p>'
	let g:organ_config.prefix = '<m-o>'
	let g:organ_config.prefixless = 1
	let g:organ_config.prefixless_plugs.normal = [
		\ 'organ-next',
		\ 'organ-parent',
		\ 'organ-loose-child',
		\ 'organ-strict-child',
		\ 'organ-tab',
		\ 'organ-shift-tab',
		\ 'organ-meta-left',
		\ 'organ-meta-right',
		\ 'organ-meta-up',
		\ 'organ-meta-down',
		\ 'organ-shift-left',
		\ 'organ-shift-right',
		\ 'organ-shift-up',
		\ 'organ-shift-down',
		\ 'organ-meta-shift-left',
		\ 'organ-meta-shift-right',
		\ 'organ-meta-shift-up',
		\ 'organ-meta-shift-down',
		\ 'organ-align',
		\ 'organ-store-url',
		\ 'organ-new-link',
		\ 'organ-previous-link',
		\ 'organ-next-link',
		\ 'organ-timestamp',
		\]
	let g:organ_config.prefixless_plugs.visual = []
	let g:organ_config.prefixless_plugs.insert = [
		\ 'organ-previous',
		\ 'organ-next',
		\ 'organ-backward',
		\ 'organ-forward',
		\ 'organ-parent',
		\ 'organ-loose-child',
		\ 'organ-strict-child',
		\ 'organ-meta-return',
		\ 'organ-shift-return',
		\ 'organ-tab',
		\ 'organ-shift-tab',
		\ 'organ-meta-left',
		\ 'organ-meta-right',
		\ 'organ-meta-up',
		\ 'organ-meta-down',
		\ 'organ-shift-left',
		\ 'organ-shift-right',
		\ 'organ-shift-up',
		\ 'organ-shift-down',
		\ 'organ-meta-shift-left',
		\ 'organ-meta-shift-right',
		\ 'organ-meta-shift-up',
		\ 'organ-meta-shift-down',
		\ 'organ-toggle-tag',
		\ 'organ-toggle-checkbox',
		\ 'organ-align',
		\ 'organ-new-separator-line',
		\ 'organ-store-url',
		\ 'organ-new-link',
		\ 'organ-previous-link',
		\ 'organ-next-link',
		\ 'organ-goto-link-target',
		\ 'organ-timestamp',
		\ 'organ-eval-vim',
		\ 'organ-eval-python',
		\ 'organ-unicode',
		\]
	let g:organ_config.list.unordered.asciidoc = ['*', '**', '***']
	let g:organ_config.list.ordered.asciidoc = ['.', '..', '...']
	let g:organ_config.links.keep = 30
	let g:organ_config.todo_cycle = ['TODO', 'IN PROGRESS', 'ALMOST DONE', 'DONE']
	let g:organ_config.templates['<m'] = 'mystuff'
	let g:organ_config.templates['+m'] = 'mystuff'
	let g:organ_config.timestamp_format = '%d %B %Y, %H:%M'
	let g:organ_config.expr.keep = 120
	let g:organ_config.completion.vocalize = 1
	let g:organ_config.completion.wordize = 1
	let g:organ_config.completion.fuzzy = 0
	let g:organ_config.completion.scores = 0
	" maps
	nnoremap <tab> :<c-u>Organ<space>
	nmap <bs> <plug>(organ-goto-headline)
	" altgr-u
	nmap ↓    <plug>(organ-unicode)
endif

" fixkey (drmikehenry/vim-fixkey) {{{1

let g:Fixkey_setupDelay = 500

" LineJuggler (inkarkat/vim-LineJuggler)  {{{1

" (/)space pour ajouter une ligne
" (/)e pour échanger deux lignes

nmap ( [
nmap ) ]


