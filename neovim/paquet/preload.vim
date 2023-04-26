" vim: set filetype=vim :

" Documentation {{{1

" Lors de l’utilisation d’un <plug>, seuls les maps récursifs fonctionnent :
"
" nmap bidule <plug>PluginBidule
"
" et pas :
"
" nnoremap bidule <plug>PluginBidule

" }}}1

" Touches pour maps / préfixes de maps {{{1

" <d-...>

" §
" °
" £
" µ

" é
" è
" ç
" à
" ù
" space, <.-space>

" ¶ = alt gr + r

" }}}1

" Éviter les mappings par défaut des plugins

let g:no_plugin_maps = 1

" ------------------------------------

" Bouts de code (snippets, bits, modèles) {{{1

"  UltiSnips (SirVer/ultisnips) {{{2

" Mappings {{{3

" Si tab est défini ici, le commenter dans Neocomplcache

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<m-tab>"

let g:UltiSnipsListSnippets='<F10>l'

nnoremap <F10>e <cmd>UltiSnipsEdit<cr>
nnoremap <F10>a <cmd>UltiSnipsAddFiletypes<space>

" }}}3

" Données {{{3

"let g:UltiSnipsSnippetsDir = $HOME . '/racine/config/edit/neovim/snippet'

let g:UltiSnipsSnippetDirectories=['snippet', 'UltiSnips']

" }}}3

let g:UltiSnipsEditSplit = 'horizontal'

" }}}2

" }}}1

" Commentaires {{{1

"  NERDCommenter (scrooloose/nerdcommenter) {{{2

let NERDCreateDefaultMappings = 0

map <d-;> <plug>NERDCommenterToggle

" }}}2

"  TComment (tomtom/tcomment_vim) {{{2

let g:tcomment#blank_lines = 0
let g:tcomment_textobject_inlinecomment = '\tci'
let g:tcomment_mapleader_comment_anyway = '\tcca'
let g:tcomment_mapleader_uncomment_anyway = '\tcua'

let g:tcomment#options = {
	\ 'col': 1
\}

let g:tcomment_types = {
	\ 'vim': '" %s'
\}

" }}}2

" }}}1

" Copier & Coller {{{1

" Highlighted Yank {{{2

let g:highlightedyank_highlight_duration = 1000

" }}}2

" }}}1

" Paires : (), [], {}, <>, <a></a>, etc {{{1

"  Auto-pairs (jiangmiao/auto-pairs) {{{2

" Options {{{3

let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }

let g:AutoPairsFlyMode = 0

let g:AutoPairsShortcutBackInsert = '<m-space>'
let g:AutoPairsShortcutJump = '<m-)>'

let g:AutoPairsCenterLine = 1

let g:AutoPairsMapBS = 0
let g:AutoPairsMapCR = 0
let g:AutoPairsMapSpace = 0

" }}}3

" Mappings {{{3

let g:AutoPairsShortcutToggle = '<F11>('

imap <s-space>  <C-R>=AutoPairsSpace()<CR>

" }}}3

" }}}2

" }}}1

" Mouvement {{{1

" Sneak (justinmk/vim-sneak) {{{2

" Mappings {{{3

" 2-character Sneak (default)

nmap zf <Plug>Sneak_s
nmap zF <Plug>Sneak_S
nmap ZF <Plug>Sneak_S

xmap zf <Plug>Sneak_s
xmap zF <Plug>Sneak_S

omap z <Plug>Sneak_s
omap Z <Plug>Sneak_S

omap ; <Plug>Sneak_;
omap , <Plug>Sneak_,

" 1-character enhanced 'f'

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F

xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F

omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 1-character enhanced 't'

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T

omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" label-mode

nmap zl <Plug>SneakLabel_s
nmap zL <Plug>SneakLabel_S

" }}}3

" Options {{{3

let g:sneak#label = 0
let g:sneak#label_esc = "\<space>"
let g:sneak#target_labels = "ù*$àç&é§è!µ£~@#bwefthjklnu"
let g:sneak#prompt = 'sneak > '
let g:sneak#f_reset      = 0
let g:sneak#s_next       = 0
let g:sneak#absolute_dir = 1
let g:sneak#textobject_z = 1
let g:sneak#use_ic_scs   = 1
let g:sneak#map_netrw    = 1

highlight Sneak guibg=black guifg=#7b3c11 gui=bold,underline,italic
highlight SneakScope guibg=#5b3c11 guifg=black gui=bold,underline,italic

highlight Sneak cterm=reverse
highlight SneakScope cterm=reverse

" highlight link Sneak None
" " Needed if a plugin sets the colorscheme dynamically:
" autocmd User SneakLeave highlight clear Sneak

" }}}3

" }}}2

" }}}1

" Espaces {{{1

" DeleteTrailingWhitespace (DeleteTrailingWhitespace) {{{2

let g:DeleteTrailingWhitespace = 1

let g:DeleteTrailingWhitespace_Action = 'delete'
"let g:DeleteTrailingWhitespace_Action = 'ask'

let g:DeleteTrailingWhitespace_ChoiceAffectsHighlighting = 0

" }}}2

" }}}1

" Exploration multiple {{{1

" Wheel {{{2

if ! exists("g:wheel_loaded")
	" Init
	let g:wheel_config              = {}
	let g:wheel_config.maxim        = {}
    let g:wheel_config.frecency     = {}
	let g:wheel_config.display      = {}
	let g:wheel_config.display.sign = {}

	" The file where toruses and circles will be stored and read
	let g:wheel_config.file = '~/racine/plugin/data/wheel/auto'
	" Auto read wheel file on startup if > 0
	let g:wheel_config.autoread = 1
	" Auto write wheel file on exit if > 0
	let g:wheel_config.autowrite = 1
	" The file where session will be stored and read
	let g:wheel_config.session_file = '~/racine/plugin/data/wheel/layout'
	" Auto read session file on startup if > 0
	let g:wheel_config.autoread_session = 1
	" Auto write session file on exit if > 0
	let g:wheel_config.autowrite_session = 1
	" Number of backups for the wheel or session file
	let g:wheel_config.backups = 12
	" The bigger it is, the more mappings available
	let g:wheel_config.mappings = 20
	" Prefix for mappings
	let g:wheel_config.prefix = '<d-w>'
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
	" Signs
	let g:wheel_config.display.sign.switch = 1
	" Sign text at wheel locations
	"let g:wheel_config.display.sign.settings = { 'text' : '@' }
	" Signs for native navigation
	"let g:wheel_config.display.sign.native_settings = { 'text' : '*' }

	"let g:wheel_config.debug = 1

	set tabline=%!wheel#status#tabline()

	nnoremap <space> :Wheel<space>

	nmap <silent> <c-l> <cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)
	imap <silent> <c-l> <esc><cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)a

	nmap <silent> j <cmd>call wheel#mandala#wrap_down()<cr>
	nmap <silent> k <cmd>call wheel#mandala#wrap_up()<cr>

	nmap <silent> <up> <cmd>call wheel#mandala#wrap_up()<cr>
	nmap <silent> <down> <cmd>call wheel#mandala#wrap_down()<cr>

	nmap <silent> § <plug>(wheel-dedibuf-index-tree)
	nmap <silent> ù <plug>(wheel-dedibuf-frecency)
	nmap <silent> µ <plug>(wheel-dedibuf-buffer-all)
	nmap <silent> £ <plug>(wheel-dedibuf-tabwin-tree)
	nmap <silent> é <plug>(wheel-dedibuf-grep)
	nmap <silent> è <plug>(wheel-dedibuf-narrow-circle)
	nmap <silent> à <plug>(wheel-dedibuf-narrow-operator)
	vmap <silent> à <plug>(wheel-dedibuf-narrow)
	nmap <silent> ç <plug>(wheel-dedibuf-yank-plain)

	nmap <silent> <d-^>       <plug>(wheel-alternate-other-torus)
	nmap <silent> <d-e>       <plug>(wheel-dedibuf-frecency)
    nmap <silent> <d-cr>      <cmd>call wheel#vortex#helix('tab')<cr>
	nmap <silent> <d-x>       <plug>(wheel-prompt-index-circles)

	nmap <silent> <d-h>       <plug>(wheel-dedibuf-history)

	nmap <silent> <d-v>       <plug>(wheel-dedibuf-tabwin)

    nmap <silent> <d-o>       <plug>(wheel-dedibuf-occur)
    nmap <silent> <d-§>       <plug>(wheel-prompt-outline)
    nmap <silent> <d-b>       <plug>(wheel-dedibuf-buffer-all)
	nmap <silent> <d-k>       <plug>(wheel-dedibuf-marker)
	nmap <silent> <d-j>       <plug>(wheel-dedibuf-jump)
	nmap <silent> <d-c>       <plug>(wheel-dedibuf-change)
	nmap <silent> <d-t>       <plug>(wheel-dedibuf-tag)

	nmap <silent> <d-n>       <plug>(wheel-dedibuf-narrow-operator)
	vmap <silent> <d-n>       <plug>(wheel-dedibuf-narrow)

	nmap <silent> <d-y>       <plug>(wheel-dedibuf-yank-plain)
	nmap <silent> <d-p>       <plug>(wheel-dedibuf-yank-list)

	nmap <silent> <d-u>       <plug>(wheel-dedibuf-undo-list)
	nmap <silent> <d-r>       <plug>(wheel-dedibuf-reorg-tabwin)

	nmap <silent> <d-space>   <plug>(wheel-mandala-forward)
	nmap <silent> <d-s-space> <plug>(wheel-mandala-backward)
endif

" }}}2

" }}}1

" Liens {{{1

"  Utl (utl.vim) {{{2

nnoremap gf <cmd>Utl<cr>

let g:utl_cfg_hdl_scm_http = "!qutebrowser '%u#%f' &"

" }}}2

" }}}1

" Ligne de commande (:ex mode) {{{1

" CmdlineComplete (CmdlineComplete) {{{2

cmap <m-tab> <Plug>CmdlineCompleteBackward
cmap <s-tab> <Plug>CmdlineCompleteForward

" }}}2

" }}}1

" Objets texte {{{1

" Targets (wellle/targets.vim) {{{2

let g:targets_aiAI = 'aiAI'
let g:targets_nl = 'nN'
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB Ab AB rb al rB Al bb aa bB Aa BB AA'
let g:targets_jumpRanges = 'bb bB BB aa Aa AA'
let g:targets_gracious = 1

" }}}2

" }}}1

" Manipulation de lignes {{{1

" Exchange (tommcdo/vim-exchange) {{{2

let g:exchange_no_mappings=1

nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

" }}}2

" LineJuggler  {{{2

" (/)space pour ajouter une ligne
" (/)e pour échanger deux lignes

nmap z( [
nmap z) ]

" }}}2

" Easy align (junegunn/vim-easy-align) {{{2

" Start interactive EasyAlign in visual mode (e.g. vip|)
vmap <bar> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. g|ip)
nmap g<bar> <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\  ' ': { 'pattern': ' ',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\  '=': { 'pattern': '===\|<=>\|\(&&\|||\|<<\|>>\)=\|=\~[#?]\?\|=>\|[:+/*!%^=><&|.-]\?=[#?]\?',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  ':': { 'pattern': ':',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  ',': { 'pattern': ',',  'left_margin': 0, 'right_margin': 1, 'stick_to_left': 1 },
\  '|': { 'pattern': '|',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '.': { 'pattern': '\.', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\  '#': { 'pattern': '#\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\  '&': { 'pattern': '\\\@<!&\|\\\\',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '{': { 'pattern': '(\@<!{',
\                          'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  '}': { 'pattern': '}',  'left_margin': 1, 'right_margin': 0, 'stick_to_left': 0 }
\ }

" }}}2

" }}}1

" Évaluation {{{1

" Increment activator (nishigori/increment-activator) {{{2

let g:increment_activator_no_default_key_mappings = 1

nmap <silent> <C-a> <Plug>(increment-activator-increment)
nmap <silent> <C-x> <Plug>(increment-activator-decrement)

let g:increment_activator_filetype_candidates = {
  \   '_' : [
  \     ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche'],
  \     ['jamais', 'parfois', 'souvent', 'toujours'],
  \   ],
  \   'git-rebase-todo': [
  \     ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec'],
  \   ],
  \ }

" }}}2

" }}}1

" Organisation {{{1

" Organ {{{2

if ! exists("g:organ_loaded")
	let g:organ_config = {}
	let g:organ_config.speedkeys = 1
	let g:organ_config.prefix = '<m-ç>'
	let g:organ_config.prefixless = 1
	"let g:organ_config.prefixless_modes = ['normal', 'insert']
	"let g:organ_config.prefixless_plugs = ['organ-previous', 'organ-next']
	"let g:organ_config.list.unordered = #{ org : ['-', '+', '*'], markdown : ['-', '+']}
	"let g:organ_config.list.ordered = #{ org : ['.', ')'], markdown : ['.']}
endif

au FileType org,markdown nnoremap <buffer> § :Organ<space>

" }}}2

" Table mode {{{2

nnoremap <d-&> <cmd>TableModeToggle<cr>

let g:table_mode_always_active = 0

" table à la org mode
let g:table_mode_corner = '+'
" table à la markdown
"let g:table_mode_corner = '|'

" }}}2

" }}}1

" Terminal {{{1

" Ripple (urbainvaes/vim-ripple) {{{2

" REPL

let g:ripple_enable_mappings = 0
let g:ripple_winpos = ''
let g:ripple_term_name = 'ripple-repl'
let g:ripple_always_return = 0
let g:ripple_repls = #{
  \ sh     : 'sh',
  \ zsh    : 'zsh',
  \ bash   : 'bash',
  \ fish   : 'fish',
  \ elvish : 'elvish',
  \ xonsh  : 'xonsh',
  \ python : 'python',
  \ }
let g:ripple_highlight = 'DiffAdd'

nmap y<cr> <plug>(ripple_open_repl)
nmap yr <plug>(ripple_send_motion)
nmap yrr <plug>(ripple_send_line)
nmap yr<cr> <plug>(ripple_send_buffer)
nmap yp <plug>(ripple_send_previous)
vmap R <plug>(ripple_send_selection)

" }}}2

" }}}1
