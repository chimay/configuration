" vim: set filetype=vim :

" {{{ Documentation

" Lors de l’utilisation d’un <plug>, seuls les maps récursifs fonctionnent :
"
" nmap bidule <plug>PluginBidule
"
" et pas :
"
" nnoremap bidule <plug>PluginBidule

" }}}

" {{{ Touches pour maps / préfixes de maps

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

" }}}

" Éviter les mappings par défaut des plugins
" ------------------------------------------------------------------------

let g:no_plugin_maps = 1

" Configuration des plugins
" ------------------------------------------------------------------------

" {{{ Librairies : fonctions, utilitaires

" {{{ Tlib (tomtom/tlib_vim)

"nnoremap ...p :TBrowseOutput<space>

"nnoremap ...o :exec 'e' fnameescape(tlib#input#List('s', 'Old file', v:oldfiles))<cr>

" }}}

" }}}

" ------------------------------------

" {{{ Abréviations

" {{{ Abolish (tpope/vim-abolish)

let g:abolish_save_file = $HOME . '/racine/plugin/data/abolish/abreviations'

nnoremap <C-F11>s :Subvert //<Left>

" }}}

" }}}

" {{{ Alignement & Tableaux

" {{{ Alignement

" {{{ Easy align (junegunn/vim-easy-align)

" Start interactive EasyAlign in visual mode (e.g. vipga)

xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)

nmap ga <Plug>(EasyAlign)

" Options

let g:easy_align_ignores = ['Comment', 'String']

" }}}

" {{{ Tabular (godlygeek/tabular)

nnoremap <s-tab> :Tabularize /
vnoremap <s-tab> :Tabularize /

" }}}

" }}}

" {{{ Tableaux

" {{{ Table-mode (dhruvasagar/vim-table-mode)

let g:table_mode_always_active = 0

let g:table_mode_border = 1

" {{{ Mappings

nnoremap <bar> :TableModeToggle<cr>

let g:table_mode_map_prefix = '<bs>'

nnoremap <bs>S :TableSort<cr>

let g:table_mode_realign_map = '<bs>r'
let g:table_mode_delete_row_map = '<bs>dd'
let g:table_mode_delete_column_map = '<bs>dc'
let g:table_mode_add_formula_map = '<bs>fa'
let g:table_mode_eval_formula_map = '<bs>fe'
let g:table_mode_echo_cell_map = '<bs>?'
let g:table_mode_sort_map = '<bs>s'

let g:table_mode_motion_up_map = '{<Bar>'
let g:table_mode_motion_down_map = '}<Bar>'
let g:table_mode_motion_left_map = '[<Bar>'
let g:table_mode_motion_right_map = ']<Bar>'
let g:table_mode_cell_text_object_a_map = 'a<Bar>'
let g:table_mode_cell_text_object_i_map = 'i<Bar>'

" }}}

" {{{ Caractères

let g:table_mode_separator     = '|'
let g:table_mode_corner        = '+'
let g:table_mode_corner_corner = '|'
let g:table_mode_fillchar      = '-'
let g:table_mode_delimiter     = ','
let g:table_mode_align_char    = ':'

" }}}

" }}}

" }}}

" }}}

" {{{ Bouts de code (snippets, bits, modèles)

"  {{{ UltiSnips (SirVer/ultisnips)
" ------------------------------------------------------------------------

" {{{ Mappings

" Si tab est défini ici, le commenter dans Neocomplcache

" {{{ Unite & UltiSnips

function! UltiSnipsCallUnite()
	Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
	return ''
endfunction

inoremap <silent> <tab> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

"nnoremap <silent> ... a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

" }}}

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:UltiSnipsListSnippets='<C-F5>l'

nnoremap <C-F5>e :UltiSnipsEdit<cr>
nnoremap <C-F5>a :UltiSnipsAddFiletypes<space>

" }}}

" {{{ Données

let g:UltiSnipsSnippetsDir = $HOME . '/racine/config/edit/vim/snippet'

let g:UltiSnipsSnippetDirectories=['snippet', 'UltiSnips']

" }}}

let g:UltiSnipsEditSplit = 'horizontal'

" }}}

" }}}

" {{{ Commentaires

"  {{{ NERDCommenter (scrooloose/nerdcommenter)
" ------------------------------------------------------------------------

let NERDCreateDefaultMappings = 0

map <s-cr> <plug>NERDCommenterToggle

map <C-F11>cc <plug>NERDCommenterToggle
map <C-F11>c<space> <plug>NERDCommenterComment
map <C-F11>cn <plug>NERDCommenterNest
map <C-F11>cm <plug>NERDCommenterMinimal
map <C-F11>ci <plug>NERDCommenterInvert
map <C-F11>cs <plug>NERDCommenterSexy
map <C-F11>cy <plug>NERDCommenterYank
map <C-F11>c$ <plug>NERDCommenterToEOL
map <C-F11>cA <plug>NERDCommenterAppend
map <C-F11>cI <plug>NERDCommenterInsert
map <C-F11>ca <plug>NERDCommenterAltDelims
map <C-F11>cl <plug>NERDCommenterAlignLeft
map <C-F11>cb <plug>NERDCommenterAlignBoth
map <C-F11>cu <plug>NERDCommenterUncommentLine

" }}}

"  {{{ TComment (tomtom/tcomment_vim)
" ------------------------------------------------------------------------

let g:tcommentTextObjectInlineComment = '<C-F11>ic'

let g:tcommentBlankLines = 0

let g:tcommentOptions = {
	\ 'col': 1
\}

let g:tcomment_types = {
	\ 'vim': '" %s'
\}

" }}}

" }}}

" {{{ Complétion

"  {{{ Deoplete (Shougo/deoplete.nvim)
" ------------------------------------------------------------------------

let g:deoplete#enable_at_startup = 1

let g:deoplete#auto_complete_start_length = 2

let g:deoplete#enable_camel_case = 1

" }}}

" }}}

" {{{ Copie

" {{{ Neoyank (Shougo/neoyank.vim)

let g:neoyank#limit = 120

let g:neoyank#file = $HOME . '/racine/plugin/data/unite/neoyank/history_yank'

nnoremap ç :<c-u>Unite -prompt-direction=top history/yank<cr>

autocmd BufWinEnter \(*.asc\|*.gpg\) let g:neoyank_disable_write = 1

" }}}

"  {{{ YankRing (YankRing.vim)
" ------------------------------------------------------------------------

" {{{ Mappings

" Map exceptionnel

nnoremap <silent> <D-ç> :<C-U>YRShow<cr>

" Maps ordinaires

nnoremap <silent> <C-F11>y :<C-U>YRSearch<cr>

nnoremap <silent> <C-F11><C-F11>y :YRToggle<cr>

let g:yankring_replace_n_pkey = '<C-p>'
let g:yankring_replace_n_nkey = '<C-n>'

" let g:yankring_replace_n_pkey = '<m-y>'
" let g:yankring_replace_n_nkey = '<m-s-y>'

" Y, pour compléter C et D

function! YRRunAfterMaps()
	nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" }}}

" {{{ Options

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

let g:yankring_history_dir = $HOME . '/racine/plugin/data/yankring'
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

" }}}

" }}}

" }}}

" {{{ Paires : (), [], {}, <>, <a></a>, etc

"  {{{ Auto-pairs (jiangmiao/auto-pairs)

" {{{ Options

let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }

let g:AutoPairsFlyMode = 0

let g:AutoPairsShortcutBackInsert = '<m-space>'
let g:AutoPairsShortcutJump = '<m-)>'

let g:AutoPairsCenterLine = 1

let g:AutoPairsMapBS = 1
let g:AutoPairsMapCR = 1
let g:AutoPairsMapSpace = 0

" }}}

" {{{ Mappings

let g:AutoPairsShortcutToggle = '<C-F11><C-F11>('

imap <s-space>  <C-R>=AutoPairsSpace()<CR>

" }}}

" }}}

" }}}

" {{{ Déplacement & Copie

" {{{ Textmanip (t9md/vim-textmanip)

xmap z<Down> <Plug>(textmanip-move-down)
xmap z<Up> <Plug>(textmanip-move-up)
xmap z<Left> <Plug>(textmanip-move-left)
xmap z<Right> <Plug>(textmanip-move-right)

xmap z<S-Down> <Plug>(textmanip-duplicate-down)
xmap z<S-Up> <Plug>(textmanip-duplicate-up)

nmap z<S-Down> <Plug>(textmanip-duplicate-down)
nmap z<S-Up> <Plug>(textmanip-duplicate-up)

" }}}

" {{{ Exchange (tommcdo/vim-exchange)

let g:exchange_no_mappings=1

nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

" }}}

" }}}

" {{{ Espaces

" {{{ DeleteTrailingWhitespace (DeleteTrailingWhitespace)

let g:DeleteTrailingWhitespace = 1

let g:DeleteTrailingWhitespace_Action = 'delete'
"let g:DeleteTrailingWhitespace_Action = 'ask'

let g:DeleteTrailingWhitespace_ChoiceAffectsHighlighting = 0

" }}}

" }}}

" {{{ Exploration de l’arborescence du système de fichiers

"  {{{ Netrw (plugin standard)
" ------------------------------------------------------------------------

"let g:loaded_netrw       = 0
"let g:loaded_netrwPlugin = 0

let g:netrw_home           = $HOME . '/racine/plugin/data/netrw'

let g:netrw_menu           = 1

let g:netrw_dirhistmax     = 712

let g:netrw_keepdir        = 0

let g:netrw_liststyle      = 1
let g:netrw_special_syntax = 1
let g:netrw_banner         = 1
let g:netrw_browse_split   = 0
let g:netrw_preview        = 0
let g:netrw_fastbrowse     = 1
let g:netrw_silent         = 1

let g:netrw_ctags          = 'ctags'
let g:netrw_ssh_cmd        = 'ssh'
let g:netrw_browsex_viewer = "kfmclient exec"

" {{{ Tri

let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
"let g:netrw_sort_options='i'

let g:netrw_sort_sequence ='[\/]$,\<core\%(\.\d\+\)\=\>'
let g:netrw_sort_sequence .='\.otl$'
let g:netrw_sort_sequence .=',\.p\?html\?$,\.php$,\.css$,\.js$'
let g:netrw_sort_sequence .=',\.h$,\.c$,\.cpp$'
let g:netrw_sort_sequence .=',\.py$,\.pyx$'
let g:netrw_sort_sequence .='*,\~$'

" }}}

" {{{ Masque

let g:netrw_list_hide = '\.un\~$,\.renduHtml$,\.sessionvim$'
let g:netrw_list_hide .= ',^tags$,^TAGS$,^cscope\.'

let g:netrw_list_hide .= ',^\.tarexclude$,^\.directory$'

let g:netrw_list_hide .= ',\.o$,\.so$'
let g:netrw_list_hide .= ',\.pyc$,\.elc$,\.zwc$'
let g:netrw_list_hide .= ',\.dll$,\.obj$,\.bak$,\.exe$'

let g:netrw_list_hide .= ',^RCS[\/]$,^CVS[\/]$,^\.hg[\/]$,^\.bzr[\/]$,^\.git[\/]$,\.mtn$,^_darcs[\/]$'
let g:netrw_list_hide .= ',^.hgignore$,^.bzrignore$,^.hgtags$'

let g:netrw_list_hide .= ',\.aux$,,\.log$,\.maf$,\.toc$,\.ptc$,\.mtc$'

let g:netrw_hide = 1

" }}}

" }}}

" {{{ Dirvish

nnoremap <D-f> :Dirvish<cr>

" }}}

" Vifm {{{2

let g:vifmSplitWidth = 120

" }}}2

" }}}

" {{{ Exploration multiple

"  {{{ Unite (Shougo/unite.vim)
" ------------------------------------------------------------------------

" {{{ Mappings

nnoremap <C-F1>       :<c-u>Unite -prompt-direction=top<space>

nnoremap <C-F2>       :<c-u>Unite -prompt-direction=top source<cr>

nnoremap z=         :<c-u>Unite -winheight=15 spell_suggest<cr>

nnoremap é          :<c-u>Unite -start-insert -prompt-direction=top line<cr>

nnoremap §          :<c-u>Unite -start-insert -prompt-direction=top outline:folding<cr>

nnoremap °          :<c-u>Unite -start-insert -prompt-direction=top buffer<cr>

nnoremap è          :<c-u>Unite -prompt-direction=top jump<cr>

nnoremap ù          :<c-u>Unite -start-insert -prompt-direction=top neomru/file buffer<cr>
nnoremap µ          :<c-u>Unite -start-insert -prompt-direction=top file_rec<cr>
nnoremap <s-µ>      :<c-u>Unite -start-insert -prompt-direction=top file_rec<cr>

nnoremap £          :<c-u>Unite -start-insert -prompt-direction=top tag<cr>

" nnoremap <C-F3>b      :<c-u>Unite -prompt-direction=top buffer<cr>
" nnoremap <C-F3>B      :<c-u>Unite -prompt-direction=top bookmark<cr>
" nnoremap <C-F3>c      :<c-u>Unite -prompt-direction=top command<cr>
" nnoremap <C-F3>d      :<c-u>Unite -prompt-direction=top directory<cr>
" nnoremap <C-F3>f      :<c-u>Unite -prompt-direction=top file_rec/async<cr>
" nnoremap <C-F3>g      :<c-u>Unite -prompt-direction=top grep<cr>
" nnoremap <C-F3>m      :<c-u>Unite -prompt-direction=top mapping<cr>
" nnoremap <C-F3>M      :<c-u>Unite -no-split output:message<cr>
" nnoremap <C-F3>h      :<c-u>Unite -prompt-direction=top help<cr>
" nnoremap <C-F3>l      :<c-u>Unite -prompt-direction=top line<cr>
" nnoremap <C-F3>q      :<c-u>Unite -no-quit -prompt-direction=top quickfix<cr>
" nnoremap <C-F3>r      :<c-u>Unite -prompt-direction=top file_mru<cr>
" nnoremap <C-F3>t      :<c-u>Unite -prompt-direction=top tag<cr>
" nnoremap <C-F3>T      :<c-u>Unite -prompt-direction=top gtags/grep<cr>
" nnoremap <C-F3>o      :<c-u>Unite -prompt-direction=top outline<cr>
" nnoremap <C-F3>z      :<c-u>Unite -prompt-direction=top outline:folding<cr>
" nnoremap <C-F3>'      :<c-u>Unite -prompt-direction=top mark<cr>
" nnoremap <C-F3>"      :<c-u>Unite -prompt-direction=top register<cr>
" nnoremap <C-F3>!      :<c-u>Unite -prompt-direction=top launcher<cr>
" nnoremap <C-F3>:      :<c-u>Unite -prompt-direction=top history/command<cr>
" nnoremap <C-F3>/      :<c-u>Unite -prompt-direction=top history/search<cr>
" nnoremap <C-F3>y      :<c-u>Unite -prompt-direction=top history/yank<cr>
" nnoremap <C-F3>j      :<c-u>Unite -prompt-direction=top jump<cr>
" nnoremap <C-F3><tab>  :<c-u>Unite -prompt-direction=top jump<cr>
" nnoremap <C-F3><bs>   :<c-u>Unite -prompt-direction=top change<cr>

"nnoremap <C-F3>a      :<c-u>UniteBookmarkAdd<cr>

"nnoremap <C-F3>s      :<c-u>Unite junkfile<cr>

" }}}

" {{{ Données

let g:unite_data_directory = $HOME . '/racine/plugin/data/unite'

let g:unite_source_file_mru_long_limit = 12743
let g:unite_source_mru_update_interval = 900

let g:unite_source_directory_mru_long_limit = 3600

" }}}

" {{{ Répertoires

let g:unite_kind_openable_cd_command = 'cd'
let g:unite_kind_openable_lcd_command = 'lcd'

" }}}

" {{{ Ignore

call unite#custom#source('file_rec', 'ignore_globs',
	\ split(&wildignore, ','))

" }}}

" {{{ Motifs flous

" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" }}}

" {{{ Présentation

let g:unite_split_rule = 'dynamicbottom'

call unite#custom#profile('default', 'context', {
\   'direction' : 'dynamicbottom'
\ })

call unite#custom#profile('default', 'context', {
\   'winheight' : 20
\ })

call unite#custom#profile('default', 'context', {
\   'winwidth' : 20
\ })

let g:unite_enable_split_vertically = 0

let g:unite_prompt = 'unite> '

" }}}

" {{{ Copie & Collage

let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1

let g:unite_source_history_yank_limit = 543

" }}}

" {{{ Recherche grep

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

" }}}

" {{{ Autocommandes

autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()
	imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction

" }}}

" }}}

" {{{ Neomru (Shougo/neomru.vim)

let g:neomru#file_mru_path = $HOME . '/racine/plugin/data/unite/neomru/vim-file'

let g:neomru#file_mru_limit = 300

let g:neomru#directory_mru_path = $HOME . '/racine/plugin/data/unite/neomru/vim-directory'

let g:neomru#directory_mru_limit = 1000

let g:neomru#do_validate = 0

call unite#custom#source('neomru/file', 'ignore_globs',
			\ [
			\ '/home/*/racine/plugin/manager/**/doc/*.txt',
			\ 'term://*'
			\ ])

" }}}

" {{{ Unite-outline (Shougo/unite-outline)

" Pour compatibilité, variable dépréciée dans unite
" Réglé
"let g:unite_abbr_highlight = 'Normal'

" }}}

" {{{ FZF (junegunn/fzf.vim)

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In vim, you can set up fzf window using a Vim command
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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/racine/hist/fzf'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=0 ctermbg=3
  highlight fzf2 ctermfg=0 ctermbg=3
  highlight fzf3 ctermfg=0 ctermbg=3
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" }}}

" {{{ CtrlSpace (szw/vim-ctrlspace)

" {{{ Mappings

let g:CtrlSpaceSetDefaultMapping = 1

let g:CtrlSpaceDefaultMappingKey = "<D-Space>"

let g:CtrlSpaceUseMouseAndArrowsInTerm = 1

nnoremap <c-space> :CtrlSpace<cr>
nnoremap <c-cr> :CtrlSpace<cr>

nnoremap <C-Left> :CtrlSpaceGoUp<cr>
nnoremap <C-Right> :CtrlSpaceGoDown<cr>

nnoremap <C-PageUp> :CtrlSpaceGoUp<cr>
nnoremap <C-PageDown> :CtrlSpaceGoDown<cr>

" }}}

" {{{ Données

let g:CtrlSpaceCacheDir = $HOME . '/racine/plugin/data/ctrlspace'

let g:CtrlSpaceProjectRootMarkers = ['.racine-projet']

let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp)[\/]'

let g:CtrlSpaceSearchResonators = ['.', '/', '\', '_', '-']

" }}}

" {{{ Limites

let g:CtrlSpaceMaxFiles = 500
let g:CtrlSpaceMaxSearchResults = 200

let g:CtrlSpaceSearchTiming = [50, 500]

" }}}

" {{{ Recherche de fichiers

let g:CtrlSpaceFileEngine = "auto"

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" }}}

" {{{ Présentation

let g:CtrlSpaceUseHorizontalSplits = 1

let g:CtrlSpaceHeight = 1
let g:CtrlSpaceMaxHeight = 0

let g:CtrlSpaceShowUnnamed = 2

let g:CtrlSpaceUseTabline = 0

let g:CtrlSpaceUnicodeFont = 1

" }}}

" {{{ Workspaces

let g:CtrlSpaceSaveWorkspaceOnExit = 0

let g:CtrlSpaceSaveWorkspaceOnSwitch = 0

let g:CtrlSpaceLoadLastWorkspaceOnStart = 0

" }}}

" {{{ Options

let g:CtrlSpaceSaveWorkspaceOnExit = 0
let g:CtrlSpaceLoadLastWorkspaceOnStart = 0

let g:CtrlSpaceCyclicList = 2
let g:CtrlSpaceMaxJumps = 120
let g:CtrlSpaceMaxSearches = 120
let g:CtrlSpaceDefaultSortOrder = 1
let g:CtrlSpaceUseMouseAndArrows = 1

" }}}

" }}}

" }}}

" {{{ Filtres

"  {{{ Narrow region (chrisbra/NrrwRgn)
" ------------------------------------------------------------------------

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

" }}}

" }}}

" {{{ Historique d’undo

" {{{ Undotree (mbbill/undotree)

nnoremap <s-bs> :UndotreeToggle<cr>

" }}}

" }}}

" {{{ Liens

"  {{{ Utl (utl.vim)
" ------------------------------------------------------------------------

nnoremap <m-cr> :Utl<cr>

" }}}

" }}}

" {{{ Ligne de commande (:ex mode)

" {{{ CmdlineComplete (CmdlineComplete)

cmap <m-right> <Plug>CmdlineCompleteBackward
cmap <m-left> <Plug>CmdlineCompleteForward

cmap <m-s-t> <Plug>CmdlineCompleteBackward
cmap <m-t> <Plug>CmdlineCompleteForward

" }}}

" }}}

" {{{ Modes

"  {{{ Submode (kana/vim-submode)
" ------------------------------------------------------------------------

let g:submode_timeout = 0
"let g:submode_timeout = 12000

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#leave_with('undo/redo', 'n', '', '<Esc>')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

call submode#enter_with('change-list', 'n', '', 'g;', 'g;')
call submode#enter_with('change-list', 'n', '', 'g,', 'g,')
call submode#leave_with('change-list', 'n', '', '<Esc>')
call submode#map('change-list', 'n', '', ';', 'g;')
call submode#map('change-list', 'n', '', ',', 'g,')

" }}}

" {{{ Cmdalias (coot/cmdalias_vim)

augroup Cmdalias

	au!

	au VimEnter * CmdAlias ali\%[as] CmdAlias

	au VimEnter * CmdAlias h\%[elp] tab\ help

	au VimEnter * CmdAlias nbu Unite\ -log\ neobundle/update
	au VimEnter * CmdAlias nbi NeoBundleInstall
	au VimEnter * CmdAlias nbx NeoBundleClean

augroup END

" }}}

" {{{ Cmdmatch (majkinetor/unite-cmdmatch)

cmap <c-o> <Plug>(unite_cmdmatch_complete)

" }}}

" }}}

" {{{ Objets texte

" {{{ Targets (wellle/targets.vim)

let g:targets_aiAI = 'aiAI'
let g:targets_nlNL = 'jkJK'
let g:targets_pairs = '()b {}B []r <>a'
let g:targets_quotes = '" '' `'
let g:targets_separators = ', . ; : + - = ~ _ * # / | \ & $'

" }}}

" {{{ Textobj-user & dérivés (kana/vim-textobj-user)

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

" }}}

" }}}

" {{{ Recherche & Remplacement

" {{{ Grepper

nnoremap <D-g> :Grepper<cr>

" }}}

" {{{ Esearch

let g:esearch = {
	\ 'adapter':    'ag',
	\ 'backend':    'nvim',
	\ 'out':        'qflist',
	\ 'batch_size': 1000,
	\ 'use':        ['visual', 'hlsearch', 'last'],
	\}

nmap <D-r> <Plug>(esearch)

" }}}

" {{{ Quickfix reflector (stefandtw/quickfix-reflector.vim)

let g:qf_modifiable = 1
let g:qf_write_changes = 1
let g:qf_join_changes = 1

" }}}

" {{{ QFGrep

" nmap <buffer> \r <Plug>QFRestore
" nmap <buffer> \v <Plug>QFGrepV
" nmap <buffer> \g <Plug>QFGrepG

let g:QFG_hi_prompt='guifg=#5B3C11 guibg=black ctermfg=3 ctermbg=NONE'
let g:QFG_hi_info='guifg=#5B3C11 guibg=black ctermfg=3 ctermbg=NONE'
let g:QFG_hi_error='guifg=#5B3C11 guibg=black ctermfg=3 ctermbg=NONE'

" }}}

" {{{ Sneak (justinmk/vim-sneak)

" 2-character Sneak (default)

nmap <D-;> <Plug>Sneak_s
nmap <D-,> <Plug>Sneak_S

" visual-mode

xmap <D-;> <Plug>Sneak_s
xmap <D-,> <Plug>Sneak_S

" operator-pending-mode

omap <D-;> <Plug>Sneak_s
omap <D-,> <Plug>Sneak_S

" explicit repeat (as opposed to implicit 'clever-s' repeat)

"map s <Plug>SneakNext
"map S <Plug>SneakPrevious

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

" force streak-mode always

"nmap <D-;> <Plug>(SneakStreak)
"nmap <D-,> <Plug>(SneakStreakBackward)

nmap <expr> ; sneak#is_sneaking() ? '<Plug>SneakNext' : ';'
nmap <expr> , sneak#is_sneaking() ? '<Plug>SneakPrevious' : ','

let g:sneak#prompt = 'sneak [char-char] > '

let g:sneak#f_reset      = 0
let g:sneak#s_next       = 1
let g:sneak#absolute_dir = 0
let g:sneak#textobject_z = 1
let g:sneak#use_ic_scs   = 1

let g:sneak#map_netrw    = 1

let g:sneak#streak       = 1
let g:sneak#streak_esc = "\<space>"

" }}}

" }}}

" {{{ Calcul

" {{{ Crunch (arecarn/crunch.vim

nnoremap <D-=> :Crunch<cr>

" }}}

" {{{ Increment activator (nishigori/increment-activator)

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

" }}}

" }}}

" {{{ Terminal

" {{{ Neoterm (kassio/neoterm)

nnoremap <D-$> :Ttoggle<cr>

nnoremap <D-CR> :TREPLSendLine<cr>
vnoremap <D-CR> :TREPLSendSelection<cr>

nnoremap <D-x> :TREPLSendFile<cr>

" }}}

" {{{ Neomake

nnoremap <D-m> :NeomakeSh<space>

let g:neomake_make_maker = {
	\ 'exe': 'make',
\ }

" }}}

" {{{ Terminus (brettanomyces/nvim-terminus)

nnoremap <D-!> :TerminusOpen<space>

tmap <c-x>e <Plug>TerminusEditCommand

tmap <c-x>v <Plug>TerminusInterceptCommand

tmap <s-cr> <Plug>TerminusEditCommand
tmap <c-cr> <Plug>TerminusInterceptCommand

let g:terminus_default_prompt = '>'

" }}}

" }}}

" {{{ Sans distraction

" {{{ Goyo (junegunn/goyo.vim)

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}

" {{{ Limelight (junegunn/limelight.vim)

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

" }}}

" }}}

" Thème {{{1

" Base 16 {{{2

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

" }}}2

" }}}1

" {{{ Divers

" {{{ Unimpaired (tpope/vim-unimpaired)

nmap ( [
nmap ) ]

" }}}

" }}}
