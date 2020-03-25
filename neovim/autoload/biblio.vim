" vim: ft=vim fdm=indent:

let s:separateurs_de_motifs = [ '/', ':', '-', '_', ',', ';', '?', "'", '"' ]

let s:KB = 1024.0
let s:MB = s:KB * s:KB
let s:GB = s:KB * s:MB

fun! biblio#global_yank (pattern, ...)
	" Yank all lines matching pattern
	" Optional argument is a letter register (a by default)
	if a:0 > 0
		let register = a:1
	else
		let register = 'a'
	endif
	exe 'let @' . register . " = ''"
	exe 'global/' . a:pattern . '/yank ' . toupper(register)
endfun

fun! biblio#global_delete (pattern, ...)
	" Delete all lines matching pattern
	" Optional argument is a letter register (a by default)
	if a:0 > 0
		let register = a:1
	else
		let register = 'a'
	endif
	exe 'let @' . register . " = ''"
	exe 'global/' . a:pattern . '/delete ' . toupper(register)
endfun

fun! biblio#highlight_group ()
	" Display highlight group under cursor
	if !exists("*synstack")
		return
	endif
	return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

fun! biblio#folding_text ()
	" Folding text
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

fu! biblio#tablabel (onglet)
	" Label of a tab
	let cur_circle = wheel#referen#circle ()
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

fu! biblio#tabline ()
	" Tab line
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
		let s .= ' %{biblio#tablabel(' . (i + 1) . ')} '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'
	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
	let s .= '%=%#TabLine#%999X[X]'
	endif
	return s
endfu
