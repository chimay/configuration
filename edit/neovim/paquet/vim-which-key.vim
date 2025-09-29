" vim: set filetype=vim :

" documentation {{{1

"call which_key#register('<mykey>', "g:which_key_mykey_map")

"nnoremap <silent> <mykey> <cmd>WhichKey '<mykey>'<cr>

" only loads the dictionary maps, not the others
"nnoremap <silent> <mykey> <cmd>WhichKey! g:which_key_mykey_map<cr>

"call which_key#register('<cr>', "g:which_key_main_map")
"nnoremap <silent> <cr> <cmd>WhichKey '<cr>'<cr>

" config {{{1

let g:which_key_use_floating_win = 1

let g:which_key_timeout = 300
let g:which_key_exit = "\<esc>"

" main prefix {{{1

nnoremap <silent> <leader> <cmd>WhichKey! g:which_key_main_map<cr>
nnoremap <silent> <cr> <cmd>WhichKey! g:which_key_main_map<cr>

let g:which_key_main_map = {}

" help {{{2

let g:which_key_main_map.h = {
	\ 'name' : '+help',
	\ 'h' : ["library#feedkeys(':tab help ')", 'help'],
	\ 'g' : ["library#feedkeys(':tab helpgrep ')", 'helpgrep'],
	\ 'f' : ['library#toggle_help_filetype()', 'toggle help filetype'],
	\ 't' : ['library#helptags()', 'help tags'],
	\ 'm' : ['library#manual()', 'help tags'],
	\ }

" display {{{2

let g:which_key_main_map.d = {
	\ 'name' : '+display',
	\ 'l' : ['library#toggle_relative_linum()'                    , 'toggle relative line numbers'] ,
	\ 'f' : [ "library#execute('set guifont=*')"                  , 'gui font']                     ,
	\ 'F' : [ "library#feedkeys(':GuiFont DejaVu Sans Mono:h12')" , 'gui font (neovim-qt)']         ,
	\ 'c' : [ "library#feedkeys(':set cmdheight=')"               , 'set cmd height']               ,
	\ }

" file {{{2

let g:which_key_main_map.f = {
	\ 'name' : '+file',
	\ 'e' : ['library#edit_in_current_file_subtree()', 'edit in subtree'],
	\ 'r' : ['library#read_in_current_file_subtree()', 'read in subtree'],
	\ 'g' : ['library#edit_attic()', 'edit attic'],
	\ 'v' : ['library#edit_myvimrc()', 'edit myvimrc'],
	\ 'c' : ['library#edit_cronos()', 'edit cronos'],
	\ 'd' : ['library#edit_dream()', 'edit dream'],
	\ 'f' : ['library#edit_fix()', 'edit fix'],
	\ 'l' : ['library#edit_ship_log()', 'edit ship log'],
	\ 's' : ['library#edit_syntax_plugin()', 'edit syntax plugin'],
	\ 't' : ['library#edit_tasks()', 'edit tasks'],
	\ 'x' : ['library#chmodexec()', 'chmod exec'],
	\ 'S' : ['library#source_current_file()', 'source current file'],
	\ }

" argument {{{2

" which key hangs with g:which_key_main_map.a

let g:which_key_main_map['$'] = {
	\ 'name' : '+argument' ,
	\ 'p' : ['previous' , 'previous argument'] ,
	\ 'n' : ['next'     , 'next argument']     ,
	\ '^' : ['first'    , 'first argument']    ,
	\ '$' : ['last'     , 'last argument']     ,
	\ }

" buffer {{{2

let g:which_key_main_map.b = {
	\ 'name' : '+buffer' ,
	\ 'b' : ['new <bar> only'      , 'new buffer']        ,
	\ 'p' : ['bprevious'           , 'previous buffer']   ,
	\ 'n' : ['bnext'               , 'next buffer']       ,
	\ '^' : ['bfirst'              , 'first buffer']      ,
	\ '$' : ['blast'               , 'last buffer']       ,
	\ 'd' : ['bd'                  , 'delete buffer']     ,
	\ 'w' : ['library#write_all()' , 'write all buffers'] ,
	\ }

" window {{{2

let g:which_key_main_map.w = {
	\ 'name' : '+windows' ,
	\ '=' : ["library#execute('wincmd =')" , 'equalize windows'] ,
	\ '|' : ["library#execute('wincmd |')" , 'maximize width'] ,
	\ '-' : ["library#execute('wincmd _')" , 'maximize height'] ,
	\ 'p' : ['library#win2prev_tab()'      , 'win to prev tab']  ,
	\ 'n' : ['library#win2next_tab()'      , 'win to next tab']  ,
	\ }

" tab, onglet {{{2

let g:which_key_main_map.t = {
	\ 'name' : '+tab' ,
	\ 't' : ['tabnew'                  , 'new tab']                      ,
	\ 'n' : ['tabnext'                 , 'next tab']                     ,
	\ 'p' : ['tabprevious'             , 'previous tab']                 ,
	\ '^' : ['tabfirst'                , 'tab first']                    ,
	\ '$' : ['tablast'                 , 'tab last']                     ,
	\ 'e' : ['tabedit'                 , 'edit in new tab']              ,
	\ '=' : ['library#equal_windows()' , 'equalize windows on all tabs'] ,
	\ }

" content {{{2

let g:which_key_main_map.c = {
	\ 'name' : '+content' ,
	\ 'b' : ['library#figlet()'                   , 'figlet banner']     ,
	\ 'l' : ["library#execute('set cursorline!')" , 'toggle cursorline'] ,
	\ 'p' : ["library#execute('set paste!')"      , 'toggle paste mode'] ,
	\ 'r' : ['library#toggle_readonly()'          , 'toggle readonly']   ,
	\ 's' : ["library#execute('%sort')"           , 'sort lines']        ,
	\ 'S' : ["library#execute('setlocal spell!')" , 'toggle spell']      ,
	\ 'i' : ['library#highlight_group()'          , 'highlight group']   ,
	\ }

" global {{{2

" strange mappings added with g:which_key_main_map.g

let g:which_key_main_map['='] = {
	\ 'name' : '+global' ,
	\ 'y' : [ "library#feedkeys(':GlobalYank ')"   , 'global yank']   ,
	\ 'd' : [ "library#feedkeys(':GlobalDelete ')" , 'global delete'] ,
	\ }

" encryption {{{2

let g:which_key_main_map.x = {
	\ 'name' : '+encryption' ,
	\ 'x' : ['library#text_to_password()' , 'text to password'] ,
	\ 'X' : ['library#password_to_text()' , 'password to text'] ,
	\ }

" exchange {{{2

let g:which_key_main_map.e = {
	\ 'name' : '+swap' ,
	\ 'c' : ["library#swap('characters'   , 'after')"     , 'with character after']  ,
	\ 'C' : ["library#swap('characters'   , 'before')"    , 'with character before'] ,
	\ 'l' : ["library#swap('lines'        , 'after')"     , 'with line after']       ,
	\ 'L' : ["library#swap('lines'        , 'before')"    , 'with line before']      ,
	\ 'w' : ["library#swap('characters')" , 'words']      ,
	\ 'p' : ["library#swap('paragraphs')" , 'paragraphs'] ,
	\ }

" quickfix {{{2

let g:which_key_main_map.q = {
	\ 'name' : '+quickfix' ,
	\ 'o' : ['copen'     , 'open quickfix']                  ,
	\ 'c' : ['cclose'    , 'close quickfix']                 ,
	\ 'p' : ['cprevious' , 'previous in quickfix']           ,
	\ 'n' : ['cnext'     , 'next in quickfix']               ,
	\ 'b' : ['cpfile'    , 'previous file in quickfix']      ,
	\ 'f' : ['cnfile'    , 'next file in quickfix']          ,
	\ }

" location list {{{2

let g:which_key_main_map.l = {
	\ 'name' : '+location_list' ,
	\ 'o' : ['lopen'     , 'open location list']             ,
	\ 'c' : ['lclose'    , 'close location list']            ,
	\ 'p' : ['lprevious' , 'previous in location list']      ,
	\ 'n' : ['lnext'     , 'next in location list']          ,
	\ 'b' : ['lpfile'    , 'previous file in location list'] ,
	\ 'f' : ['lnfile'    , 'next file in location list']     ,
	\ }

" navigation {{{2

let g:which_key_main_map.n = {
	\ 'name' : '+navigation' ,
	\ 't' : ["library#feedkeys(':tjump /')"  , 'tag jump']  ,
	\ 'T' : ["library#feedkeys(':tab tjump /')"  , 'tag jump in new tab']  ,
	\ }

" search and replace {{{2

let g:which_key_main_map.s = {
	\ 'name' : '+search_and_replace' ,
	\ 's' : ['library#search_word()'  , 'search word']  ,
	\ 'r' : ['library#search_and_replace_word()'  , 'search and replace word']  ,
	\ }

" external command {{{2

let g:which_key_main_map['!'] = {
	\ 'name' : '+shell_command' ,
	\ 'm' : ["library#feedkeys(':make -k ')"  , 'make']  ,
	\ 'l' : ["library#execute('!ls -l')"  , 'ls -l']  ,
	\ '!' : ['library#terminal()'  , 'ls -l']  ,
	\ }

" music {{{2

let g:which_key_main_map.m = {
	\ 'name' : '+music' ,
	\ 'm' : ['library#make_midi()'   , 'make'] ,
	\ 'p' : ['library#display_pdf()' , 'make'] ,
	\ 'o' : ['library#make_ogg()'    , 'make'] ,
	\ }

" plugin {{{2

let g:which_key_main_map.p = {
	\ 'name' : '+plugin' ,
	\ 'm' : ['library#edit_minisnip_file()'   , 'edit minisnip file'] ,
	\ }

" function keys {{{2

" for help
"nnoremap <silent> <f1> <cmd>WhichKey '<f1>'<cr>

nnoremap <silent> <f2> <cmd>WhichKey '<f2>'<cr>
nnoremap <silent> <f3> <cmd>WhichKey '<f3>'<cr>
nnoremap <silent> <f4> <cmd>WhichKey '<f4>'<cr>

" source current file
"nnoremap <silent> <f5> <cmd>WhichKey '<f5>'<cr>

nnoremap <silent> <f6> <cmd>WhichKey '<f6>'<cr>
nnoremap <silent> <f7> <cmd>WhichKey '<f7>'<cr>
nnoremap <silent> <f8> <cmd>WhichKey '<f8>'<cr>

nnoremap <silent> <f9> <cmd>WhichKey '<f9>'<cr>
nnoremap <silent> <f10> <cmd>WhichKey '<f10>'<cr>
nnoremap <silent> <f11> <cmd>WhichKey '<f11>'<cr>
nnoremap <silent> <f12> <cmd>WhichKey '<f12>'<cr>
