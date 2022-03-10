" vim: ft=vim fdm=indent:

fun! biblio#write_all ()
	" Write all modified buffers
	wall
	echomsg 'all buffers saved'
endfun

fun! biblio#line_number()
	" Toggle relative number
	if &relativenumber
		set number norelativenumber
	else
		set number relativenumber
	endif

	set relativenumber?
endfun

fun! biblio#toggle_help_filetype ()
	" Toggle help / conf filetype
	if &filetype == 'help'
		set filetype=conf
	elseif &filetype == 'conf'
		set filetype=help
	endif
endfun

func! biblio#toggle_readonly()
	" Toggle readonly & nomodifiable
	if &modifiable || ! &readonly
		setlocal readonly nomodifiable
	else
		setlocal noreadonly modifiable
	endif
	setlocal readonly? modifiable?
endfunc

fun! biblio#helptags ()
	" Run helptags on doc dir
	if ! isdirectory('doc')
		echomsg 'doc is not a directory'
		return v:false
	endif
	helptags doc
	echomsg 'helptags updated'
	return v:true
endfun

fun! biblio#terminal ()
	" Run terminal in new split
	let shell = input('Shell to use ? ', 'zsh')
	if empty(shell)
		return
	endif
	tabnew
	execute 'terminal' shell
endfun

fun! biblio#highlight_group ()
	" Display highlight group under cursor
	if !exists("*synstack")
		return
	endif
	let group = map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	echomsg group
	return
endfun

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

fun! biblio#win2prev_tab ()
	" Send window to previous tab
	let bufnum = bufnr('%')
	close
	tabnext -1
	split
	execute 'buffer' bufnum
endfun

fun! biblio#win2next_tab ()
	" Send window to next tab
	let bufnum = bufnr('%')
	let lastwin = winnr('$')
	close
	if lastwin > 1
		tabnext +1
	endif
	split
	execute 'buffer' bufnum
endfun

fun! biblio#folding_text ()
	" Folding text
	let commentaire = substitute(&commentstring, '%s', '', '')
	let text = getline(v:foldstart)
	let text = substitute(text, '{{{[0-9]\?', '', '')				" }}}
	let text = substitute(text, commentaire, '', 'g')
	let text = substitute(text, '	', '', 'g')
	let text = substitute(text, '’', "'", 'g')
	let text = substitute(text, '\C[[=A=]]', 'A', 'g')
	let text = substitute(text, '\C[[=E=]]', 'E', 'g')
	let text = substitute(text, '\C[[=I=]]', 'I', 'g')
	let text = substitute(text, '\C[[=O=]]', 'O', 'g')
	let text = substitute(text, '\C[[=U=]]', 'U', 'g')
	let text = substitute(text, '\C[[=a=]]', 'a', 'g')
	let text = substitute(text, '\C[[=e=]]', 'e', 'g')
	let text = substitute(text, '\C[[=i=]]', 'i', 'g')
	let text = substitute(text, '\C[[=o=]]', 'o', 'g')
	let text = substitute(text, '\C[[=u=]]', 'u', 'g')
	let Nlignes = v:foldend - v:foldstart
	let text = '+-- {{{ ' . text . ' --> Niveau ' . v:foldlevel . ' :: ' . Nlignes . ' lignes' . ' }}} ' . v:folddashes
	let text = substitute(text, ' \{2,}', ' ', 'g')
	return text
endfunc

fun! biblio#org_folding_expr (linum)
	" Folding expression for org mode files
	let content = getline(a:linum)
	let begin = '^\*\{'
	let end = '} '
	for level in range(1, 9)
		let pattern = begin .. level .. end
		if content =~ pattern
			return '>' .. level
		endif
	endfor
	return '='
endfun

fun! biblio#tablabel (tabnum)
	" Label of a tab
	let tabnum = a:tabnum
	let buflist = tabpagebuflist(tabnum)
	let winnr = tabpagewinnr(tabnum)
	let buffernr = buflist[winnr - 1]
	let buffername = bufname(buffernr)
	let filename = fnamemodify(buffername, ':t')
	let label = ''
	for bufnr in buflist
		if getbufvar(bufnr, "&modified")
			let label .= '[+]'
			break
		endif
	endfor
	return tabnum .. '. ' .. filename .. ' ' .. label
endfu

fun! biblio#tabline ()
	" Tab line
	let title = ''
	for tabnum in range(1, tabpagenr('$'))
		" select the highlighting
		if tabnum == tabpagenr()
			let title .= '%#TabLineSel#'
		else
			let title .= '%#TabLine#'
		endif
		" set the tab page number (for mouse clicks)
		let title .= '%' .. tabnum .. 'T'
		" the label is made by MyTabLabel()
		let title .= ' %{biblio#tablabel(' . tabnum . ')} '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let title .= '%#TabLineFill#%T'
	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let title .= '%=%#TabLine#%999X[X]'
	endif
	return title
endfu
