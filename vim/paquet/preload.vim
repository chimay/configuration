" vim: set filetype=vim :

" wheel {{{1

if ! exists("g:wheel_loaded")
	" Init
	let g:wheel_config              = {}
	let g:wheel_config.maxim        = {}
    let g:wheel_config.frecency     = {}
	let g:wheel_config.display      = {}
	let g:wheel_config.display.sign = {}

	" The file where toruses and circles will be stored and read
	let g:wheel_config.file = '~/racine/plugin/data/wheel/roue.vim'
	" Auto read wheel file on startup if > 0
	let g:wheel_config.autoread = 0
	" Auto write wheel file on exit if > 0
	let g:wheel_config.autowrite = 1
    " The file where session will be stored and read
    let g:wheel_config.session_file = '~/racine/plugin/data/wheel/session.vim'
    " Auto read session file on startup if > 0
    let g:wheel_config.autoread_session = 0
    " Auto write session file on exit if > 0
    let g:wheel_config.autowrite_session = 1
	" Number of backups for the wheel or session file
	let g:wheel_config.backups = 3
	" The bigger it is, the more mappings available
	let g:wheel_config.mappings = 10
	" Prefix for mappings
	let g:wheel_config.prefix = '<m-w>'
	" Auto cd to project root if > 0
	let g:wheel_config.auto_chdir_project = 1
	" Marker of project root
	"let g:wheel_config.project_markers = '.git'
	"let g:wheel_config.project_markers = '.racine-projet'
	" List of markers
	" The project dir is found as soon as one marker is found in it
	let g:wheel_config.project_markers = ['.git', '.racine-projet']
	" Locate database ; default one if left empty
	let g:wheel_config.locate_db = '~/racine/index/locate/racine.db'
	" Grep command : :grep or :vimpgrep
	let g:wheel_config.grep = 'vimgrep'

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

	" Frecency
	let g:wheel_config.frecency.reward = 120
	let g:wheel_config.frecency.penalty = 1

	" Mandala & leaf status in statusline ?
	"let g:wheel_config.display.statusline = 1
	" Wheel message : one-line or multi-line
	let g:wheel_config.display.message = 'multi-line'
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

	nnoremap <space> :Wheel<space>

	nmap <silent> <c-l> <cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)
	imap <silent> <c-l> <esc><cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)a

	nmap <silent> j <cmd>call wheel#mandala#wrap_down()<cr>
	nmap <silent> k <cmd>call wheel#mandala#wrap_up()<cr>

	nmap <silent> <up> <cmd>call wheel#mandala#wrap_up()<cr>
	nmap <silent> <down> <cmd>call wheel#mandala#wrap_down()<cr>
endif

" }}}1

" fixkey (drmikehenry/vim-fixkey) {{{1

let g:Fixkey_setupDelay = 500

" }}}1 

" LineJuggler (inkarkat/vim-LineJuggler)  {{{1

" (/)space pour ajouter une ligne
" (/)e pour échanger deux lignes

nmap ( [
nmap ) ]

" }}}1

"  ultisnips (SirVer/ultisnips) {{{1

" Mappings {{{2

" Si tab est défini ici, le commenter dans Neocomplcache

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<m-tab>"

let g:UltiSnipsListSnippets='<F8>l'

nnoremap <F8>e <cmd>UltiSnipsEdit<cr>
nnoremap <F8>a <cmd>UltiSnipsAddFiletypes<space>

" }}}2

" Données {{{2

let g:UltiSnipsSnippetDirectories=['snippet', 'UltiSnips']

" }}}2

let g:UltiSnipsEditSplit = 'horizontal'

" }}}1
