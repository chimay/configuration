" vim: set ft=vim fdm=indent iskeyword&:

if ! has("autocmd")
	finish
endif

augroup source-file
	autocmd!
	autocmd BufWritePost ~/racine/config/edit/neovim/after/syntax/** source %
	autocmd BufWritePost ~/racine/config/edit/neovim/autoload/** source %
	autocmd BufWritePost ~/racine/public/wheel/autoload/**.vim source %
	autocmd BufWritePost ~/racine/public/organ/autoload/**.vim source %
	autocmd BufWritePost ~/racine/config/edit/neovim/colors/ornuit.vim colorscheme ornuit
augroup END

augroup publish-in-repo
	autocmd!
	autocmd BufWritePost ~/racine/config/** call library#publish ()
	autocmd BufWritePost ~/racine/fun/** call library#publish ()
	autocmd BufWritePost ~/racine/self/bin/** call library#publish ()
	autocmd BufWritePost ~/racine/shell/** call library#publish ()
	autocmd BufWritePost ~/racine/automat/** call library#publish ()
	autocmd BufWritePost ~/racine/snippet/** call library#publish ()
	autocmd BufWritePost ~/racine/site/**/*Makefile* call library#publish ()
	autocmd BufWritePost ~/racine/musica/lilypond/template/** call library#publish ()
augroup END

augroup reload-service
	autocmd!
	"autocmd BufWritePost ~/racine/config/system/dunst/dunstrc !restart-dunst.sh &
	autocmd BufWritePost ~/racine/config/system/dunst/dunstrc !dunstctl reload &
	autocmd BufWritePost ~/racine/config/windenv/sxhkd/sxhkdrc !pkill -10 -f sxhkd
	autocmd BufWritePost ~/racine/config/windenv/sxhkd/hlwm-sxhkdrc !pkill -10 -f sxhkd
	autocmd BufWritePost ~/racine/config/windenv/keynav/keynavrc !pkill -1 -f keynav
	autocmd BufWritePost ~/racine/config/windenv/polybar/config !polybar-msg cmd restart
	autocmd BufWritePost ~/racine/config/windenv/picom.conf !restart-picom.zsh &
	autocmd BufWritePost ~/racine/config/organizer/remind/* !pkill -10 -f remind-server
	autocmd BufWritePost ~/racine/config/auto/crontab !update-crontab.sh &>> ~/log/cron.log &
augroup END

augroup quickfix-window
	autocmd!
	autocmd BufReadPost quickfix noremap <buffer> <backspace> <cr>:cclose<cr>
augroup END

augroup command-window
	autocmd!
	"autocmd CmdwinEnter [:/?]  startinsert
	autocmd CmdwinEnter * noremap <buffer> q <cmd>q<CR>
	autocmd CmdwinEnter * noremap <buffer> <space> ?
	autocmd CmdwinEnter * setlocal foldlevel=99
	autocmd CmdwinLeave * let @/=""
augroup END

augroup temporary-files
	autocmd!
	autocmd BufNewFile,BufReadPre /tmp/*,*/tmp/* setlocal noundofile
augroup END

augroup tabulation
	autocmd!
	autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType org,markdown setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup folding
	autocmd!
	autocmd BufReadPost ~/public/wheel/**.vim setlocal foldmethod=indent
	autocmd BufReadPost ~/public/organ/**.vim setlocal foldmethod=indent
	autocmd BufReadPost *.snippets setlocal nofoldenable
	autocmd BufEnter historique.zsh setlocal nofoldenable
augroup END

augroup file-detection
	autocmd!
	autocmd BufNewFile,BufRead *.adoc setfiletype asciidoc
augroup END

augroup file-vim
	autocmd!
	"autocmd filetype vim setlocal listchars=tab:┆\ ,nbsp:▒,precedes:❮,extends:❯,conceal:Δ
augroup END

augroup file-markdown
	autocmd!
	"autocmd bufwritepost **.md !pandoc -t html % -o %:r.html
augroup END

augroup file-libreoffice
	autocmd!
	autocmd BufReadPre *.odt,*.ods set ro
	autocmd BufReadPost *.odt,*.ods %!odt2txt "%"
augroup END

augroup file-image
	autocmd!
	"autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!identify -verbose "%"
	autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!exiv2 pr "%"
augroup END

augroup file-music
	" see ~/racine/config/edit/neovim/after/ftplugin/lilypond.vim
	"autocmd BufReadPost *.ly setlocal commentstring=%%s
	"autocmd BufReadPost *.ly nnoremap <buffer> <f5> <cmd>call library#make_midi()<cr>
	autocmd BufReadPost *.ly nnoremap <buffer> µ <cmd>call library#make_midi()<cr>
augroup END

augroup file-audio
	autocmd!
	autocmd BufReadPost *.flac %!metaflac --list "%"
	autocmd BufReadPost *.ogg %!ogginfo "%"
	autocmd BufReadPost *.mp3 %!mp3info -x "%"
	" ---- playlists
	autocmd BufEnter ~/racine/pictura/list/*.meta lcd ~/graphix
	autocmd BufEnter ~/racine/musica/list/*.meta lcd ~/audio
augroup END

augroup man-pages
    autocmd!
    if has('nvim')
        autocmd FileType man nnoremap <buffer> s <cmd>call library#manual_sections()<cr>
        autocmd FileType man nnoremap <buffer> l <cmd>call library#manual_links()<cr>
        autocmd FileType man nnoremap <buffer> - <cmd>call library#manual_options()<cr>
        autocmd FileType man nnoremap <buffer> o <cmd>call library#manual_open_list()<cr>
        autocmd FileType man nnoremap <buffer> x <cmd>call library#manual_close_list()<cr>
        autocmd FileType man nnoremap <buffer> q <cmd>bdelete<cr>
        autocmd FileType man nnoremap <buffer> <cr> <cmd>silent! normal K<cr>
    endif
augroup end
