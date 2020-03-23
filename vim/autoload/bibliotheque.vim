" vim: set filetype=vim :

" Vim script file

" Last Change:  [=] mercredi 14 août 2013  (o) 11:06
" Version:      0.2
" Location:     http://www.vim.org/scripts/script.php?script_id=__à compléter__
" Licence:      This program is free software; you can redistribute it
"               and/or modify it under the terms of the GNU General Public
"               License.  See http://www.gnu.org/copyleft/gpl.txt

" Variables {{{1

let s:separateurs_de_motifs = [ '/', ':', '-', '_', ',', ';', '?', "'", '"' ]

let s:KB = 1024.0
let s:MB = s:KB * s:KB
let s:GB = s:KB * s:MB

" }}}1

" ------------------------------------

" Répertoire de projet {{{1

fun! bibliotheque#repertoire_projet (project_root)
	" Change local directory to root of project
	" where current buffer belongs
	let dir = expand('%:p:h')
	exe 'lcd ' . dir
	while ! filereadable(a:project_root) && dir != '/'
		lcd ..
		let dir = getcwd()
	endwhile
endfun

" }}}1

" Hiérarchie highlight du mot sous le curseur {{{1

fun! bibliotheque#highlightGroup()
	if !exists("*synstack")
		return
	endif
	return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

" }}}1

"  Redirection vers le tampon courant {{{1

fu! bibliotheque#redirToBuffer(commande)
	redir => contenu
	echo 'Commande :' a:commande
	echo ''
	exec 'silent ' . a:commande
	redir END
	new
	put =contenu
endfu

" }}}1

"  Recherche via grep {{{1

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
	silent! cope 13
endfu

" }}}1

"  Recherche via vimgrep {{{1

fu! bibliotheque#vimgrep()
	let save_eventignore = &eventignore
	set eventignore=all
	let motif = input('Motif ? ')
	let fichiers = input('Fichiers ? ', expand('%:p:h') . '/*', 'file')
	if fichiers == ''
		let fichiers = expand('%:p:h') . '/**'
	endif
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
	silent! lope 13
	let &eventignore = save_eventignore
endfu

" }}}1

"  Remplacement {{{1

fu! bibliotheque#remplacement()
	let save_eventignore = &eventignore
	set eventignore=all
	let motif = input('Motif ? ')
	let remplace = input('Remplacement ? ')
	let fichiers = input('Fichiers ? ', expand('%:p:h') . '/*', 'file')
	if fichiers == ''
		let fichiers = expand('%:p:h') . '/**/*(.)'
	endif
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
	arglocal
	let chaine  = ''
	let chaine .= 'args'
	let chaine .= ' '
	let chaine .= fichiers_filtres
	echomsg chaine
	exe chaine
	let chaine  = ''
	let chaine .= 'argdo'
	let chaine .= ' '
	let chaine .= '! cp % %.pre-sub'
	echomsg chaine
	exe chaine
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
	argglobal
	let &eventignore = save_eventignore
endfu

" }}}1

"  Remplacement via sed {{{1

fu! bibliotheque#remplacementSed()
	let motif = input('Motif ? ')
	let remplace = input('Remplacement ? ')
	let fichiers = input('Fichiers ? ', expand('%:p:h') . '/*', 'file')
	if fichiers == ''
		let fichiers = expand('%:p:h') . '/**/*(.)'
	endif
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

" }}}1

"  Texte des pliages (fold) {{{1

fun! bibliotheque#texteDuPliage()
	let commentaire = substitute(&commentstring, '%s', '', '')
	let texte = getline(v:foldstart)
	let texte = substitute(texte, '{{{[0-9]\?', '', '')				" }}}
	let texte = substitute(texte, commentaire, '', 'g')
	let texte = substitute(texte, '	', '', 'g')
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

fu! bibliotheque#pliageParExpression()
	setlocal foldmethod=expr
	setlocal foldexpr=bibliotheque#niveauDePliage(v:lnum)
endfu

fu! bibliotheque#pliageParMarqueurs()
	setlocal foldmethod=marker
	setlocal foldmarker={{{,}}}
endfun

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

" }}}1

"  Barre d’onglets en mode texte {{{1

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
	"return a:onglet . ' ' . filename . ' ' . label
	"return filename . ' ' . label
	return filename
endfu

" }}}1

" Barre {{{1

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
	let s .= '%=%#TabLine#%999X[X]'
	endif
	return s
endfu

" }}}1
