" vim: set filetype=vim :

if has("autocmd")

" Plugins standard

" {{{ Netrw

augroup ExtensionNetRW

	au!

	au FileType netrw nmap <buffer> <kEnter> <Enter>

augroup END

" }}}

" ------------------------------------

"  {{{ Gundo
" ------------------------------------------------------------------------

augroup ExtensionGundo

	au!

	au FileType gundo nmap <buffer> <kEnter> <Enter>

augroup END

" }}}

"  {{{ MRU
" ------------------------------------------------------------------------

augroup ExtensionMRU

	au!

	au BufEnter __MRU_Files__ nmap <buffer> <kEnter> <Enter>

augroup END

" }}}

"  {{{ Startify
" ------------------------------------------------------------------------

" augroup ExtensionQFGrep
"
" 	au!
"
" 	au BufReadPost quickfix nmap <buffer> / <Plug>QFGrep
" 	au BufReadPost quickfix nmap <buffer> ? <Plug>QFGrepV
" 	au BufReadPost quickfix nmap <buffer> = <Plug>QFRestore
"
" augroup END

" }}}

"  {{{ Startify
" ------------------------------------------------------------------------

augroup ExtensionStartify

	au!

	au FileType startify nmap <buffer> <kEnter> <Enter>

augroup END

" }}}

" {{{ Tskeleton

augroup ModelesTSkeleton

	au!

" 	au BufNewFile *.sh                 TSkeletonSetup template/template.sh
" 	au BufNewFile *.zsh                TSkeletonSetup template/template.zsh
" 	au BufNewFile *.bash               TSkeletonSetup template/template.bash

" 	au BufNewFile *.sed                TSkeletonSetup template/template.sed
" 	au BufNewFile *.awk                TSkeletonSetup template/template.awk

" 	au BufNewFile *.py                 TSkeletonSetup template/template.py
" 	au BufNewFile *.pl                 TSkeletonSetup template/template.pl

" 	au BufNewFile *.vim                TSkeletonSetup template/template.vim

" 	au BufNewFile *.htm,*.html         TSkeletonSetup template/template.html
" 	au BufNewFile *.php,*.phtm,*.phtml TSkeletonSetup template/template.php
" 	au BufNewFile *.js                 TSkeletonSetup template/template.js

augroup END

" }}}

" {{{ Tweetvim

" augroup ExtensionTweetvim
"
" 	au!
"
" 	au FileType tweetvim setlocal nowrap
"
" 	au FileType tweetvim nmap <buffer> u         <Plug>(tweetvim_action_user_timeline)
" 	au FileType tweetvim nmap <buffer> <up>      <Plug>(tweetvim_action_cursor_up)
" 	au FileType tweetvim nmap <buffer> <down>    <Plug>(tweetvim_action_cursor_down)
" 	au FileType tweetvim nmap <buffer> n         <Plug>(tweetvim_action_page_next)
" 	au FileType tweetvim nmap <buffer> p         <Plug>(tweetvim_action_page_previous)
" 	au FileType tweetvim nmap <buffer> f         <Plug>(tweetvim_action_buffer_next)
" 	au FileType tweetvim nmap <buffer> b         <Plug>(tweetvim_action_buffer_previous)
" 	au FileType tweetvim nmap <buffer> <cr>      <Plug>(tweetvim_action_enter)
" 	au FileType tweetvim nmap <buffer> /         <Plug>(tweetvim_action_search)
" 	au FileType tweetvim nmap <buffer> r         <Plug>(tweetvim_action_reload)
" 	au FileType tweetvim nmap <buffer> R         <Plug>(tweetvim_action_reply)
" 	au FileType tweetvim nmap <buffer> <m-r>     <Plug>(tweetvim_action_retweet)
" 	au FileType tweetvim nmap <buffer> m         <Plug>(tweetvim_action_favorite)
" 	au FileType tweetvim nmap <buffer> *         <Plug>(tweetvim_action_favstar)
" 	au FileType tweetvim nmap <buffer> t         <Plug>(tweetvim_action_in_reply_to)
" 	au FileType tweetvim nmap <buffer> w         <Plug>(tweetvim_action_open_links)
" 	au FileType tweetvim nmap <buffer> W         <Plug>(tweetvim_action_expand_url)
" 	au FileType tweetvim nmap <buffer> x         <Plug>(tweetvim_action_remove_favorite)
"
" " 	au FileType tweetvim nmap <buffer> ...       <Plug> (tweetvim_action_favstar_browser)
" " 	au FileType tweetvim nmap <buffer> ...       <Plug> (tweetvim_action_remove_status)
" " 	au FileType tweetvim nmap <buffer> ...       <Plug>(tweetvim_action_qt)
"
" augroup END

" }}}

" {{{ TwitVim

" augroup ExtensionTwitVim
"
" 	au!
"
" 	au FileType twitvim nnoremap <buffer> @       :FriendsTwitter<cr>
" 	au FileType twitvim nnoremap <buffer> u       :UserTwitter<Space>
"
" 	au FileType twitvim nnoremap <buffer> r       :RefreshTwitter<cr>
"
" 	au FileType twitvim nnoremap <buffer> n       :NextTwitter<cr>
" 	au FileType twitvim nnoremap <buffer> p       :PreviousTwitter<cr>
"
" 	au FileType twitvim nnoremap <buffer> <tab>   :ForwardTwitter<cr>
" 	au FileType twitvim nnoremap <buffer> <bs>    :BackTwitter<cr>
"
" 	au FileType twitvim nnoremap <buffer> s       :SearchTwitter<Space>
"
" 	au FileType twitvim nnoremap <buffer> m       :FavTwitter<cr>
"
" 	au FileType twitvim nnoremap <buffer> P       :PosttoTwitter<cr>
"
" 	au FileType twitvim nnoremap <buffer> af      :FollowTwitter<Space>
" 	au FileType twitvim nnoremap <buffer> xf      :UnfollowTwitter<Space>
"
" 	au FileType twitvim nnoremap <buffer> f       :FollowingTwitter<space>
" 	au FileType twitvim nnoremap <buffer> F       :FollowersTwitter<space>
"
" 	au FileType twitvim nnoremap <buffer> l       :ListTwitter<Space>
" 	au FileType twitvim nnoremap <buffer> L       :OwnedListsTwitter<space>
"
" 	au FileType twitvim nnoremap <buffer> al      :AddToListTwitter<Space>
" 	au FileType twitvim nnoremap <buffer> xl      :RemoveFromListTwitter<Space>
"
" 	au FileType twitvim nnoremap <buffer> il      :ListInfoTwitter<Space>
" 	au FileType twitvim nnoremap <buffer> <m-l>m  :MembersOfListTwitter<Space>
"
" 	au FileType twitvim nnoremap <buffer> <m-l>f  :FollowListTwitter<Space>
" 	au FileType twitvim nnoremap <buffer> <m-l>xf :UnfollowListTwitter<Space>
"
" augroup END

" }}}

" {{{ Unite

augroup ExtensionUnite

	au!

	au FileType unite nmap <buffer> <kenter> <Plug>(unite_do_default_action)
	au FileType unite imap <buffer> <kenter> <Plug>(unite_do_default_action)

	au FileType unite nmap <buffer> <C-z>    <Plug>(unite_toggle_transpose_window)
	au FileType unite imap <buffer> <C-z>    <Plug>(unite_toggle_transpose_window)

" 	au FileType unite nmap <buffer> <PageUp>     <Plug>(unite_narrowing_input_history)
" 	au FileType unite imap <buffer> <PageUp>     <Plug>(unite_narrowing_input_history)
"
" 	au FileType unite nmap <buffer> <PageDown>     <Plug>(unite_narrowing_input_history)
" 	au FileType unite imap <buffer> <PageDown>     <Plug>(unite_narrowing_input_history)

augroup END

" }}}

"  {{{ VimCalc
" ------------------------------------------------------------------------

augroup ExtensionVimCalc

	au!

	au BufEnter __VCALC__ imap <buffer> <kEnter> <Enter>
	au BufEnter __VCALC__ imap <buffer> <kPlus> +
	au BufEnter __VCALC__ imap <buffer> <kMinus> -
	au BufEnter __VCALC__ imap <buffer> <kMultiply> *
	au BufEnter __VCALC__ imap <buffer> <kDivide> /

augroup END

" }}}

"  {{{ Yankring
" ------------------------------------------------------------------------

augroup ExtensionYankring

	au!

	au FileType yankring set nofoldenable

	" {{{ Keypad

	au FileType yankring nmap <buffer> <kEnter> <Enter>

" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k1> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(1)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k2> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(2)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k3> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(3)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k4> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(4)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k5> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(5)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k6> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(6)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k7> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(7)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k8> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(8)<CR>
" 	au BufEnter \[YankRing] nnoremap <buffer> <silent> <k9> :call <SID>YRWindowAction ('q' ,'n')<CR>:call <SID>YRGetElem(9)<CR>

	" Plus nécessaire, car :

	" nmap 0 --> keypad 0
	" nmap 1 --> keypad 1
	" nmap 2 --> keypad 2
	" nmap 3 --> keypad 3
	" nmap 4 --> keypad 4
	" nmap 5 --> keypad 5
	" nmap 6 --> keypad 6
	" nmap 7 --> keypad 7
	" nmap 8 --> keypad 8
	" nmap 9 --> keypad 9

	" dans maps.vim

	" }}}

augroup END

" }}}

" {{{ Yate

augroup ExtensionYate

	au!

	au BufReadPost YATE setfiletype conf

	au BufEnter YATE startinsert
	au BufLeave YATE stopinsert

augroup END

" }}}

endif
