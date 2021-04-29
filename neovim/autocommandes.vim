" vim: set filetype=vim :

if !has("autocmd")
	finish
endif

"  Rechargement de la configuration {{{1

augroup RechargementConfiguration
	autocmd!
	autocmd bufwritepost ~/racine/config/edit/neovim/colors/ornuit.vim colorscheme ornuit
	autocmd bufwritepost ~/racine/config/edit/neovim/after/syntax/** source %
	autocmd bufwritepost ~/racine/config/system/dunst/dunstrc !restart-dunst.zsh &
	autocmd bufwritepost ~/racine/config/windenv/sxhkd/sxhkdrc !pkill -10 -f sxhkd
	autocmd bufwritepost ~/racine/config/windenv/keynav/keynavrc !pkill -1 -f keynav
	autocmd bufwritepost ~/racine/config/windenv/polybar/config !polybar-msg cmd restart
	autocmd bufwritepost ~/racine/config/windenv/picom.conf !restart-picom.zsh &
	autocmd bufwritepost ~/racine/config/organizer/remind/* !pkill -10 -f remind-server
	autocmd bufwritepost ~/racine/public/wheel/**.vim source %
augroup END

" }}}1

"  Shell {{{1

augroup ShellHistorique
	autocmd!
	autocmd BufEnter historique.zsh setlocal nofoldenable
augroup END

" }}}1

"  Fenêtre quickfix {{{1

augroup FenetreQuickFix
	autocmd!
	autocmd BufReadPost quickfix noremap <buffer> <backspace> <cr>:cclose<cr>
augroup END

" }}}1

"  Fenêtre d’historique {{{1

augroup FenetreHistorique
	autocmd!
	"autocmd CmdwinEnter [:/?]  startinsert
	autocmd CmdwinEnter * noremap <buffer> q :q<CR>
	autocmd CmdwinEnter * noremap <buffer> <space> ?
	autocmd CmdwinEnter * setlocal foldlevel=99
	autocmd CmdwinLeave * let @/=""
augroup END

" }}}1

" Fichiers temporaires {{{1

augroup FichiersTemporaires
	autocmd!
	autocmd BufNewFile,BufReadPre /tmp/*,*/tmp/* setlocal noundofile
augroup END

" }}}1

" Types de fichiers {{{1

"  Allocation des types {{{2

augroup DetectionDesTypesDeFichiers
	autocmd!
	autocmd BufNewFile,BufRead *.org setfiletype org
	autocmd BufNewFile,BufRead *.htm*,*.php,*.phtm* setfiletype html.php
	autocmd BufNewFile,BufRead *.rss,*.atom         setfiletype xml
augroup END

" }}}2

" Tabulation {{{2

augroup Tabulation
	autocmd!
	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
augroup END

" }}}2

" ------------------------------------

" FichierVim {{{2

augroup FichierVim
	autocmd BufEnter *.vim let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'" }
	autocmd BufLeave *.vim let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }
augroup END

" }}}2

" FichiersLisp {{{2

augroup FichiersLisp
	autocmd!
	autocmd BufEnter *.el let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', '"':'"' }
	autocmd BufLeave *.el let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }
augroup END

" }}}2

" FichiersSlang {{{2

augroup FichiersSlang
	autocmd!
	autocmd Filetype slang set commentstring=%\ %s
augroup END

" }}}2

" FichiersMarkdown {{{2

augroup FichiersMarkdown
	autocmd!
	"autocmd bufwritepost **.md !pandoc -t html % -o %:r.html
augroup END

" }}}2

" FichiersHtml {{{2

augroup FichiersHtml
	autocmd!
	autocmd Filetype html,php nnoremap <silent> [h ?^<h[1-6]<cr>:noh<cr>
	autocmd Filetype html,php nnoremap <silent> ]h /^<h[1-6]<cr>:noh<cr>
augroup END

" }}}2

" Fichiers openDocument {{{2

augroup FichiersOpenDoc
	autocmd!
	autocmd BufReadPre *.odt,*.ods set ro
	autocmd BufReadPost *.odt,*.ods %!odt2txt "%"
augroup END

" }}}2

" FichiersImages {{{2

augroup FichiersImages
	autocmd!
	"autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!identify -verbose "%"
	autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!exiv2 pr "%"
augroup END

" }}}2

" FichiersAudio {{{2

augroup FichiersAudio
	autocmd!
	autocmd BufReadPost *.flac %!metaflac --list "%"
	autocmd BufReadPost *.ogg %!ogginfo "%"
	autocmd BufReadPost *.mp3 %!mp3info -x "%"
augroup END

" }}}2

" FichiersDoc {{{2

augroup FichiersDoc
	autocmd!
	autocmd BufReadPre *.doc set ro
	autocmd BufReadPost *.doc %!antiword "%" | fmt
augroup END

" }}}2

"  Newsrc {{{2

augroup Nouvelles
	autocmd!
	autocmd BufWritePre newsrc silent! %g!/:/s/\%(\w\+\.\)*\w\+\zs\s/ :&/
	autocmd BufWritePre newsrc silent! %g!/:/s/\%(\w\+\.\)*\w\+\zs$/ :&/
augroup END

" }}}2

"  Fichier de génération de listes de lecture m3u {{{2

augroup ListesDeLecture
	autocmd!
	autocmd BufEnter ~/racine/pictura/list/*.meta lcd ~/graphix
	autocmd BufEnter ~/racine/musica/list/*.meta lcd ~/audio
augroup END

" }}}2

" }}}1

" Man pager {{{1

augroup manlaunchtoc
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

" }}}1

"  Chat {{{1

augroup social
	autocmd!
	autocmd BufWritePost alias.conf.perso   w! ~/racine/config/social/weechat/alias.conf
	autocmd BufWritePost aspell.conf.perso  w! ~/racine/config/social/weechat/aspell.conf
	autocmd BufWritePost buffers.conf.perso w! ~/racine/config/social/weechat/buffers.conf
	autocmd BufWritePost cron.txt.perso     w! ~/racine/config/social/weechat/cron.txt
	autocmd BufWritePost irc.conf.perso     w! ~/racine/config/social/weechat/irc.conf
	autocmd BufWritePost iset.conf.perso    w! ~/racine/config/social/weechat/iset.conf
	autocmd BufWritePost jabber.conf.perso  w! ~/racine/config/social/weechat/jabber.conf
	autocmd BufWritePost logger.conf.perso  w! ~/racine/config/social/weechat/logger.conf
	autocmd BufWritePost plugins.conf.perso w! ~/racine/config/social/weechat/plugins.conf
	autocmd BufWritePost relay.conf.perso   w! ~/racine/config/social/weechat/relay.conf
	autocmd BufWritePost script.conf.perso  w! ~/racine/config/social/weechat/script.conf
	autocmd BufWritePost weechat.conf.perso w! ~/racine/config/social/weechat/weechat.conf
	autocmd BufWritePost xfer.conf.perso    w! ~/racine/config/social/weechat/xfer.conf
augroup END

" }}}1
