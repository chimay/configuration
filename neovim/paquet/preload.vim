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

nnoremap <F11>s :Subvert //<Left>

" }}}2

" }}}1

" Alignement {{{1

" }}}1

" Brouillons {{{1

" Backscratch {{{2

nnoremap <D-s> :Scratch<space>
nnoremap <D-lt> :Scratch<space>

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

let g:UltiSnipsListSnippets='<C-F5>l'

nnoremap <C-F5>e :UltiSnipsEdit<cr>
nnoremap <C-F5>a :UltiSnipsAddFiletypes<space>

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

map <s-cr> <plug>NERDCommenterToggle

map <F9>cc <plug>NERDCommenterToggle
map <F9>c<space> <plug>NERDCommenterComment
map <F9>cn <plug>NERDCommenterNest
map <F9>cm <plug>NERDCommenterMinimal
map <F9>ci <plug>NERDCommenterInvert
map <F9>cs <plug>NERDCommenterSexy
map <F9>cy <plug>NERDCommenterYank
map <F9>c$ <plug>NERDCommenterToEOL
map <F9>cA <plug>NERDCommenterAppend
map <F9>cI <plug>NERDCommenterInsert
map <F9>ca <plug>NERDCommenterAltDelims
map <F9>cl <plug>NERDCommenterAlignLeft
map <F9>cb <plug>NERDCommenterAlignBoth
map <F9>cu <plug>NERDCommenterUncommentLine

" }}}2

"  TComment (tomtom/tcomment_vim) {{{2

let g:tcomment_textobject_inlinecomment = '<F10>ci'

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

" Neoyank (Shougo/neoyank.vim) {{{2

let g:neoyank#limit = 120

let g:neoyank#file = $HOME . '/racine/plugin/data/unite/neoyank/history-neovim'

nnoremap <D-y> :<c-u>Unite -prompt-direction=top history/yank<cr>

autocmd BufWinEnter \(*.asc\|*.gpg\) let g:neoyank_disable_write = 1

" }}}2

"  YankRing (YankRing.vim) {{{2

" Mappings {{{3

" Map exceptionnel

nnoremap <silent> ç :<C-U>YRShow<cr>

" Maps ordinaires

nnoremap <silent> <F7><F7> :YRToggle<cr>
nnoremap <silent> <F7>s :<C-U>YRSearch<cr>

let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-y>'

" Y, pour compléter C et D

function! YRRunAfterMaps()
	nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" }}}3

" Options {{{3

let g:yankring_max_history = 420

let g:yankring_min_element_length = 2
let g:yankring_max_element_length = 90000

let g:yankring_warn_on_truncate = 1

let g:yankring_window_use_separate = 1
let g:yankring_window_auto_close   = 1
let g:yankring_window_use_horiz    = 1
let g:yankring_window_use_bottom = 1
let g:yankring_window_height = 25

let g:yankring_max_display = 120

" Pas besoin du menu graphique de gvim
let g:yankring_default_menu_mode = 0

let g:yankring_persist = 1
let g:yankring_share_between_instances = 1

let g:yankring_history_dir = $HOME . '/racine/plugin/data/yankring-neovim'
let g:yankring_history_file = 'yankring-hist'

let g:yankring_ignore_duplicate = 1

let g:yankring_ignore_operator = 'g~ gu gU ! = gq g? > < zf g@ @'
let g:yankring_map_dot = 0
let g:yankring_dot_repeat_yank = 0
let g:yankring_paste_using_g = 1

" Pris en charge par PrevInsertComplete
let g:yankring_record_insert = 0

" Désactivé car ralentit x,X, etc
let g:yankring_manage_numbered_reg = 0

let g:yankring_paste_check_default_buffer = 1
let g:yankring_clipboard_monitor = 1
let g:yankring_manual_clipboard_check = 1
let g:yankring_paste_check_default_register = 1

" }}}3

" }}}2

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

" 2-character Sneak (default)

nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

" visual-mode

xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S

" operator-pending-mode

omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" ; & ,

map ; <Plug>Sneak_;
map , <Plug>Sneak_,

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

nmap <expr> ; sneak#is_sneaking() ? '<Plug>SneakNext' : ';'
nmap <expr> , sneak#is_sneaking() ? '<Plug>SneakPrevious' : ','

nmap <expr> <Tab> sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Tab>'
nmap <expr> <Space> sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Space>'

let g:sneak#label = 1
let g:sneak#label_esc = "\<space>"
let g:sneak#target_labels = ",;’&é§èçàù*µ£@#!~`°¼½bwefthjklnu"
let g:sneak#prompt = '/ 2 chars > '
let g:sneak#f_reset      = 0
let g:sneak#s_next       = 0
let g:sneak#absolute_dir = 0
let g:sneak#textobject_z = 1
let g:sneak#use_ic_scs   = 1
let g:sneak#map_netrw    = 1

highlight Sneak guibg=black guifg=#7b3c11 gui=bold,underline,italic
highlight SneakScope guibg=black guifg=#7b3c11 gui=bold,underline,italic

highlight Sneak cterm=reverse
highlight SneakScope cterm=reverse

" highlight link Sneak None
" " Needed if a plugin sets the colorscheme dynamically:
" autocmd User SneakLeave highlight clear Sneak

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

" Exploration de l’arborescence du système de fichiers {{{1

" Vifm {{{2

nnoremap <D-f> :Vifm .<cr>

let g:vifmSplitWidth = 300

" }}}2

" Ranger {{{2

nnoremap <S-D-F> :Ranger<cr>

" }}}2

" }}}1

" Exploration multiple {{{1

" Unite {{{2

" Données {{{3

let g:unite_data_directory = $HOME . '/racine/plugin/data/unite'

let g:unite_source_file_mru_long_limit = 12743
let g:unite_source_mru_update_interval = 900

let g:unite_source_directory_mru_long_limit = 3600

" }}}3

" Répertoires {{{3

let g:unite_kind_openable_cd_command = 'cd'
let g:unite_kind_openable_lcd_command = 'lcd'

" }}}3

" Présentation {{{3

let g:unite_split_rule = 'dynamicbottom'

let g:unite_enable_split_vertically = 0

let g:unite_prompt = 'unite> '

" }}}3

" Copie & Collage {{{3

let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1

let g:unite_source_history_yank_limit = 543

" }}}3

" Recherche grep {{{3

let g:unite_source_grep_max_candidates = 570

let g:unite_source_grep_command = 'grep'
let g:unite_source_grep_default_opts = '--ignore-case --with-filename --line-number --context=0'
let g:unite_source_grep_recursive_opt = '-r'

" let g:unite_source_grep_command = 'ack'
" let g:unite_source_grep_default_opts = '--no-heading --no-color --ignore-case --all --with-filename --context=0'
" let g:unite_source_grep_recursive_opt = ''

" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-case -C 2'
" let g:unite_source_grep_recursive_opt = ''

let g:unite_source_find_max_candidates = 570

" }}}3

" }}}2

" Neomru {{{2

let g:neomru#file_mru_path = $HOME . '/racine/plugin/data/unite/neomru/file-neovim'

let g:neomru#file_mru_limit = 900

let g:neomru#directory_mru_path = $HOME . '/racine/plugin/data/unite/neomru/directory-neovim'

let g:neomru#directory_mru_limit = 300

let g:neomru#do_validate = 0

" }}}2

" Unite-outline (Shougo/unite-outline) {{{2

" Pour compatibilité, variable dépréciée dans unite
" Réglé
"let g:unite_abbr_highlight = 'Normal'

" }}}2

" FZF (junegunn/fzf.vim) {{{2

" Mappings {{{3

nnoremap <D-ù> :Buffers<cr>
nnoremap <D-*> :Tags<cr>
nnoremap <D-=> :Windows<cr>

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

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" }}}3

" }}}2

" CtrlSpace (szw/vim-ctrlspace) {{{2

" Mappings {{{3

let g:CtrlSpaceSetDefaultMapping = 1

let g:CtrlSpaceDefaultMappingKey = "<C-Space> "

let g:CtrlSpaceUseMouseAndArrowsInTerm = 1

let g:CtrlSpaceUseUnicode = 0

nnoremap <c-space> :CtrlSpace<cr>

nnoremap <C-PageUp> :CtrlSpaceGoUp<cr>
nnoremap <C-PageDown> :CtrlSpaceGoDown<cr>

" Voir les fichiers dans
" racine/plugin/manager/neovimpack/minpac/start/vim-ctrlspace/autoload/ctrlspace/keys

let g:CtrlSpaceKeys = {
		\ "Nop": {
			\"h": "ctrlspace#keys#common#ToggleHelp",
		\},
		\ "Help": {
			\"h": "ctrlspace#keys#common#ToggleHelp",
		\},
		\ "Buffer": {
			\"*": "ctrlspace#keys#common#ToggleTabMode",
			\"=": "ctrlspace#keys#common#ToggleBufferMode",
			\"'": "ctrlspace#keys#common#ToggleBookmarkMode",
			\"\"": "ctrlspace#keys#common#ToggleWorkspaceMode",
		\},
		\ "Tab": {
			\"*": "ctrlspace#keys#common#ToggleTabMode",
			\"=": "ctrlspace#keys#common#ToggleBufferMode",
			\"'": "ctrlspace#keys#common#ToggleBookmarkMode",
			\"\"": "ctrlspace#keys#common#ToggleWorkspaceMode",
		\},
		\ "Workspace": {
			\"*": "ctrlspace#keys#common#ToggleTabMode",
			\"=": "ctrlspace#keys#common#ToggleBufferMode",
			\"'": "ctrlspace#keys#common#ToggleBookmarkMode",
			\"\"": "ctrlspace#keys#common#ToggleWorkspaceMode",
		\},
		\ "Bookmark": {
			\"*": "ctrlspace#keys#common#ToggleTabMode",
			\"=": "ctrlspace#keys#common#ToggleBufferMode",
			\"'": "ctrlspace#keys#common#ToggleBookmarkMode",
			\"\"": "ctrlspace#keys#common#ToggleWorkspaceMode",
		\},
	\}

" }}}3

" Données {{{3

let g:CtrlSpaceCacheDir = $HOME . '/racine/plugin/data/ctrlspace'

let g:CtrlSpaceProjectRootMarkers = ['.racine-projet']

let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp)[\/]'

let g:CtrlSpaceSearchResonators = ['.', '/', '\', '_', '-']

" }}}3

" Limites {{{3

let g:CtrlSpaceMaxFiles = 500
let g:CtrlSpaceMaxSearchResults = 200

let g:CtrlSpaceSearchTiming = [50, 500]

" }}}3

" Recherche de fichiers {{{3

let g:CtrlSpaceFileEngine = "auto"

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" }}}3

" Présentation {{{3

let g:CtrlSpaceUseHorizontalSplits = 1

let g:CtrlSpaceHeight = 1
let g:CtrlSpaceMaxHeight = 0

let g:CtrlSpaceShowUnnamed = 2

let g:CtrlSpaceUseTabline = 0

let g:CtrlSpaceUnicodeFont = 1

" }}}3

" Workspaces {{{3

let g:CtrlSpaceSaveWorkspaceOnExit = 0

let g:CtrlSpaceSaveWorkspaceOnSwitch = 0

let g:CtrlSpaceLoadLastWorkspaceOnStart = 0

" }}}3

" Options {{{3

let g:CtrlSpaceSaveWorkspaceOnExit = 0
let g:CtrlSpaceLoadLastWorkspaceOnStart = 0

let g:CtrlSpaceCyclicList = 2
let g:CtrlSpaceMaxJumps = 120
let g:CtrlSpaceMaxSearches = 120
let g:CtrlSpaceDefaultSortOrder = 1
let g:CtrlSpaceUseMouseAndArrows = 1

" }}}3

" }}}2

" Doughnut {{{2

set runtimepath+=~/racine/public/doughnut

" }}}2

" }}}1

" Filtres {{{1

"  Narrow region (chrisbra/NrrwRgn) {{{2

nnoremap à :NarrowRegion<cr>

vnoremap à :NarrowRegion<cr>

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

"nnoremap <m-o> :Utl<cr>

let g:utl_cfg_hdl_scm_http = "!qutebrowser '%u#%f' &"

" }}}2

" }}}1

" Ligne de commande (:ex mode) {{{1

" CmdlineComplete (CmdlineComplete) {{{2

cmap <m-right> <Plug>CmdlineCompleteBackward
cmap <m-left> <Plug>CmdlineCompleteForward

cmap <m-s-t> <Plug>CmdlineCompleteBackward
cmap <m-t> <Plug>CmdlineCompleteForward

" }}}2

" }}}1

" Modes {{{1

" Cmdalias (coot/cmdalias_vim) {{{2

nnoremap <F11>c :CmdAliasToggle<cr>

augroup Cmdalias
	au!
	au VimEnter * CmdAlias ali\%[as] CmdAlias
	au VimEnter * CmdAlias h\%[elp] tab\ help
augroup END

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

" Visual multi {{{2

let g:VM_leader = 'ù'
"let g:VM_leader = {'default': '<F3>', 'visual': '<F3>', 'buffer': '<F3>'}

let g:VM_set_statusline = 2
let g:VM_silent_exit = 1

let g:VM_default_mappings = 0

let g:VM_maps = {}

let g:VM_maps['Find Under']  = '<D-m>'
let g:VM_maps["Select Cursor Down"] = '<D-n>'
let g:VM_maps["Select Cursor Up"]   = '<D-p>'

"let g:VM_maps["Select Operator"] = 'gs'

let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

" }}}2

" Multiple cursors {{{2

" let g:multi_cursor_use_default_mapping=0
"
" let g:multi_cursor_start_word_key      = '<D-n>'
" let g:multi_cursor_select_all_word_key = '<S-D-n>'
" let g:multi_cursor_start_key           = 'g<D-n>'
" let g:multi_cursor_select_all_key      = 'g<S-D-n>'
" let g:multi_cursor_next_key            = '<D-n>'
" let g:multi_cursor_prev_key            = '<D-p>'
" let g:multi_cursor_skip_key            = '<D-x>'
" let g:multi_cursor_quit_key            = '<Esc>'
"
" let g:multi_cursor_exit_from_visual_mode = 0
" let g:multi_cursor_exit_from_insert_mode = 0

" }}}2

" }}}1

" Recherche & Remplacement {{{1

" Grepper {{{2

nnoremap <D-g> :Grepper<cr>

" }}}2

" Esearch {{{2

let g:esearch = {
	\ 'adapter':    'ag',
	\ 'backend':    'nvim',
	\ 'out':        'qflist',
	\ 'batch_size': 1000,
	\ 'use':        ['visual', 'hlsearch', 'last'],
	\}

nmap <D-r> <Plug>(esearch)

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

" Calcul {{{1

" Crunch (arecarn/crunch.vim {{{2

nnoremap <C-=> :Crunch<space>

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

nnoremap <d-!> :new \| Ttoggle<cr>

nnoremap <d-$> :TREPLSendLine<cr>
vnoremap <d-$> :TREPLSendSelection<cr>

nnoremap <d-cr> :TREPLSendFile<cr>

" }}}2

" Neomake {{{2

nnoremap <D-m> :NeomakeSh<space>

let g:neomake_make_maker = {
	\ 'exe': 'make',
\ }

" }}}2

" }}}1

" Divers {{{1

" LineJuggler  {{{2

" (/)space pour ajouter une ligne
" (/)e pour échanger deux lignes

nmap ( [
nmap ) ]

" }}}2

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
