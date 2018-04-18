" vim: set filetype=vim :

source ~/racine/config/edit/neovim/defaut.vim

"  {{{ Historique
" ------------------------------------------------------------------------

set shada=
	\!,
	\f1,
	\c,
	\h,
	\<12,
	\s12,
	\'60,
	\:7543,
	\/1234,
	\@1234,
	\n~/racine/hist/neovim/main.shada

" Remplacé par neomru
"	\%,

" Nombre par défaut pour lignes de commande,
" recherches, nombre de lignes d’entrée

set history=7500

" }}}

"  {{{ Plugins
" ------------------------------------------------------------------------

if $OPERASYS == 'archlinux'

	let g:python3_host_prog = '/bin/python3'

	let g:python_host_prog = '/bin/python2'

elseif $OPERASYS == 'freebsd'

	let g:python3_host_prog = '/usr/local/bin/python3'

	let g:python_host_prog = '/usr/local/bin/python2'

endif

source ~/racine/config/edit/neovim/paquet/plugged.vim

source ~/racine/config/edit/neovim/paquet/config.vim

" }}}

"  {{{ Auto-commandes pour plugins
" ------------------------------------------------------------------------

source ~/racine/config/edit/neovim/autocmd_plugin.vim

" }}}
