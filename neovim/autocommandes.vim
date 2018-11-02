" vim: set filetype=vim :

if has("autocmd")

" {{{ Démarrage

augroup Demarrage

	au!

	"au VimEnter * cd ~/racine/notes

augroup END

" }}}

"  {{{ Tous les fichiers
" ------------------------------------------------------------------------

augroup TousLesFichiers

	au!

	" {{{ Restore le curseur

	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\ 	exe "normal! g`\"" |
		\ endif

	" }}}

	" {{{ Pliage et position du curseur dans la fenêtre

	" Pas besoin de zz2<C-E> car zx est déjà mappé

	au BufRead * normal zx

	" }}}

	" {{{ Crée le répertoire de backup s’il n’existe pas encore

" 	autocmd BufReadPost *
" 		\ if filewritable(expand('%:p:h')) && ! isdirectory(expand('%:p:h') . '/.neovim/backup/ancien') |
" 		\	call mkdir(expand('%:p:h') . '/.neovim/backup/ancien', 'p') |
" 		\ endif

	" }}}

	"  {{{ Ne déplace pas le curseur lorsque la fenêtre gagne le focus

	au FocusGained * call getchar(0)

	" }}}

augroup END

" }}}

" {{{ Répertoires de travail

augroup RepertoiresDeTravail

	au!

	" {{{ Semblable à autochdir

	"au BufEnter * lcd %:p:h

	" }}}

	" {{{ Par projet

	au BufEnter ~/racine/plain/**/*     set tags=~/racine/plain/tags
	au BufEnter ~/racine/site/**/*     set tags=~/racine/site/tags

	au BufEnter ~/racine/shell/**/*     set tags=~/racine/shell/tags

	au BufEnter ~/racine/config/cmdline/**/*     set tags=~/racine/config/cmdline/tags
	au BufEnter ~/racine/config/edit/**/*     set tags=~/racine/config/edit/tags

	" }}}

augroup END

" }}}

"  {{{ Configuration
" ------------------------------------------------------------------------

augroup RechargementConfiguration

	au!

	au bufwritepost ~/racine/config/edit/neovim/colors/personnel.vim colorscheme personnel

	au bufwritepost ~/racine/config/edit/neovim/after/syntax/** source %

augroup END

" }}}

"  {{{ Shell
" ------------------------------------------------------------------------

augroup ShellHistorique

	au!

	au BufEnter historique.zsh setlocal nofoldenable

augroup END

" }}}

"  {{{ Fenêtre quickfix
" ------------------------------------------------------------------------

augroup FenetreQuickFixNeovimGrep

	au!

	au BufReadPost quickfix noremap <buffer> <tab> <cr>:cclose<cr>:lclose<cr>

augroup END

" }}}

"  {{{ Fenêtre d’historique
" ------------------------------------------------------------------------

set cmdwinheight=18		" Hauteur de la fenêtre d'historique

augroup FenetreHistorique

	au!

	"au CmdwinEnter [:/?]  startinsert

	au CmdwinEnter * noremap <buffer> q :q<CR>
	au CmdwinEnter * noremap <buffer> <space> ?
	au CmdwinEnter * setlocal foldlevel=99
	au CmdwinLeave * let @/=""

augroup END

" }}}

" {{{ Fichiers temporaire

augroup FichiersTemporaires

	au!

	au BufNewFile,BufReadPre /tmp/*,*/tmp/* setlocal noundofile

augroup END

" }}}

"  {{{ Newsrc
" ------------------------------------------------------------------------

augroup Nouvelles
	au!
	"au BufWritePre newsrc silent! %s/[^:]$/&:/g
	au BufWritePre newsrc silent! %g!/:/s/\%(\w\+\.\)*\w\+\zs\s/ :&/
	au BufWritePre newsrc silent! %g!/:/s/\%(\w\+\.\)*\w\+\zs$/ :&/
augroup END

" }}}

"  {{{ Chat
" ------------------------------------------------------------------------

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

" }}}

"  {{{ Fichier de génération de listes de lecture m3u
" ------------------------------------------------------------------------

augroup ListesDeLecture
	au!

	" Perturbe CtrlSpace

	"au BufEnter ~/music/list/*.gen lcd ~/audio

augroup END

" }}}

" {{{ Types de fichiers

"  {{{ Allocation des types
" ------------------------------------------------------------------------

augroup DetectionDesTypesDeFichiers

	au!

	au BufNewFile,BufRead *.htm*,*.php,*.phtm* setfiletype html.php
	au BufNewFile,BufRead *.rss,*.atom         setfiletype xml

augroup END

" }}}

" {{{ Tabulation

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

" }}}

" ------------------------------------

" {{{ FichierVim

augroup FichierVim

	"au BufWritePre *.vim call bibliotheque#dateModification()

	au BufEnter *.vim let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'" }
	au BufLeave *.vim let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }

augroup END

" }}}

" {{{ FichiersLisp

augroup FichiersLisp

	au!

	au BufEnter *.el let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', '"':'"' }
	au BufLeave *.el let g:AutoPairs = { '(':')', '[':']', '{':'}', '<':'>', "'":"'", '"':'"' }

augroup END

" }}}

" {{{ FichiersSlang

augroup FichiersSlang

	au!

	au Filetype slang set commentstring=%\ %s

augroup END

" }}}

" {{{ FichiersHtml

augroup FichiersHtml

	au!

	au Filetype html,php nnoremap <silent> [h ?^<h[1-6]<cr>:noh<cr>
	au Filetype html,php nnoremap <silent> ]h /^<h[1-6]<cr>:noh<cr>

	"au Filetype html,php command! PliageExpresso call bibliotheque#pliageParExpression()
	"au Filetype html,php command! PliageMarqueurs call bibliotheque#pliageParMarqueurs()

augroup END

" }}}

" {{{ Fichiers openDocument

augroup FichiersOpenDoc

	au!

	autocmd BufReadPre *.odt,*.ods set ro
	autocmd BufReadPost *.odt,*.ods %!odt2txt "%"

augroup END

" }}}

" {{{ FichiersImages

augroup FichiersImages

	au!

	"autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!identify -verbose "%"
	autocmd BufReadPost *.svg,*.png,*.jpg,*.jpeg,*.gif %!exiv2 pr "%"

augroup END

" }}}

" {{{ FichiersAudio

augroup FichiersAudio

	au!

	autocmd BufReadPost *.flac %!metaflac --list "%"
	autocmd BufReadPost *.ogg %!ogginfo "%"
	autocmd BufReadPost *.mp3 %!mp3info -x "%"

augroup END

" }}}

" {{{ FichiersDoc

augroup FichiersDoc

	au!

	autocmd BufReadPre *.doc set ro
	autocmd BufReadPost *.doc %!antiword "%" | fmt

augroup END

" }}}

" }}}

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

endif
