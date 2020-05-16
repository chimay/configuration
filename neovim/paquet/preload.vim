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

nnoremap <F2> :Scratch<space>

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

nnoremap <D-f>a :Ag<cr>
nnoremap <D-f>b :Buffers<cr>
nnoremap <D-f>c :Commands<cr>
nnoremap <D-f>C :Commits<cr>
nnoremap <D-f>f :Files<cr>
nnoremap <D-f>F :Filetypes<cr>
nnoremap <D-f>g :GitFiles<cr>
nnoremap <D-f>h :History<cr>
nnoremap <D-f>H :Helptags<cr>
nnoremap <D-f>l :Lines<cr>
nnoremap <D-f>m :Marks<cr>
nnoremap <D-f>M :Maps<cr>
nnoremap <D-f>r :Rg<cr>
nnoremap <D-f>s :Snippets<cr>
nnoremap <D-f>t :Tags<cr>
nnoremap <D-f>w :Windows<cr>

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

nmap § <plug>(wheel-tree)
nmap é <plug>(wheel-grep)
nmap è <plug>(wheel-outline)
nmap ù <plug>(wheel-mru)
nmap £ <plug>(wheel-locate)
nmap µ <plug>(wheel-tags)
nmap ç <plug>(wheel-yank-list)
nmap ° <plug>(wheel-yank-plain)

nmap <d-h> <plug>(wheel-history)

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

" }}}1

" Recherche & Remplacement {{{1

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
