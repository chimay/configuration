" Vim script file
" Plugin:		bibliotheque
" Last Change:  vendredi 27 juillet 2012, 17:16
" Version:      0.1
" Location:     http://www.vim.org/scripts/script.php?script_id=__à compléter__
" Licence:      This program is free software; you can redistribute it
"               and/or modify it under the terms of the GNU General Public
"               License.  See http://www.gnu.org/copyleft/gpl.txt

"  {{{ Envoie archive
" ------------------------------------------------------------------------

fu mail#bibliotheque#envoieArchive()
	"let sujet = "archives : " . expand('%:r:r')
	let sujet = "archives : " . expand('%')
	let attache = expand('%:p')
	let destinataire = "orduval@gmail.com"
	exe '! mutt -a' attache '-s "' . sujet . '" --' destinataire '< ~/racine/common/mail/archive'
endfu

" }}}

"  {{{ Ligne édition
" ------------------------------------------------------------------------

fu mail#bibliotheque#ligneEdition()
	"norm gg
	1
	"exe "/^[\\s*>]*\\s*--\\s*$"
	"exe "?^$"
	if search('^\%(>\s*\)\+--\s*$')
		call search('^\%(>\s*\)*$','b')
	else
		$
		call search('^\s*--\s*$','b')
		norm k
	endif
	norm 0D
	norm o
	norm o
	norm k
	norm zz
	startinsert
endfu

" }}}

"  {{{ Supprime signatures citées
" ------------------------------------------------------------------------

fu mail#bibliotheque#supprimeSignaturesCitees()
	let ligne = line('.')
	let colonne = col('.')
	1
	while search('^\%(>\s*\)\+--\s*$')
		let M = line('.')
		if search('^\%(>\s*\)*$')
			let N = line('.')
		else
			let N = line('$')
		endif
		exe string(M) . ',' . string(N)  . 'd'
		1
	endwhile
	call cursor(ligne, colonne)
endfu

" }}}
