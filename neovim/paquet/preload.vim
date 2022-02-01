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

let g:UltiSnipsListSnippets='<F8>l'

nnoremap <F8>e <cmd>UltiSnipsEdit<cr>
nnoremap <F8>a <cmd>UltiSnipsAddFiletypes<space>

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

nmap <f4> <Plug>Sneak_s
nmap <f3> <Plug>Sneak_S

xmap <f4> <Plug>Sneak_s
xmap <f3> <Plug>Sneak_S

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

nmap <f10> <Plug>SneakLabel_s
nmap <f9>  <Plug>SneakLabel_S

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

" Déplacement & Copie {{{1

" Textmanip (t9md/vim-textmanip) {{{2

xmap z<Down> <Plug>(textmanip-move-down)
xmap z<Up> <Plug>(textmanip-move-up)
xmap z<Left> <Plug>(textmanip-move-left)
xmap z<Right> <Plug>(textmanip-move-right)

xmap z<S-Down> <Plug>(textmanip-duplicate-down)
xmap z<S-Up> <Plug>(textmanip-duplicate-up)

nmap z<S-Down> <Plug>(textmanip-duplicate-down)
nmap z<S-Up> <Plug>(textmanip-duplicate-up)

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

" FZF (junegunn/fzf.vim) {{{2

" Mappings {{{3

nnoremap <f7>a <cmd>Ag<cr>
nnoremap <f7>b <cmd>Buffers<cr>
nnoremap <f7>c <cmd>Commands<cr>
nnoremap <f7>C <cmd>Commits<cr>
nnoremap <f7>f <cmd>Files<cr>
nnoremap <f7>F <cmd>Filetypes<cr>
nnoremap <f7>g <cmd>GitFiles<cr>
nnoremap <f7>h <cmd>History<cr>
nnoremap <f7>H <cmd>Helptags<cr>
nnoremap <f7>l <cmd>Lines<cr>
nnoremap <f7>m <cmd>Marks<cr>
nnoremap <f7>M <cmd>Maps<cr>
nnoremap <f7>r <cmd>Rg<cr>
nnoremap <f7>s <cmd>Snippets<cr>
nnoremap <f7>t <cmd>Tags<cr>
nnoremap <f7>w <cmd>Windows<cr>

" }}}3

" Options {{{3

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/racine/hist/fzf'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS="--reverse " " top to bottom

" }}}3

" Présentation {{{3

" Default fzf layout
" - down / up / left / right

" popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=0 ctermbg=3
  highlight fzf2 ctermfg=0 ctermbg=3
  highlight fzf3 ctermfg=0 ctermbg=3
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" }}}3

" }}}2

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
	" Auto read torus file on startup if > 0
	let g:wheel_config.autoread = 1
	" Auto write torus file on exit if > 0
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
	let g:wheel_config.maxim.yanks = 700
	" Maximum size of elements in yank wheel
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

	" Wheel message : one-line or multi-line
	let g:wheel_config.display.message = 'multi-line'
	" Filter prompt in dedicated buffers
	"let g:wheel_config.display.prompt = 'wheel $ '
	" Selection marker in dedicated buffers
	"let g:wheel_config.display.selection = '-> '
	" Sign text at wheel locations
	"let g:wheel_config.display.sign.settings = { 'text' : '@' }

	"let g:wheel_config.debug = 1

	set tabline=%!wheel#status#tabline()

	nmap <silent> <c-l> <cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)
	imap <silent> <c-l> <esc><cmd>nohlsearch<cr><plug>(wheel-spiral-cursor)a

	nmap <silent> k <cmd>call wheel#mandala#wrap_up()<cr>
	nmap <silent> j <cmd>call wheel#mandala#wrap_down()<cr>

	nmap <silent> <up> <cmd>call wheel#mandala#wrap_up()<cr>
	nmap <silent> <down> <cmd>call wheel#mandala#wrap_down()<cr>

	nmap <silent> § <plug>(wheel-dedibuf-index-tree)
	nmap <silent> é <plug>(wheel-dedibuf-grep)
	nmap <silent> à <plug>(wheel-dedibuf-narrow-operator)
	vmap <silent> à <plug>(wheel-dedibuf-narrow)
	nmap <silent> è <plug>(wheel-dedibuf-narrow-circle)
	nmap <silent> ù <plug>(wheel-dedibuf-history)
	nmap <silent> µ <plug>(wheel-dedibuf-buffer-all)
	nmap <silent> £ <plug>(wheel-dedibuf-tabwin-tree)
	nmap <silent> ç <plug>(wheel-dedibuf-yank-plain)

	nmap <silent> <d-^>       <plug>(wheel-alternate-other-torus)
	nmap <silent> <d-e>       <plug>(wheel-dedibuf-frecency)
	nmap <silent> <d-cr>      <plug>(wheel-prompt-index)
	nmap <silent> <d-x>       <plug>(wheel-prompt-index-circles)
	nmap <silent> <d-v>       <plug>(wheel-dedibuf-tabwin)

    nmap <silent> <d-o>       <plug>(wheel-dedibuf-occur)
    nmap <silent> <d-b>       <plug>(wheel-dedibuf-buffer-all)
	nmap <silent> <d-k>       <plug>(wheel-dedibuf-marker)
	nmap <silent> <d-j>       <plug>(wheel-dedibuf-jump)
	nmap <silent> <d-c>       <plug>(wheel-dedibuf-change)
	nmap <silent> <d-t>       <plug>(wheel-dedibuf-tag)

    nmap <silent> <d-n>       <plug>(wheel-dedibuf-narrow-operator)
    vmap <silent> <d-n>       <plug>(wheel-dedibuf-narrow)

    nmap <silent> <d-y>       <plug>(wheel-dedibuf-yank-list)
    nmap <silent> <d-p>       <plug>(wheel-dedibuf-yank-plain)

	nmap <silent> <d-u>       <plug>(wheel-dedibuf-undo-list)
	nmap <silent> <d-r>       <plug>(wheel-dedibuf-reorg-tabwin)

	nmap <silent> <d-space>   <plug>(wheel-mandala-forward)
	nmap <silent> <d-s-space> <plug>(wheel-mandala-backward)
endif

" }}}2

" }}}1

" Historique d’undo {{{1

" Undotree (mbbill/undotree) {{{2

nnoremap <s-bs> <cmd>UndotreeToggle<cr>

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

nmap ( [
nmap ) ]

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

" Table mode {{{2

nnoremap <d-&> <cmd>TableModeToggle<cr>

let g:table_mode_always_active = 0

" table à la org mode
let g:table_mode_corner = '+'
" table à la markdown
"let g:table_mode_corner = '|'

" }}}2

" Markdown folding {{{2

let g:markdown_fold_style = 'nested'
let g:markdown_fold_override_foldtext = 1

" }}}2

" Markdown TOC {{{2

let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0
let g:vmt_cycle_list_item_markers = 1

" }}}2

" Orgmode.nvim {{{2

lua << EOF

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/racine/organ/orgmode/agenda.org', '~/my-orgs/**/*'},
  org_default_notes_file = '~/racine/organ/orgmode/notes.org',
})

EOF

" }}}2

" }}}1

" Divers {{{1

" {{{ Open-pdf (rhysd/open-pdf.vim)

let g:pdf_cache_dir = $HOME . '/racine/plugin/data/addon/open-pdf'

let g:pdf_open_cmd = 'tabnew | view'
let g:pdf_edit_cmd = 'edit'
let g:pdf_read_cmd = 'read'

let g:pdf_convert_on_edit = 1
let g:pdf_convert_on_read = 1

let g:unite_pdf_search_cmd = 'locate -l 30 "*%s*.pdf"'

" }}}

" }}}1
