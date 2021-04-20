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

" Configuration des plugins

" Librairies : fonctions, utilitaires {{{1

" Tlib (tomtom/tlib_vim) {{{2

"nnoremap ...p :TBrowseOutput<space>

"nnoremap ...o :exec 'e' fnameescape(tlib#input#List('s', 'Old file', v:oldfiles))<cr>

" }}}2

" }}}1

" ------------------------------------

" Bouts de code (snippets, bits, modèles) {{{1

"  UltiSnips (SirVer/ultisnips) {{{2

" Mappings {{{3

" Si tab est défini ici, le commenter dans Neocomplcache

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsListSnippets='<F8>l'

nnoremap <F8>e :UltiSnipsEdit<cr>
nnoremap <F8>a :UltiSnipsAddFiletypes<space>

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

map <d-c> <plug>NERDCommenterToggle

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

nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S

omap z <Plug>Sneak_s
omap Z <Plug>Sneak_S

omap ; <Plug>Sneak_;
omap , <Plug>Sneak_,

" 1-character enhanced 'f'

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F

" visual-mode

xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F

" operator-pending-mode

omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 1-character enhanced 't'

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

" visual-mode

xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T

" operator-pending-mode

omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" label-mode

nmap <m-;> <Plug>SneakLabel_s
nmap <m-,> <Plug>SneakLabel_S

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
	let g:wheel_config={}
	let g:wheel_config.maxim={}

	" The file where toruses and circles will be stored and read
	let g:wheel_config.file = '~/racine/plugin/data/wheel/auto'
	" Auto read torus file on startup if > 0
	let g:wheel_config.autoread = 1
	" Auto write torus file on exit if > 0
	let g:wheel_config.autowrite = 1
	" Number of backups for the wheel file
	let g:wheel_config.backups = 7
	" The bigger it is, the more mappings available
	let g:wheel_config.mappings = 20
	" Prefix for mappings
	let g:wheel_config.prefix = '<d-w>'
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

	" Maximum size of layer stack
	let g:wheel_config.maxim.layers = 12

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

	nmap <silent> g<cr>  <plug>(wheel-switch-location)
	nmap <silent> <d-cr> <plug>(wheel-switch-location)
	nmap <silent> <c-cr> <plug>(wheel-switch-circle)
	nmap <silent> <s-cr> <plug>(wheel-switch-torus)

	nmap <silent> § <plug>(wheel-tree)
	nmap <silent> é <plug>(wheel-grep)
	nmap <silent> è <plug>(wheel-outline)
	nmap <silent> ù <plug>(wheel-mru)
	nmap <silent> £ <plug>(wheel-locate)
	nmap <silent> µ <plug>(wheel-tags)
	nmap <silent> ç <plug>(wheel-yank-plain)
	nmap <silent> ° <plug>(wheel-yank-list)

	nmap <silent> <d-^>     <plug>(wheel-alternate-same-torus-other-circle)
	nmap <silent> <d-x>     <plug>(wheel-index-locations)
	nmap <silent> <d-h>     <plug>(wheel-history)
	nmap <silent> <d-§>     <plug>(wheel-tabwins-tree)
	nmap <silent> <d-v>     <plug>(wheel-reorg-tabwins)
	nmap <silent> <d-space> <plug>(wheel-mandala-backward)
endif

" }}}2

" }}}1

" Filtres {{{1

"  Narrow region (chrisbra/NrrwRgn) {{{2

nnoremap à :NarrowRegion<cr><c-w>_zR

vnoremap à :NarrowRegion<cr><c-w>_zR

"xmap à <Plug>NrrwrgnDo

nmap _ <Plug>NrrwrgnWinIncr

let g:nrrw_rgn_vert = 0

let g:nrrw_rgn_wdth = 20
let g:nrrw_rgn_incr = 10

let g:nrrw_topbot_leftright = 'aboveleft'
"let g:nrrw_topbot_leftright = 'botright'

let g:nrrw_rgn_nohl = 0

let g:nrrw_rgn_update_orig_win = 1

" }}}2

" }}}1

" Historique d’undo {{{1

" Undotree (mbbill/undotree) {{{2

nnoremap <s-bs> :UndotreeToggle<cr>

" }}}2

" }}}1

" Liens {{{1

"  Utl (utl.vim) {{{2

nnoremap gf :Utl<cr>

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

" }}}2

" }}}1

" Recherche & Remplacement {{{1

" Abolish (tpope/vim-abolish) {{{2

let g:abolish_save_file = $HOME . '/racine/plugin/data/abolish/abreviations'

nnoremap <F11>a :Abolish //<Left>
nnoremap <F11>s :Subvert //<Left>

" }}}2

" Quickfix reflector (stefandtw/quickfix-reflector.vim) {{{2

let g:qf_join_changes = 0
let g:qf_modifiable = 1
let g:qf_write_changes = 0

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
            \ "python": "python",
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

" Organisation {{{1

" Markdown folding {{{2

let g:markdown_fold_style = 'nested'
let g:markdown_fold_override_foldtext = 1

" }}}2

" Markdown TOC {{{2

let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0
let g:vmt_cycle_list_item_markers = 1

" }}}2

" Vimwiki {{{2

" Common wiki settings {{{3

let common_wiki = {}

let common_wiki.ext = '.wiki'
let common_wiki.list_margin = -1

let common_wiki.index = 'main'
let common_wiki.diary_index = 'diary'
let common_wiki.diary_header = 'Diary'
let common_wiki.diary_sort = 'desc'

let common_wiki.syntax = 'default'
let common_wiki.automatic_nested_syntaxes = 1
let common_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

let common_wiki.auto_export = 0
let common_wiki.auto_toc = 0
let common_wiki.auto_tags = 1
let common_wiki.auto_diary_index = 1

let common_wiki.custom_wiki2html = ''
let common_wiki.custom_wiki2html_args = ''
let common_wiki.template_default =  'default'
let common_wiki.template_ext = '.tpl'
let common_wiki.maxhi = 0

" }}}3

" Plain wiki {{{3

let plain_wiki = deepcopy(common_wiki)

let plain_wiki.path = '~/racine/wiki/plain/wiki'
let plain_wiki.path_html = '~/racine/wiki/plain/html'
let plain_wiki.template_path =  '~/racine/wiki/plain/template'
let plain_wiki.index = 'main'
let plain_wiki.css_name = 'style.css'

" }}}3

" Site wiki {{{3

let site_wiki = deepcopy(common_wiki)

let site_wiki.path = '~/racine/wiki/site/wiki'
let site_wiki.path_html = '~/racine/wiki/site/html'
let site_wiki.template_path =  '~/racine/wiki/site/template'
let site_wiki.index = 'index'
let site_wiki.css_name = 'style/defaut.css'

" }}}3

" List of wikis

let g:vimwiki_list = [plain_wiki, site_wiki]

" Global settings {{{3

let g:vimwiki_ext2syntax = {'.md': 'markdown',
			  \ '.mkd': 'markdown',
			  \ '.wiki': 'media'}

let g:vimwiki_diary_months = {
      \ 1: 'January', 2: 'February', 3: 'March',
      \ 4: 'April', 5: 'May', 6: 'June',
      \ 7: 'July', 8: 'August', 9: 'September',
      \ 10: 'October', 11: 'November', 12: 'December'
      \ }

let g:vimwiki_hl_headers = 0
let g:vimwiki_hl_cb_checked = 0
let g:vimwiki_global_ext = 0
let g:vimwiki_menu = 'Vimwiki'
let g:vimwiki_use_mouse = 1
let g:vimwiki_folding = 'expr'
let g:vimwiki_list_ignore_newline = 1
let g:vimwiki_text_ignore_newline = 1
let g:vimwiki_use_calendar = 1
let g:vimwiki_table_mappings = 1
let g:vimwiki_table_auto_fmt = 1
let g:vimwiki_CJK_length = 1
let g:vimwiki_dir_link = ''
let g:vimwiki_html_header_numbering = 1
let g:vimwiki_html_header_numbering_sym = ''
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr'
let g:vimwiki_user_htmls = '404.html,search.html'
let g:vimwiki_conceallevel = 2
let g:vimwiki_autowriteall = 1
let g:vimwiki_url_maxsave = 15
let g:vimwiki_toc_header = 'Contents'
let g:vimwiki_map_prefix = '<Leader>w'
let g:vimwiki_auto_chdir = 1

" }}}3

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
