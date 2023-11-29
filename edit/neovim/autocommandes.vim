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
	autocmd BufWritePost ~/racine/config/** call biblio#publish ()
	autocmd BufWritePost ~/racine/fun/** call biblio#publish ()
	autocmd BufWritePost ~/racine/self/bin/** call biblio#publish ()
	autocmd BufWritePost ~/racine/shell/** call biblio#publish ()
	autocmd BufWritePost ~/racine/automat/** call biblio#publish ()
	autocmd BufWritePost ~/racine/snippet/** call biblio#publish ()
	autocmd BufWritePost ~/racine/site/**/*Makefile* call biblio#publish ()
augroup END

augroup reload-service
	autocmd!
	autocmd BufWritePost ~/racine/config/system/dunst/dunstrc !restart-dunst.sh &
	autocmd BufWritePost ~/racine/config/windenv/sxhkd/sxhkdrc !pkill -10 -f sxhkd
	autocmd BufWritePost ~/racine/config/windenv/keynav/keynavrc !pkill -1 -f keynav
	autocmd BufWritePost ~/racine/config/windenv/polybar/config !polybar-msg cmd restart
	autocmd BufWritePost ~/racine/config/windenv/picom.conf !restart-picom.zsh &
	autocmd BufWritePost ~/racine/config/organizer/remind/* !pkill -10 -f remind-server
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
	autocmd BufReadPost *.ly setlocal commentstring=%%s
	autocmd BufReadPost *.ly nnoremap <buffer> <f5> <cmd>call biblio#make_midi()<cr>
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
        autocmd FileType man
            \ call man#show_toc() |
            \ nnoremap <buffer> l <Enter> |
            \ wincmd H |
            \ vert resize 35 |
            \ wincmd p
    endif
augroup end
