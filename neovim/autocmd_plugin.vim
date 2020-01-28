" vim: set filetype=vim :

if !has("autocmd")
	finish
endif

" Denite {{{1

autocmd FileType denite call s:denite_my_settings()

function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <Tab> denite#do_map('choose_action')

  nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'splitswitch')
  nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplitswitch')
  nnoremap <silent><buffer><expr> t denite#do_map('do_action', 'tabswitch')

  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> & denite#do_map('filter', '.vim')

  nnoremap <silent><buffer><expr> u denite#do_map('move_up_path')

  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <C-A> denite#do_map('select_all')

  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> D denite#do_map('do_action', 'delete')

  nnoremap <silent><buffer><expr> <C-L> denite#do_map('redraw')
  nnoremap <silent><buffer><expr> <C-R> denite#do_map('restart')

  nnoremap <silent><buffer><expr> ù denite#do_map('restore_sources')
  nnoremap <silent><buffer><expr> µ denite#do_map('restore_sources')

  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')

  inoremap <silent><buffer><expr> <bs> denite#do_map('i_<Plug>(denite_filter_backspace)')
  inoremap <silent><buffer><expr> <cr> denite#do_map('i_<Plug>(denite_filter_update)')
endfunction

" }}}1

" {{{ Neoyank

autocmd BufWinEnter \(*.asc\|*.gpg\) let g:neoyank_disable = 1

" }}}

" Sneak {{{1

autocmd ColorScheme * hi Sneak
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

autocmd ColorScheme * hi SneakScope
			\ guifg=black guibg=#5B3C11 gui=NONE
			\ ctermfg=NONE ctermbg=NONE cterm=reverse

" }}}1

" Vim Markdown Folding {{{1

au bufwritepost ~/racine/config/edit/neovim/colors/ornuit.vim colorscheme ornuit

au BufEnter *.md setlocal foldmethod=expr

" }}}1
