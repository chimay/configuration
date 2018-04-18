" vim: set filetype=vim :

" Vim script file

" Last Change:  [=] mercredi 14 août 2013  (o) 11:06
" Version:      0.2
" Location:     http://www.vim.org/scripts/script.php?script_id=__à compléter__
" Licence:      This program is free software; you can redistribute it
"               and/or modify it under the terms of the GNU General Public
"               License.  See http://www.gnu.org/copyleft/gpl.txt

" ------------------------------------

" Exemples trouvés sur le net

" {{{ Recherche parmi les résultats de la liste quickfix

"	" Define a command to make it easier to use
"	command! -nargs=+ QFDo call QFDo(<q-args>)
"
"	" Function that does the work
"	function! QFDo(command)
"	    " Create a dictionary so that we can
"	    " get the list of buffers rather than the
"	    " list of lines in buffers (easy way
"	    " to get unique entries)
"	    let buffer_numbers = {}
"	    " For each entry, use the buffer number as
"	    " a dictionary key (won't get repeats)
"	    for fixlist_entry in getqflist()
"	        let buffer_numbers[fixlist_entry['bufnr']] = 1
"	    endfor
"	    " Make it into a list as it seems cleaner
"	    let buffer_number_list = keys(buffer_numbers)
"
"	    " For each buffer
"	    for num in buffer_number_list
"	        " Select the buffer
"	        exe 'buffer' num
"	        " Run the command that's passed as an argument
"	        exe a:command
"	        " Save if necessary
"	        update
"	    endfor
"	endfunction

" }}}

" ------------------------------------

" {{{ Variables

let s:separateurs_de_motifs = [ '/', ':', '-', '_', ',', ';', '?', "'", '"' ]

let s:KB = 1024.0
let s:MB = s:KB * s:KB
let s:GB = s:KB * s:MB

" }}}

" ------------------------------------

" {{{ Hiérarchie highlight du mot sous le curseur

fun! bibliotheque#highlightGroup()

	if !exists("*synstack")
		return
	endif

	return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

endfun

" }}}

" {{{ Url --> Lien

fun! bibliotheque#url2link()

	g_^https\?://_s:^\(.*\)$:<a href="\1">\1</a><br />:

endfun

" }}}

"  {{{ Redirection vers le tampon courant
" ------------------------------------------------------------------------

fu! bibliotheque#redirToBuffer(commande)

	redir => contenu

	echo 'Commande :' a:commande
	echo ''

	exec 'silent ' . a:commande

	redir END

	"tabnew

	put =contenu

endfu

" }}}

"  {{{ Recherche via grep
" ------------------------------------------------------------------------

fu! bibliotheque#grep()

	let motif = input('Motif ? ')

	let fichiers = input('Fichiers ? ', expand('%:p:h') . '/*', 'file')

	if fichiers == ''
		let fichiers = expand('%:p:h') . '/**/*(.)'
	endif

	let chaine  = ''
	let chaine .= 'silent grep!'
	let chaine .= ' '
	let chaine .= "'"
	let chaine .= motif
	let chaine .= "'"
	let chaine .= ' '
	let chaine .= fichiers

	echomsg chaine

	exe chaine

	silent! cope 23

endfu

" }}}

"  {{{ Recherche via vimgrep
" ------------------------------------------------------------------------

fu! bibliotheque#vimgrep()

	let save_eventignore = &eventignore

	set eventignore=all

	let motif = input('Motif ? ')

	let fichiers = input('Fichiers ? ', expand('%:p:h') . '/*', 'file')

	if fichiers == ''
		let fichiers = expand('%:p:h') . '/**'
	endif

" {{{ Séparateur

	let separateur = ''

	for candide in s:separateurs_de_motifs
		if ! (motif =~ candide)
			let separateur = candide
			break
		endif
	endfor

	if separateur == ''
		echoe 'Impossible de trouver un séparateur pour la substitution'
		return 1
	endif

" }}}

" 	let chaine .= 'noautocmd'

	let chaine  = ''
	let chaine .= 'lvimgrep!'
	let chaine .= ' '
	let chaine .= separateur
	let chaine .= motif
	let chaine .= separateur
	let chaine .= 'j'
	let chaine .= ' '
	let chaine .= fichiers

	echomsg chaine

	exe chaine

	silent! lope 23

	let &eventignore = save_eventignore

endfu

" }}}

"  {{{ Remplacement
" ------------------------------------------------------------------------

" TODO : ajouter système de backup

fu! bibliotheque#remplacement()

	let save_eventignore = &eventignore

	set eventignore=all

	let motif = input('Motif ? ')
	let remplace = input('Remplacement ? ')

	let fichiers = input('Fichiers ? ', expand('%:p:h') . '/*', 'file')

	if fichiers == ''
		let fichiers = expand('%:p:h') . '/**/*(.)'
	endif

" {{{ Séparateur

	let separateur = ''

	for candide in s:separateurs_de_motifs
		if ! (motif =~ candide)
			let separateur = candide
			break
		endif
	endfor

	if separateur == ''
		echoe 'Impossible de trouver un séparateur pour la substitution'
		return 1
	endif

" }}}

" {{{ Fichiers contenant le motif

	let chaine  = ''
	let chaine .= '! grep -l'
	let chaine .= ' '
	let chaine .= "'"
	let chaine .= motif
	let chaine .= "'"
	let chaine .= ' '
	let chaine .= fichiers

	echomsg chaine

	let contenu = system(chaine)

	let fichiers_filtres = substitute(contenu, '\n', ' ', 'g')

" }}}

	arglocal

	let chaine  = ''
	let chaine .= 'args'
	let chaine .= ' '
	let chaine .= fichiers_filtres

	echomsg chaine

	exe chaine

" {{{ Backup

	let chaine  = ''
	let chaine .= 'argdo'
	let chaine .= ' '
	let chaine .= '! cp % %.pre-sub'

	echomsg chaine

	exe chaine

" }}}

" {{{ Substitution

" 	let chaine .= 'noautocmd'

	let chaine  = ''
	let chaine .= 'argdo'
	let chaine .= ' '
	let chaine .= 'silent %s'
	let chaine .= separateur
	let chaine .= motif
	let chaine .= separateur
	let chaine .= remplace
	let chaine .= separateur
	let chaine .= 'g'

	echomsg chaine

	exe chaine

" }}}

	argglobal

	let &eventignore = save_eventignore

endfu

" }}}

"  {{{ Remplacement via sed
" ------------------------------------------------------------------------

" TODO : ajouter système de backup

fu! bibliotheque#remplacementSed()

	let motif = input('Motif ? ')
	let remplace = input('Remplacement ? ')

	let fichiers = input('Fichiers ? ', expand('%:p:h') . '/*', 'file')

	if fichiers == ''
		let fichiers = expand('%:p:h') . '/**/*(.)'
	endif

" {{{ Séparateur

	let separateur = ''

	for candide in s:separateurs_de_motifs
		if ! (motif =~ candide)
			let separateur = candide
			break
		endif
	endfor

	if separateur == ''
		echoe 'Impossible de trouver un séparateur pour la substitution'
		return 1
	endif

" }}}

" {{{ Fichiers contenant le motif

	let chaine  = ''
	let chaine .= '! grep -l'
	let chaine .= ' '
	let chaine .= "'"
	let chaine .= motif
	let chaine .= "'"
	let chaine .= ' '
	let chaine .= fichiers

	echomsg chaine

	let contenu = system(chaine)

	let fichiers_filtres = substitute(contenu, '\n', ' ', 'g')

" }}}

	let chaine  = ''
	let chaine .= '! sed --in-place=.pre-sed'
	let chaine .= ' '
	let chaine .= "'"
	let chaine .= 's'
	let chaine .= separateur
	let chaine .= motif
	let chaine .= separateur
	let chaine .= remplace
	let chaine .= separateur
	let chaine .= 'g'
	let chaine .= "'"
	let chaine .= ' '
	let chaine .= fichiers_filtres

	echomsg chaine

	"exe chaine
	call system(chaine)

endfu

" }}}

" {{{ Sauvegarde

" TODO

fu! bibliotheque#sauvegarde(...)

let sous_repertoire = ''
let extension = ''

if len(a:000) >= 1
	let sous_repertoire = a:1
endif

if len(a:000) >= 2
	let extension = a:2
endif

let chemin_fichier     = expand('%:p')
let fichier            = expand('%:p:t')
let repertoire_fichier = expand('%:p:h')

let repertoire_sauvegarde = repertoire_fichier . '/.vim/backup/' . sous_repertoire
let sauvegarde = fichier . extension

" echomsg chemin_fichier
" echomsg fichier
" echomsg repertoire_fichier
" echomsg repertoire_sauvegarde
" echomsg sauvegarde

if ! filewritable(repertoire_fichier)
	echoerr 'bibliotheque#sauvegarde : ' . repertoire_fichier . ' protégé en écriture'
	return 1
endif

echomsg 'mkdir ' repertoire_sauvegarde

if ! isdirectory(repertoire_sauvegarde)
	call mkdir(repertoire_sauvegarde, 'p')
endif

let chaine  = ''

let chaine .= '! cp'
let chaine .= ' '
let chaine .= chemin_fichier
let chaine .= ' '
let chaine .= repertoire_sauvegarde
let chaine .= '/'
let chaine .= sauvegarde

echomsg chaine

"exe chaine
call system(chaine)

endfu

" }}}

"  {{{ Taille d'un fichier
" ------------------------------------------------------------------------

fu! bibliotheque#tailleFichier()

	let taille = getfsize(expand('%'))

	let gigas = floor(taille / s:GB)
	let taille -=  s:GB * gigas

	let megas = floor(taille / s:MB)
	let taille -=  s:MB * megas

	let kas = floor(taille / s:KB)
	let taille -=  s:KB * kas

	return string(megas) . ' G  ' . string(megas) . ' M  ' . string(kas) . ' K  ' . string(taille) . ' B'

endfu

" }}}

" ------------------------------------

"  {{{ Texte des pliages
" ------------------------------------------------------------------------

fun! bibliotheque#texteDuPliage()

	let commentaire = substitute(&commentstring, '%s', '', '')

	let texte = getline(v:foldstart)

	let texte = substitute(texte, '{{{', '', '')				" }}}
	let texte = substitute(texte, commentaire, '', 'g')

	"let texte = substitute(texte, "[^[:alnum:][:space:]']*", '', 'g')
	"let texte = substitute(texte, '	\{2,}'', '	', 'g')
	"let texte = substitute(texte, '^\s\+', '', '')
	"let texte = substitute(texte, '\s\+$', '', '')

	let texte = substitute(texte, '’', "'", 'g')
	let texte = substitute(texte, '\C[[=A=]]', 'A', 'g')
	let texte = substitute(texte, '\C[[=E=]]', 'E', 'g')
	let texte = substitute(texte, '\C[[=I=]]', 'I', 'g')
	let texte = substitute(texte, '\C[[=O=]]', 'O', 'g')
	let texte = substitute(texte, '\C[[=U=]]', 'U', 'g')
	let texte = substitute(texte, '\C[[=a=]]', 'a', 'g')
	let texte = substitute(texte, '\C[[=e=]]', 'e', 'g')
	let texte = substitute(texte, '\C[[=i=]]', 'i', 'g')
	let texte = substitute(texte, '\C[[=o=]]', 'o', 'g')
	let texte = substitute(texte, '\C[[=u=]]', 'u', 'g')

	let Nlignes = v:foldend - v:foldstart

	let texte = '+-- {{{ ' . texte . ' --> Niveau ' . v:foldlevel . ' :: ' . Nlignes . ' lignes' . ' }}} ' . v:folddashes
	let texte = substitute(texte, ' \{2,}', ' ', 'g')

	return texte
endfunc

" ------------------------------------

fu! bibliotheque#pliageParExpression()
	setlocal foldmethod=expr
	setlocal foldexpr=bibliotheque#niveauDePliage(v:lnum)
endfu

" ------------------------------------

fu! bibliotheque#pliageParMarqueurs()
	setlocal foldmethod=marker
	setlocal foldmarker={{{,}}}
endfun

" ------------------------------------

fu! bibliotheque#niveauDePliage(noDeLigne)

	let ligne = getline(a:noDeLigne)
	for niveau in range(1,6)
		let expresso = '<h' . niveau . '.*>'
		if ligne =~? expresso
			return '>' . string(niveau)
		endif
	endfor

	let ligne = getline(a:noDeLigne + 1)
	for niveau in range(1,6)
		let expresso = '<h' . niveau . '.*>'
		if ligne =~? expresso
			return '<' . string(niveau)
		endif
	endfor

	return -1

endfu

" }}}

"  {{{ Barre d’onglets en mode texte
" ------------------------------------------------------------------------

" {{{ Onglet
" ------------------------------------

fu! bibliotheque#myTabLabel(onglet)

	let buflist = tabpagebuflist(a:onglet)
	let winnr = tabpagewinnr(a:onglet)

	let buffernr = buflist[winnr - 1]
	let buffername = bufname(buffernr)

	let filename = fnamemodify(buffername, ':t')

	let label = ''

	for bufnr in buflist

		if getbufvar(bufnr, "&modified")

			let label .= '+'
			break

		endif

	endfor

	return a:onglet . ' ' . filename . ' ' . label

endfu

" }}}

" {{{ Barre
" ------------------------------------

fu! bibliotheque#myTabLine()

	let s = ''

	for i in range(tabpagenr('$'))

		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by MyTabLabel()
		let s .= ' %{bibliotheque#myTabLabel(' . (i + 1) . ')} '

	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
	let s .= '%=%#TabLine#%999Xclose'
	endif

	return s

endfu

" }}}

" }}}

"  {{{ Codes couleurs
" ------------------------------------------------------------------------

function! bibliotheque#codesCouleurs()

	silent! s:\v(.+)\s+(#)\s+(\w{2})\s+(\w{2})\s+(\w{2})\s+(\w+)\s+(\w+)\s+(\w+)(.*)$:\1			\2\3\4\5			rgb(\6, \7, \8)\9:
	silent! s:\v([^)])\)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\w+)\s+(\w+):\1)			cmyk(\2, \3, \4, \5)			hsl(\6, \7%, \8%):
	silent! s: \ze[^(].*#::g

endfunction

com! -range CodesCouleurs <line1>,<line2>call bibliotheque#codesCouleurs()

" }}}
