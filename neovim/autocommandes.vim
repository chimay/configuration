" vim: set filetype=vim :

if !has("autocmd")
	finish
endif

" Démarrage {{{1

augroup Demarrage

	au!

	"au VimEnter * cd ~/racine/plain

augroup END

" }}}1

"  Tous les fichiers {{{1

augroup TousLesFichiers

	au!

	" Restore le curseur {{{2

	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\ 	exe "normal! g`\"" |
		\ endif

	" }}}2

	" Pliage et position du curseur dans la fenêtre {{{2

	" Pas besoin de zz2<C-E> car zx est déjà mappé

	au BufRead * normal zx

	" }}}2

	" Crée le répertoire de backup s’il n’existe pas encore {{{2

" 	autocmd BufReadPost *
" 		\ if filewritable(expand('%:p:h')) && ! isdirectory(expand('%:p:h') . '/.neovim/backup/ancien') |
" 		\	call mkdir(expand('%:p:h') . '/.neovim/backup/ancien', 'p') |
" 		\ endif

	" }}}2

	"  Ne déplace pas le curseur lorsque la fenêtre gagne le focus {{{2

	au FocusGained * call getchar(0)

	" }}}2

augroup END

" }}}1

" Répertoires de travail {{{1

augroup RepertoiresDeTravail

	au!

	" Semblable à autochdir {{{2

	"au BufEnter * lcd %:p:h

	" }}}2

	" Par projet {{{2

	"au BufEnter ~/racine/plain/**/*     set tags=~/racine/plain/tags
	"au BufEnter ~/racine/site/**/*     set tags=~/racine/site/tags

	"au BufEnter ~/racine/shell/**/*     set tags=~/racine/shell/tags

	"au BufEnter ~/racine/config/cmdline/**/*     set tags=~/racine/config/cmdline/tags
	"au BufEnter ~/racine/config/edit/**/*     set tags=~/racine/config/edit/tags

	" }}}2

	" Basé sur tab directory {{{2

	" Interfère avec ctrlspace

	"function! OnTabEnter(path)
		"if isdirectory(a:path)
			"let dirname = a:path
		"else
			"let dirname = fnamemodify(a:path, ":h")
		"endif
		"execute "tcd ". dirname
	"endfunction

	"autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))

	" }}}2

augroup END

" }}}1

"  Rechargement de la configuration {{{1

augroup RechargementConfiguration
	au!

	au bufwritepost ~/racine/config/edit/neovim/colors/ornuit.vim colorscheme ornuit
	au bufwritepost ~/racine/config/edit/neovim/after/syntax/** source %

	au bufwritepost ~/racine/config/windenv/sxhkd/sxhkdrc !pkill -10 -f sxhkd
	au bufwritepost ~/racine/config/windenv/polybar/config !polybar-msg cmd restart
	au bufwritepost ~/racine/config/windenv/picom.conf !restart-picom.zsh &
	au bufwritepost ~/racine/config/organizer/remind/* !pkill -10 -f remind-server
augroup END

" }}}1

"  Shell {{{1

augroup ShellHistorique

	au!

	au BufEnter historique.zsh setlocal nofoldenable

augroup END

" }}}1

"  Fenêtre quickfix {{{1

augroup FenetreQuickFixNeovimGrep

	au!

	au BufReadPost quickfix noremap <buffer> <tab> <cr>:cclose<cr>:lclose<cr>

augroup END

" }}}1

"  Fenêtre d’historique {{{1

set cmdwinheight=18		" Hauteur de la fenêtre d'historique

augroup FenetreHistorique

	au!

	"au CmdwinEnter [:/?]  startinsert

	au CmdwinEnter * noremap <buffer> q :q<CR>
	au CmdwinEnter * noremap <buffer> <space> ?
	au CmdwinEnter * setlocal foldlevel=99
	au CmdwinLeave * let @/=""

augroup END

" }}}1

" Fichiers temporaire {{{1

augroup FichiersTemporaires

	au!

	au BufNewFile,BufReadPre /tmp/*,*/tmp/* setlocal noundofile

augroup END

" }}}1

" Types de fichiers {{{1

"  Allocation des types {{{2

augroup DetectionDesTypesDeFichiers

	au!

	au BufNewFile,BufRead *.htm*,*.php,*.phtm* setfiletype html.php
	au BufNewFile,BufRead *.rss,*.atom         setfiletype xml

augroup END

" }}}2

" Tabulation {{{2

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

" }}}2

" ------------------------------------

" FichierVim {{{2

augroup FichierVim

	"au BufWritePre *.vim call bibliotheque#dateModification()

	au BufEnter *.vim let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'" }
	au BufLeave *.vim let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }

augroup END

" }}}2

" FichiersLisp {{{2

augroup FichiersLisp

	au!

	au BufEnter *.el let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', '"':'"' }
	au BufLeave *.el let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }

augroup END

" }}}2

" FichiersSlang {{{2

augroup FichiersSlang

	au!

	au Filetype slang set commentstring=%\ %s

augroup END

" }}}2

" FichiersMarkdown {{{2

augroup FichiersMarkdown

	au!

	au bufwritepost **.md !pandoc -t html % -o %:r.html

augroup END

" }}}2

" FichiersHtml {{{2

augroup FichiersHtml

	au!

	au Filetype html,php nnoremap <silent> [h ?^<h[1-6]<cr>:noh<cr>
	au Filetype html,php nnoremap <silent> ]h /^<h[1-6]<cr>:noh<cr>

	"au Filetype html,php command! PliageExpresso call bibliotheque#pliageParExpression()
	"au Filetype html,php command! PliageMarqueurs call bibliotheque#pliageParMarqueurs()

augroup END

" }}}2

" Fichiers openDocument {{{2

augroup FichiersOpenDoc

	au!

	autocmd BufReadPre *.odt,*.ods set ro
	autocmd BufReadPost *.odt,*.ods %!odt2txt "%"

augroup END

" }}}2

" FichiersImages {{{2

augroup FichiersImages

	au!

	"autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!identify -verbose "%"
	autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!exiv2 pr "%"

augroup END

" }}}2

" FichiersAudio {{{2

augroup FichiersAudio

	au!

	autocmd BufReadPost *.flac %!metaflac --list "%"
	autocmd BufReadPost *.ogg %!ogginfo "%"
	autocmd BufReadPost *.mp3 %!mp3info -x "%"

augroup END

" }}}2

" FichiersDoc {{{2

augroup FichiersDoc

	au!

	autocmd BufReadPre *.doc set ro
	autocmd BufReadPost *.doc %!antiword "%" | fmt

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

            " \ setlocal laststatus=0 nonumber norelativenumber |
augroup end

" }}}1

"  Fichier de génération de listes de lecture m3u {{{1

augroup ListesDeLecture
	au!

	" Perturbe CtrlSpace

	au BufEnter ~/racine/musica/list/*.gen lcd ~/audio

augroup END

" }}}1

"  Newsrc {{{1

augroup Nouvelles
	au!
	"au BufWritePre newsrc silent! %s/[^:]$/&:/g
	au BufWritePre newsrc silent! %g!/:/s/\%(\w\+\.\)*\w\+\zs\s/ :&/
	au BufWritePre newsrc silent! %g!/:/s/\%(\w\+\.\)*\w\+\zs$/ :&/
augroup END

" }}}1

"  Chat {{{1

augroup Chaton
	au!

	au BufWritePost alias.conf.perso   w! ~/racine/config/chaton/weechat/alias.conf
	au BufWritePost aspell.conf.perso  w! ~/racine/config/chaton/weechat/aspell.conf
	au BufWritePost buffers.conf.perso w! ~/racine/config/chaton/weechat/buffers.conf
	au BufWritePost cron.txt.perso     w! ~/racine/config/chaton/weechat/cron.txt
	au BufWritePost irc.conf.perso     w! ~/racine/config/chaton/weechat/irc.conf
	au BufWritePost iset.conf.perso    w! ~/racine/config/chaton/weechat/iset.conf
	au BufWritePost jabber.conf.perso  w! ~/racine/config/chaton/weechat/jabber.conf
	au BufWritePost logger.conf.perso  w! ~/racine/config/chaton/weechat/logger.conf
	au BufWritePost plugins.conf.perso w! ~/racine/config/chaton/weechat/plugins.conf
	au BufWritePost relay.conf.perso   w! ~/racine/config/chaton/weechat/relay.conf
	au BufWritePost script.conf.perso  w! ~/racine/config/chaton/weechat/script.conf
	au BufWritePost weechat.conf.perso w! ~/racine/config/chaton/weechat/weechat.conf
	au BufWritePost xfer.conf.perso    w! ~/racine/config/chaton/weechat/xfer.conf

	"au BufWritePost irssi.configuration w! config
	"au BufWritePost irssi.theme         w! themes/personnel.theme

augroup END

" }}}1
