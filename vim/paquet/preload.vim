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

" <cr> = <enter>
" <s-cr>
" <c-cr>

" <tab>
" <s-tab>
" <c-tab>

" <bs> = backspace
" <s-bs>
" <c-bs>

" <space>
" <s-space>
" <c-space>

" <Bar> = |
" <Bslash> = \

" §
" °
" £
" µ

" é
" è
" ç
" à
" ù

" Autres idées : Tab, C-_, C-Space, C-B

" }}}1

" Éviter les mappings par défaut des plugins

let g:no_plugin_maps = 1

" Configuration des plugins

" Librairies : fonctions, utilitaires {{{1

" Tlib (tomtom/tlib_vim) {{{2

"nnoremap ...p :TBrowseOutput<space>

"nnoremap ...o :exec 'e' fnameescape(tlib#input#List('s', 'Old file', v:oldfiles))<cr>

" }}}2

" }}}1

" ------------------------------------

" Abréviations {{{1

" Abolish (tpope/vim-abolish) {{{2

let g:abolish_save_file = $HOME . '/racine/plugin/data/abolish/abreviations'

nnoremap <F11>a :Abolish //<Left>
nnoremap <F11>s :Subvert //<Left>

" }}}2

" }}}1

" Alignement {{{1

" }}}1

" Brouillons {{{1

" Backscratch {{{2

nnoremap <F10> :Scratch<space>

" }}}2

" }}}1

    " Tableaux {{{1

    " }}}1

    " Bouts de code (snippets, bits, modèles) {{{1

    "  UltiSnips (SirVer/ultisnips) {{{2

    " Mappings {{{3

    " Si tab est défini ici, le commenter dans Neocomplcache

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:UltiSnipsListSnippets='<f7>l'

nnoremap <f7>e :UltiSnipsEdit<cr>
nnoremap <f7>a :UltiSnipsAddFiletypes<space>

" }}}3

" Données {{{3

let g:UltiSnipsSnippetsDir = $HOME . '/racine/config/edit/vim/snippet'

let g:UltiSnipsSnippetDirectories=['snippet', 'UltiSnips']

" }}}3

let g:UltiSnipsEditSplit = 'horizontal'

" }}}2

" }}}1

" Commentaires {{{1

"  NERDCommenter (scrooloose/nerdcommenter) {{{2

let NERDCreateDefaultMappings = 0

map <leader>c <plug>NERDCommenterToggle

" }}}2

"  TComment (tomtom/tcomment_vim) {{{2

let g:tcommentTextObject_inlineComment = '\tci'

let g:tcommentBlankLines = 0

let g:tcomment#options = {
	\ 'col': 1
\}

let g:tcomment_types = {
	\ 'vim': '" %s'
\}

" }}}2

" }}}1

" Complétion {{{1

" Deoplete {{{2

let g:deoplete#enable_at_startup = 1

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

let g:AutoPairsMapBS = 1
let g:AutoPairsMapCR = 1
let g:AutoPairsMapSpace = 0

" }}}3

" Mappings {{{3

let g:AutoPairsShortcutToggle = '<C-F11><C-F11>('

imap <s-space>  <C-R>=AutoPairsSpace()<CR>

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

nnoremap <f7>a :Ag<cr>
nnoremap <f7>b :Buffers<cr>
nnoremap <f7>c :Commands<cr>
nnoremap <f7>C :Commits<cr>
nnoremap <f7>f :Files<cr>
nnoremap <f7>F :Filetypes<cr>
nnoremap <f7>g :GitFiles<cr>
nnoremap <f7>h :History<cr>
nnoremap <f7>H :Helptags<cr>
nnoremap <f7>l :Lines<cr>
nnoremap <f7>m :Marks<cr>
nnoremap <f7>M :Maps<cr>
nnoremap <f7>r :Rg<cr>
nnoremap <f7>s :Snippets<cr>
nnoremap <f7>t :Tags<cr>
nnoremap <f7>w :Windows<cr>

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
"let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'new' }

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
	let g:wheel_config={}
	let g:wheel_config.maxim={}

	" Auto read torus file on startup if > 0
	let g:wheel_config.autoread = 0
	" Auto write torus file on exit if > 0
	let g:wheel_config.autowrite = 1
	" The file where toruses and circles will be stored and read
	let g:wheel_config.file = '~/racine/plugin/data/wheel/roue.vim'
	" Number of backups for the wheel file
	let g:wheel_config.backups = 7
	" The bigger it is, the more mappings available
	let g:wheel_config.mappings = 10
	" Prefix for mappings
	let g:wheel_config.prefix = '<m-w>'
	" Auto cd to project root if > 0
	let g:wheel_config.cd_project = 1
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
	let g:wheel_config.maxim.history = 70
	" Maximum number of elements in input history
	let g:wheel_config.maxim.input = 120
	" Maximum number of elements in yank wheel
	let g:wheel_config.maxim.yanks = 300
	" Maximum size of elements in yank wheel
	let g:wheel_config.maxim.yank_size = 3000
	" Maximum size of layer stack
	let g:wheel_config.maxim.layers = 7
	" Maximum number of tabs
	let g:wheel_config.maxim.tabs = 12
	" Maximum number of horizontal splits
	let g:wheel_config.maxim.horizontal = 3
	" Maximum number of vertical splits
	let g:wheel_config.maxim.vertical = 4

	"let g:wheel_config.debug = 1

	set tabline=%!wheel#status#tabline()

	nmap <silent> <c-l> :nohl<cr><plug>(wheel-spiral-cursor)
	imap <silent> <c-l> <esc>:nohl<cr><plug>(wheel-spiral-cursor)a

	nmap <silent> k :call wheel#mandala#wrap_up()<cr>
	nmap <silent> j :call wheel#mandala#wrap_down()<cr>

	nmap <silent> <up> :call wheel#mandala#wrap_up()<cr>
	nmap <silent> <down> :call wheel#mandala#wrap_down()<cr>
endif

" }}}2

" }}}1

" Objets texte {{{1

" Targets (wellle/targets.vim) {{{2

let g:targets_aiAI = 'aiAI'
let g:targets_nlNL = 'jkJK'
let g:targets_pairs = '()b {}B []r <>a'
let g:targets_quotes = '" '' `'
let g:targets_separators = ', . ; : + - = ~ _ * # / | \ & $'

" }}}2

" Textobj-user & dérivés (kana/vim-textobj-user) {{{2

let g:textobj_between_no_default_key_mappings = 1

omap  ai  <Plug>(textobj-between-a)
xmap  ai  <Plug>(textobj-between-a)
omap  ii  <Plug>(textobj-between-i)
xmap  ii  <Plug>(textobj-between-i)

let g:textobj_delimited_no_default_key_mappings = 1

omap  ad  <Plug>(textobj-delimited-forward-a)
xmap  ad  <Plug>(textobj-delimited-forward-a)
omap  id  <Plug>(textobj-delimited-forward-i)
xmap  id  <Plug>(textobj-delimited-forward-i)

let g:textobj_line_no_default_key_mappings = 1

omap  al  <Plug>(textobj-line-a)
xmap  al  <Plug>(textobj-line-a)
omap  il  <Plug>(textobj-line-i)
xmap  il  <Plug>(textobj-line-i)

let g:textobj_indent_no_default_key_mappings = 1

omap  a<tab>  <Plug>(textobj-indent-a)
xmap  a<tab>  <Plug>(textobj-indent-a)
omap  i<tab>  <Plug>(textobj-indent-i)
xmap  i<tab>  <Plug>(textobj-indent-i)

let g:textobj_comment_no_default_key_mappings = 1

omap  ac  <Plug>(textobj-comment-a)
xmap  ac  <Plug>(textobj-comment-a)
omap  ic  <Plug>(textobj-comment-i)
xmap  ic  <Plug>(textobj-comment-i)

let g:textobj_function_no_default_key_mappings = 1

omap  af  <Plug>(textobj-function-a)
xmap  af  <Plug>(textobj-function-a)
omap  if  <Plug>(textobj-function-i)
xmap  if  <Plug>(textobj-function-i)

let g:textobj_fold_no_default_key_mappings = 1

omap  az  <Plug>(textobj-fold-a)
xmap  az  <Plug>(textobj-fold-a)
omap  iz  <Plug>(textobj-fold-i)
xmap  iz  <Plug>(textobj-fold-i)

let g:textobj_entire_no_default_key_mappings = 1

omap  ae  <Plug>(textobj-entire-a)
xmap  ae  <Plug>(textobj-entire-a)
omap  ie  <Plug>(textobj-entire-i)
xmap  ie  <Plug>(textobj-entire-i)

" }}}2

" Visual multi (mg979/vim-visual-multi) {{{2

" Mappings {{{3

let g:VM_default_mappings = 0
let g:VM_mouse_mappings = 0

let g:VM_leader = {
			\'default': '<m-v>',
			\'visual': '<m-v>',
			\'buffer': '<m-v>'
			\}

let g:VM_maps = {}

let g:VM_maps['Find Under']          = '<m-m>'
let g:VM_maps['Find Subword Under']  = '<m-m>'
let g:VM_maps["Add Cursor Down"]     = '<m-n>'
let g:VM_maps["Add Cursor Up"]       = '<m-p>'
let g:VM_maps["Select All"]          = '<m-v>A'
let g:VM_maps["Start Regex Search"]  = '<m-v>/'
let g:VM_maps["Add Cursor At Pos"]   = '<m-v><m-v>'
let g:VM_maps["Reselect Last"]       = '<m-v>gv'

let g:VM_maps["Visual All"]     = '<m-v>A'
let g:VM_maps["Visual Regex"]   = '<m-v>/'
let g:VM_maps["Visual Find"]    = '<m-v>f'
let g:VM_maps["Visual Cursors"] = '<m-v>c'
let g:VM_maps["Visual Add"]     = '<m-v>a'

let g:VM_maps["Visual Subtract"] = '<m-v>s'
let g:VM_maps["Visual Reduce"]   = '<m-v>r'

let g:VM_maps["Find Next"]     = 'n'
let g:VM_maps["Find Prev"]     = 'N'
let g:VM_maps["Goto Next"]     = ']'
let g:VM_maps["Goto Prev"]     = '['
let g:VM_maps["Seek Next"]     = '<C-f>'
let g:VM_maps["Seek Prev"]     = '<C-b>'
let g:VM_maps["Skip Region"]   = 'q'
let g:VM_maps["Remove Region"] = 'Q'

let g:VM_maps["Invert Direction"] = 'o'
let g:VM_maps["Replace"]          = 'R'
let g:VM_maps["Surround"]         = 'S'
let g:VM_maps["Move Right"]       = '<M-S-Right>'
let g:VM_maps["Move Left"]        = '<M-S-Left>'

let g:VM_maps["I Next"] = '<tab>'
let g:VM_maps["I Prev"] = '<s-tab>'

let g:VM_maps["Select Operator"] = 's'
let g:VM_maps["Find Operator"]   = 'm'

let g:VM_maps["Increase"]       = '<c-a>'
let g:VM_maps["Decrease"]       = '<c-x>'
let g:VM_maps["Alpha-Increase"] = '<m-v><c-a>'
let g:VM_maps["Alpha-Decrease"] = '<m-v><c-x>'

let g:VM_maps["Transpose"]           = '<m-v>t'
let g:VM_maps["Align"]               = '<m-v>a'
let g:VM_maps["Align Char"]          = '<m-v><'
let g:VM_maps["Align Regex"]         = '<m-v>>'
let g:VM_maps["Split Regions"]       = '<m-v>s'
let g:VM_maps["Filter Regions"]      = '<m-v>f'
let g:VM_maps["Transform Regions"]   = '<m-v>e'
let g:VM_maps["Rewrite Last Search"] = '<m-v>r'
let g:VM_maps["Merge Regions"]       = '<m-v>m'
let g:VM_maps["Duplicate"]           = '<m-v>d'
let g:VM_maps["Shrink"]              = '<m-v>-'
let g:VM_maps["Enlarge"]             = '<m-v>+'
let g:VM_maps["Numbers"]             = '<m-v>0'
let g:VM_maps["Numbers Append"]      = '<m-v>1'

let g:VM_maps["Run Normal"]      = '<m-v>n'
let g:VM_maps["Run Visual"]      = '<m-v>v'
let g:VM_maps["Run Ex"]          = '<m-v>:'
let g:VM_maps["Run Last Normal"] = '<m-v>N'
let g:VM_maps["Run Last Visual"] = '<m-v>V'
let g:VM_maps["Run Last Ex"]     = '<m-v>X'
let g:VM_maps["Run Macro"]       = '<m-v>@'

let g:VM_maps["Select Cursor Down"] = '<C-Down>'
let g:VM_maps["Select Cursor Up"]   = '<C-Up>'

let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

let g:VM_maps["Tools Menu"]           = '<m-v>='
let g:VM_maps["Case Conversion Menu"] = '<m-v>C'
let g:VM_maps["Show Registers"]       = '<m-v>"'
let g:VM_maps["Toggle Whole Word"]    = '<m-v>w'
let g:VM_maps["Case Settings"]        = '<m-v>c'
let g:VM_maps["Toggle Multiline"]     = '<m-v>M'
let g:VM_maps["Toggle Mappings"]      = '<m-v><m-v>'
let g:VM_maps["Toggle Block"]         = '<m-v><c-v>'
let g:VM_maps["Toggle Single Region"] = '<m-v><cr>'

" }}}3

" Options {{{3

let g:VM_set_statusline = 2
let g:VM_silent_exit = 1

" }}}3

" Couleurs {{{3

" *g:VM_Mono_hl*    is the highlight in cursor mode
" *g:VM_Extend_hl*  ,, in extend mode (the selections)
" *g:VM_Cursor_hl*  ,, in extend mode (the cursors)
" *g:VM_Insert_hl*  ,, in insert mode (the virtual cursors)

let g:VM_Mono_hl   = 'VisualMultiMono'
let g:VM_Extend_hl = 'VisualMultiExtend'
let g:VM_Cursor_hl = 'VisualMultiExtendCursors'
let g:VM_Insert_hl = 'VisualMultiInsert'

let g:VM_highlight_matches = 'hi Search	guifg=#5B3C11 guibg=black gui=underline'

" }}}3

" }}}2

" }}}1

" Recherche & Remplacement {{{1

" Grepper {{{2

"nnoremap <D-g> :Grepper<cr>

" }}}2

" Esearch {{{2

let g:esearch = {
	\ 'adapter':    'ag',
	\ 'backend':    'nvim',
	\ 'out':        'qflist',
	\ 'batch_size': 1000,
	\ 'use':        ['visual', 'hlsearch', 'last'],
	\}

"nmap <D-r> <Plug>(esearch)

" }}}2

" Quickfix reflector (stefandtw/quickfix-reflector.vim) {{{2

let g:qf_modifiable = 1
let g:qf_write_changes = 1
let g:qf_join_changes = 1

" }}}2

" QFGrep {{{2

" nmap <buffer> \r <Plug>QFRestore
" nmap <buffer> \v <Plug>QFGrepV
" nmap <buffer> \g <Plug>QFGrepG

let g:QFG_hi_prompt='guifg=#5B3C11 guibg=black ctermfg=3 ctermbg=NONE'
let g:QFG_hi_info='guifg=#5B3C11 guibg=black ctermfg=3 ctermbg=NONE'
let g:QFG_hi_error='guifg=#5B3C11 guibg=black ctermfg=3 ctermbg=NONE'

" }}}2

" }}}1

" Évaluation {{{1

" Ripple (urbainvaes/vim-ripple) {{{2

" REPL

let g:ripple_enable_mappings = 1

let g:ripple_repls = {
            \ "sh": "zsh",
            \ "zsh": "zsh",
            \ "bash": "bash",
            \ }

" }}}2

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

" Terminal {{{1

" Neoterm (kassio/neoterm) {{{2

" nnoremap <C-!> :new \| Ttoggle<cr>
"
" nnoremap <C-CR> :TREPLSendLine<cr>
" vnoremap <C-CR> :TREPLSendSelection<cr>
"
" nnoremap <S-C-CR> :TREPLSendFile<cr>

" }}}2

" Neomake {{{2

"nnoremap <D-m> :NeomakeSh<space>

let g:neomake_make_maker = {
	\ 'exe': 'make',
\ }

" }}}2

" Terminus (brettanomyces/nvim-terminus) {{{2

"nnoremap <D-!> :TerminusOpen<space>

tmap <c-x>e <Plug>TerminusEditCommand

tmap <c-x>v <Plug>TerminusInterceptCommand

tmap <s-cr> <Plug>TerminusEditCommand
tmap <c-cr> <Plug>TerminusInterceptCommand

let g:terminus_default_prompt = '>'

" }}}2

" Deol {{{2

"nnoremap <D-s> :Deol<cr>

" }}}2

" }}}1

" Sans distraction {{{1

" Goyo (junegunn/goyo.vim) {{{2

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}2

" Limelight (junegunn/limelight.vim) {{{2

" Color name (:help cterm-colors) or ANSI code
"let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
"let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#222222'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" }}}2

" }}}1

" Divers {{{1

" Unimpaired (tpope/vim-unimpaired) {{{2

nmap ( [
nmap ) ]

" }}}2

" }}}1
