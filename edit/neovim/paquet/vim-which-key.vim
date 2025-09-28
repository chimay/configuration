" vim: set filetype=vim :

" config {{{1

let g:which_key_use_floating_win = 1

let g:which_key_timeout = 300
let g:which_key_exit = "\<esc>"
"let g:which_key_exit = "\<C-G>"

" leader prefix {{{1

" default map dictionary for leader : g:which_key_map
"call which_key#register('<leader>', "g:which_key_map")

"nnoremap <silent> <leader> <cmd>WhichKey '<leader>'<cr>

" only loads the dictionary maps, not the others
"nnoremap <silent> <leader> <cmd>WhichKey! g:which_key_leader_map<cr>

" return prefix {{{1

"call which_key#register('<cr>', "g:which_key_return_map")
"nnoremap <silent> <cr> <cmd>WhichKey '<cr>'<cr>

nnoremap <silent> <cr> <cmd>WhichKey! g:which_key_return_map<cr>

let g:which_key_return_map = {}

let g:which_key_return_map.f = {
	\ 'name' : '+file',
	\ 'e' : ['library#edit_in_current_file_subtree()', 'edit in subtree'],
	\ 'r' : ['library#read_in_current_file_subtree()', 'read in subtree'],
	\ 'g' : ['library#edit_attic()', 'edit attic'],
	\ 'v' : ['library#edit_myvimrc()', 'edit myvimrc'],
	\ 'V' : ['library#reload_myvimrc()', 'edit myvimrc'],
	\ 'c' : ['library#edit_cronos()', 'edit cronos'],
	\ 'd' : ['library#edit_dream()', 'edit dream'],
	\ 'f' : ['library#edit_fix()', 'edit fix'],
	\ 'l' : ['library#edit_ship_log()', 'edit ship log'],
	\ 's' : ['library#edit_syntax_plugin()', 'edit syntax plugin'],
	\ 't' : ['library#edit_tasks()', 'edit tasks'],
	\ 'x' : ['library#chmodexec()', 'chmod exec'],
	\ }

" which key hangs with g:which_key_return_map.a

let g:which_key_return_map.z = {
	\ 'name' : '+argument' ,
	\ 'p' : ['previous' , 'previous argument'] ,
	\ 'n' : ['next'     , 'next argument']     ,
	\ 'f' : ['first'    , 'first argument']    ,
	\ 'l' : ['last'     , 'last argument']     ,
	\ }

let g:which_key_return_map.b = {
	\ 'name' : '+buffer' ,
	\ 'N' : ['new <bar> only' , 'new buffer']    ,
	\ 'p' : ['bprevious'      , 'previous buffer']  ,
	\ 'n' : ['bnext'          , 'next buffer']  ,
	\ '^' : ['bfirst'         , 'first buffer']  ,
	\ '$' : ['blast'          , 'last buffer']   ,
	\ 'd' : ['bd'             , 'delete buffer'] ,
	\ }

let g:which_key_return_map.t = {
	\ 'name' : '+tab' ,
	\ 'n' : ['tabnew'   , 'new tab']         ,
	\ 'e' : ['tabedit'  , 'edit in new tab'] ,
	\ '^' : ['tabfirst' , 'tab first']       ,
	\ '$' : ['tablast'  , 'tab last']        ,
	\ }

let g:which_key_return_map.w = {
	\ 'name' : '+windows' ,
	\ '=' : ['library#equal_windows()'      , 'equal wins']      ,
	\ '<left>' : ['library#win2prev_tab()'  , 'win to prev tab'] ,
	\ '<right>' : ['library#win2next_tab()' , 'win to next tab'] ,
	\ }

let g:which_key_return_map.c = {
	\ 'name' : '+content' ,
	\ 'b' : ['library#figlet()'                   , 'figlet banner']     ,
	\ 'l' : ["library#execute('set cursorline!')" , 'toggle cursorline'] ,
	\ 'p' : ["library#execute('set paste!')"      , 'toggle paste mode'] ,
	\ 'r' : ['library#toggle_readonly()'          , 'toggle readonly']   ,
	\ 's' : ["library#execute('%sort')"           , 'sort lines']        ,
	\ 'S' : ["library#execute('setlocal spell!')" , 'toggle spell']      ,
	\ 'i' : ['library#highlight_group()'          , 'highlight group']   ,
	\ }

let g:which_key_return_map.x = {
	\ 'name' : '+encryption' ,
	\ 'x' : ['library#text_to_password()' , 'text to password'] ,
	\ 'X' : ['library#password_to_text()' , 'password to text'] ,
	\ }

let g:which_key_return_map.s = {
	\ 'name' : '+swap' ,
	\ 'c' : ["library#swap('characters', 'after')"  , 'with character after']  ,
	\ 'C' : ["library#swap('characters', 'before')" , 'with character before'] ,
	\ 'w' : ["library#swap('characters')", 'words']  ,
	\ 'l' : ["library#swap('lines', 'after')"  , 'with line after']  ,
	\ 'L' : ["library#swap('lines', 'before')"  , 'with line before']  ,
	\ 'p' : ["library#swap('paragraphs')"  , 'paragraphs']  ,
	\ }

let g:which_key_return_map.q = {
	\ 'name' : '+quickfix' ,
	\ 'p' : ['cprevious' , 'previous in quickfix']      ,
	\ 'n' : ['cnext'     , 'next in quickfix']          ,
	\ 'f' : ['cpfile'    , 'previous file in quickfix'] ,
	\ 'b' : ['cnfile'    , 'next file in quickfix']     ,
	\ 'P' : ['lprevious' , 'previous in location list']      ,
	\ 'N' : ['lnext'     , 'next in location list']          ,
	\ 'F' : ['lpfile'    , 'previous file in location list'] ,
	\ 'B' : ['lnfile'    , 'next file in location list']     ,
	\ }

let g:which_key_return_map['!'] = {
	\ 'name' : '+shell_command' ,
	\ 'm' : ["library#execute('make -k')"  , 'make']  ,
	\ }
