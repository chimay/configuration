" vim: set filetype=vim :

" Exploration multiple {{{1

" Denite {{{2

" Mappings de lancement {{{3

nnoremap <S-F1>     :<c-u>Denite<space>

nnoremap é          :<c-u>Denite line:all change jump<cr>
nnoremap è          :<c-u>Denite line:buffers change jump<cr>

nnoremap §          :<c-u>Denite unite:outline:folding<cr>

nnoremap °          :<c-u>Denite -mode=normal help command filetype output:!ls<cr>

nnoremap ù          :<c-u>Denite buffer file_mru file/old file/rec<cr>

nnoremap µ          :<c-u>Denite register command_history <cr>
nnoremap <s-µ>      :<c-u>Denite register command_history <cr>

nnoremap £          :<c-u>Denite tag<cr>

"nnoremap è          :<c-u>Denite grep<cr>

" }}}3

" Options {{{3

call denite#custom#option('default', {
	  \ 'highlight_mode_normal' : 'Visual',
	  \ 'highlight_mode_insert' : 'Visual',
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

" Ignore {{{3

call unite#custom#source('file_rec', 'ignore_globs',
	\ split(&wildignore, ','))

" }}}3

" Motifs flous {{{3

" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" }}}3

" Présentation {{{3

call unite#custom#profile('default', 'context', {
\   'direction' : 'dynamicbottom'
\ })

call unite#custom#profile('default', 'context', {
\   'winheight' : 20
\ })

call unite#custom#profile('default', 'context', {
\   'winwidth' : 20
\ })

" }}}3

" Autocommandes {{{3

autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()
	imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction

" }}}3

" }}}2

" Neomru (Shougo/neomru.vim) {{{2

call unite#custom#source('neomru/file', 'ignore_globs',
			\ [
			\ '/home/*/racine/plugin/manager/**/doc/*.txt',
			\ 'term://*',
			\ 'man://*',
			\ ])

" }}}2

" }}}1

" Modes {{{1

"  Submode (kana/vim-submode) {{{2

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

" }}}1
