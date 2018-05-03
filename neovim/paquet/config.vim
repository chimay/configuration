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

nnoremap <C-F11>s :Subvert //<Left>

" }}}2

" }}}1

" Alignement {{{1

" Easy align (junegunn/vim-easy-align) {{{2

" Start interactive EasyAlign in visual mode (e.g. vipga)

xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)

nmap ga <Plug>(EasyAlign)

" Options

let g:easy_align_ignores = ['Comment', 'String']

" }}}2

" Tabular (godlygeek/tabular) {{{2

nnoremap <s-tab> :Tabularize /
vnoremap <s-tab> :Tabularize /

" }}}2

" }}}1

" Tableaux {{{1

" Table-mode (dhruvasagar/vim-table-mode) {{{2

let g:table_mode_always_active = 0

let g:table_mode_border = 1

" Mappings {{{3

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

" }}}3

" Caractères {{{3

let g:table_mode_separator     = '|'
let g:table_mode_corner        = '+'
let g:table_mode_corner_corner = '|'
let g:table_mode_fillchar      = '-'
let g:table_mode_delimiter     = ','
let g:table_mode_align_char    = ':'

" }}}3

" }}}2

" }}}1

" Bouts de code (snippets, bits, modèles) {{{1

"  UltiSnips (SirVer/ultisnips) {{{2

" Mappings {{{3

" Si tab est défini ici, le commenter dans Neocomplcache

" Unite & UltiSnips {{{4

function! UltiSnipsCallUnite()
	Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
	return ''
endfunction

inoremap <silent> <tab> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

"nnoremap <silent> ... a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

" }}}4

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:UltiSnipsListSnippets='<C-F5>l'

nnoremap <C-F5>e :UltiSnipsEdit<cr>
nnoremap <C-F5>a :UltiSnipsAddFiletypes<space>

" }}}3

" Données {{{3

let g:UltiSnipsSnippetsDir = $HOME . '/racine/config/edit/neovim/snippet'

let g:UltiSnipsSnippetDirectories=['snippet', 'UltiSnips']

" }}}3

let g:UltiSnipsEditSplit = 'horizontal'

" }}}2

" }}}1

" Commentaires {{{1

"  NERDCommenter (scrooloose/nerdcommenter) {{{2

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

" }}}2

"  TComment (tomtom/tcomment_vim) {{{2

let g:tcommentTextObjectInlineComment = '<C-F11>ic'

let g:tcommentBlankLines = 0

let g:tcommentOptions = {
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

" Copie {{{1

" Neoyank (Shougo/neoyank.vim) {{{2

let g:neoyank#limit = 120

let g:neoyank#file = $HOME . '/racine/plugin/data/unite/neoyank/history_yank'

nnoremap <D-y> :<c-u>Unite -prompt-direction=top history/yank<cr>

autocmd BufWinEnter \(*.asc\|*.gpg\) let g:neoyank_disable_write = 1

" }}}2

"  YankRing (YankRing.vim) {{{2

" Mappings {{{3

" Map exceptionnel

nnoremap <silent> ç :<C-U>YRShow<cr>

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

" }}}3

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

" Exchange (tommcdo/vim-exchange) {{{2

let g:exchange_no_mappings=1

nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

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

"  Netrw (plugin standard) {{{2

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

" Tri {{{3

let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
"let g:netrw_sort_options='i'

let g:netrw_sort_sequence ='[\/]$,\<core\%(\.\d\+\)\=\>'
let g:netrw_sort_sequence .='\.otl$'
let g:netrw_sort_sequence .=',\.p\?html\?$,\.php$,\.css$,\.js$'
let g:netrw_sort_sequence .=',\.h$,\.c$,\.cpp$'
let g:netrw_sort_sequence .=',\.py$,\.pyx$'
let g:netrw_sort_sequence .='*,\~$'

" }}}3

" Masque {{{3

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

" }}}3

" }}}2

" Dirvish {{{2

nnoremap <D-f> :Dirvish<cr>

" }}}2

" Vifm {{{2

let g:vifmSplitWidth = 120

" }}}2

" }}}1

" Exploration multiple {{{1

" Denite {{{2

" Mappings {{{3

nnoremap é          :<c-u>Denite line<cr>

nnoremap §          :<c-u>Denite unite:outline:folding<cr>

nnoremap °          :<c-u>Denite -mode=normal buffer<cr>

nnoremap è          :<c-u>Denite -mode=normal jump<cr>

nnoremap ù          :<c-u>Denite file_mru<cr>

nnoremap µ          :<c-u>Denite -root-markers=.racine-projet file_rec<cr>
nnoremap <s-µ>      :<c-u>Denite -root-markers=.racine-projet file_rec<cr>

" nnoremap µ          :<c-u>DeniteProjectDir -root-markers=.racine-projet file_rec<cr>
" nnoremap <s-µ>      :<c-u>DeniteProjectDir -root-markers=.racine-projet file_rec<cr>

" nnoremap µ          :<c-u>DeniteBufferDir file_rec<cr>
" nnoremap <s-µ>      :<c-u>DeniteBufferDir file_rec<cr>

nnoremap £          :<c-u>Denite tag<cr>

" }}}3

" Mappings en mode normal dans denite {{{3

call denite#custom#map(
	  \ 'normal',
	  \ '<Esc>',
	  \ '<denite:enter_mode:normal>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'normal',
	  \ 'i',
	  \ '<denite:enter_mode:insert>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'normal',
	  \ '<Insert>',
	  \ '<denite:enter_mode:insert>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'normal',
	  \ '<Up>',
	  \ '<denite:move_to_previous_line>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'normal',
	  \ '<Down>',
	  \ '<denite:move_to_next_line>',
	  \ 'noremap'
	  \)

" }}}3

" Mappings en mode insertion dans denite {{{3

call denite#custom#map(
	  \ 'insert',
	  \ '<Esc>',
	  \ '<denite:enter_mode:normal>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<Insert>',
	  \ '<denite:enter_mode:insert>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<Up>',
	  \ '<denite:move_to_previous_line>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<Down>',
	  \ '<denite:move_to_next_line>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<C-P>',
	  \ '<denite:move_to_previous_line>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<C-N>',
	  \ '<denite:move_to_next_line>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<M-p>',
	  \ '<denite:assign_previous_matched_text>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<M-n>',
	  \ '<denite:assign_next_matched_text>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<S-Up>',
	  \ '<denite:assign_previous_text>',
	  \ 'noremap'
	  \)

call denite#custom#map(
	  \ 'insert',
	  \ '<S-Down>',
	  \ '<denite:assign_next_text>',
	  \ 'noremap'
	  \)

" }}}3

" Options {{{3

call denite#custom#option('default', {
	  \ 'highlight_mode_normal' : 'Search',
	  \ 'highlight_mode_insert' : 'Search',
	  \ 'highlight_matched_char' : 'false',
	  \ 'highlight_matched_range' : 'false',
	  \ })

call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher_substring'])

" }}}3

" }}}2

"  Unite (Shougo/unite.vim) {{{2

" Mappings {{{3

nnoremap <C-F1>       :<c-u>Unite -prompt-direction=top<space>

nnoremap <C-F2>       :<c-u>Unite -prompt-direction=top source<cr>

"nnoremap z=         :<c-u>Unite -winheight=15 spell_suggest<cr>

"nnoremap é          :<c-u>Unite -start-insert -prompt-direction=top line<cr>

"nnoremap §          :<c-u>Unite -start-insert -prompt-direction=top outline:folding<cr>

"nnoremap °          :<c-u>Unite -start-insert -prompt-direction=top buffer<cr>

"nnoremap è          :<c-u>Unite -prompt-direction=top jump<cr>

"nnoremap ù          :<c-u>Unite -start-insert -prompt-direction=top neomru/file buffer<cr>
"nnoremap µ          :<c-u>Unite -start-insert -prompt-direction=top file_rec/neovim<cr>
"nnoremap <s-µ>      :<c-u>Unite -start-insert -prompt-direction=top file_rec/neovim<cr>

"nnoremap £          :<c-u>Unite -start-insert -prompt-direction=top tag<cr>

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

" }}}3

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

" Ignore {{{3

call unite#custom#source('file_rec', 'ignore_globs',
	\ split(&wildignore, ','))

" }}}3

" Motifs flous {{{3

" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" }}}3

" Présentation {{{3

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

" Autocommandes {{{3

autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()
	imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction

" }}}3

" }}}2

" Neomru (Shougo/neomru.vim) {{{2

let g:neomru#file_mru_path = $HOME . '/racine/plugin/data/unite/neomru/file'

let g:neomru#file_mru_limit = 900

let g:neomru#directory_mru_path = $HOME . '/racine/plugin/data/unite/neomru/directory'

let g:neomru#directory_mru_limit = 300

let g:neomru#do_validate = 0

call unite#custom#source('neomru/file', 'ignore_globs',
			\ [
			\ '/home/*/racine/plugin/manager/**/doc/*.txt',
			\ 'term://*'
			\ ])

" }}}2

" Unite-outline (Shougo/unite-outline) {{{2

" Pour compatibilité, variable dépréciée dans unite
" Réglé
"let g:unite_abbr_highlight = 'Normal'

" }}}2

" FZF (junegunn/fzf.vim) {{{2

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

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

" }}}2

" CtrlSpace (szw/vim-ctrlspace) {{{2

" Mappings {{{3

let g:CtrlSpaceSetDefaultMapping = 1

let g:CtrlSpaceDefaultMappingKey = "<D-Space>"

let g:CtrlSpaceUseMouseAndArrowsInTerm = 1

nnoremap <c-space> :CtrlSpace<cr>
nnoremap <c-cr> :CtrlSpace<cr>

nnoremap <C-Left> :CtrlSpaceGoUp<cr>
nnoremap <C-Right> :CtrlSpaceGoDown<cr>

nnoremap <C-PageUp> :CtrlSpaceGoUp<cr>
nnoremap <C-PageDown> :CtrlSpaceGoDown<cr>

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

nnoremap <m-cr> :Utl<cr>

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

"  Submode (kana/vim-submode) {{{2

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

" }}}2

" Cmdalias (coot/cmdalias_vim) {{{2

augroup Cmdalias

	au!

	au VimEnter * CmdAlias ali\%[as] CmdAlias

	au VimEnter * CmdAlias h\%[elp] tab\ help

augroup END

" }}}2

" Cmdmatch (majkinetor/unite-cmdmatch) {{{2

cmap <c-o> <Plug>(unite_cmdmatch_complete)

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

" Sneak (justinmk/vim-sneak) {{{2

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

" }}}2

" }}}1

" Calcul {{{1

" Crunch (arecarn/crunch.vim {{{2

nnoremap <D-=> :Crunch<cr>

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

nnoremap <D-$> :new \| Ttoggle<cr>

nnoremap <D-CR> :TREPLSendLine<cr>
vnoremap <D-CR> :TREPLSendSelection<cr>

nnoremap <D-x> :TREPLSendFile<cr>

" }}}2

" Neomake {{{2

nnoremap <D-m> :NeomakeSh<space>

let g:neomake_make_maker = {
	\ 'exe': 'make',
\ }

" }}}2

" Terminus (brettanomyces/nvim-terminus) {{{2

nnoremap <D-!> :TerminusOpen<space>

tmap <c-x>e <Plug>TerminusEditCommand

tmap <c-x>v <Plug>TerminusInterceptCommand

tmap <s-cr> <Plug>TerminusEditCommand
tmap <c-cr> <Plug>TerminusInterceptCommand

let g:terminus_default_prompt = '>'

" }}}2

" Deol {{{2

nnoremap <D-s> :Deol<cr>

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
