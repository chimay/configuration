" vim: set ft=vim fdm=indent iskeyword&:

" ---- help, informations

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

fun! biblio#toggle_help_filetype ()
	" Toggle help / conf filetype
	if &filetype == 'help'
		set filetype=conf
	elseif &filetype == 'conf'
		set filetype=help
	endif
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

" ---- buffer

fun! biblio#write_all ()
	" Write all modified buffers
	wall
	echomsg 'all buffers saved'
endfun

" -- wrap begin & end

fun! biblio#wrap_up ()
	" Line up, or line 1 -> end of file
	" If fold is closed, take the first line of it
	if &l:foldenable
		let line = foldclosed('.')
		if line < 0
			let line = line('.')
		endif
	else
		let line = line('.')
	endif
	" Wrap
	if line == 1
		call cursor(line('$'), 1)
	else
		normal! k
	endif
	return v:true
endfun

fun! biblio#wrap_down ()
	" Line down, or line end of file -> 1
	" If fold is closed, take the last line of it
	if &l:foldenable
		let line = foldclosedend('.')
		if line < 0
			let line = line('.')
		endif
	else
		let line = line('.')
	endif
	if line == line('$')
		call cursor(1, 1)
	else
		normal! j
	endif
	return v:true
endfun

" -- switches

fun! biblio#toggle_readonly ()
	" Toggle readonly & nomodifiable
	if &modifiable || ! &readonly
		setlocal readonly nomodifiable
	else
		setlocal noreadonly modifiable
	endif
	setlocal readonly? modifiable?
endfun

fun! biblio#toggle_relative_linum ()
	" Toggle relative number
	if &relativenumber
		set number norelativenumber
	else
		set number relativenumber
	endif

	set relativenumber?
endfun

" -- global actions on buffer lines

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

" -- passwords

fun! biblio#text_to_password ()
	" Insert some digits in password
	silent! % substitute/a/4/g
	silent! % substitute/e/3/g
	silent! % substitute/i/1/g
	silent! % substitute/o/0/g
endfun

" ---- windows & tabs

fun! biblio#equal_windows ()
	let current_tab = tabpagenr()
	tabdo wincmd =
	execute current_tab .. 'tabnext'
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

" --- generate expressions for foldings, tabs, etc

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
	let text = '+-- {{{ ' .. v:foldlevel .. ' :: ' .. text .. ' :: ' .. Nlignes .. ' lines' .. ' }}} ' .. v:folddashes
	let text = substitute(text, ' \{2,}', ' ', 'g')
	return text
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

" ---- terminal

fun! biblio#terminal ()
	" Run terminal in new split
	let shell = input('Shell to use ? ', 'zsh')
	if empty(shell)
		return
	endif
	tabnew
	execute 'terminal' shell
endfun

" ---- disc operations

fun! biblio#full_path (...)
	" Return filename full path
	" Default : current file name
	" % -> current filename
	" # -> alternate filename
	if a:0 > 0
		let filename = a:1
	else
		let filename = expand('%')
	endif
	if filename ==# '%'
		let filename = getreg('%')
	endif
	if filename ==# '#'
		let filename = getreg('#')
	endif
	let filename = trim(filename, ' ')
	let filename = fnamemodify(filename, ':p')
	let filename = fnameescape(filename)
	return filename
endfun

fun! biblio#format_name (filename)
	" Format filename to avoid annoying characters
	let filename = a:filename
	let filename = biblio#full_path (filename)
	let filename = substitute(filename, ' ', '_', 'g')
	return filename
endfun

fun! biblio#relative_path (...)
	" Return path of filename relative to current directory
	" Optional argument :
	"   - filename
	"   - default : current filename
	if a:0 > 0
		let filename = a:1
	else
		let filename = expand('%:p')
	endif
	" ---- check not empty
	if empty(filename)
		echomsg 'biblio relative_path : file name cannot be empty'
		return 'empty-file-name'
	endif
	let filename = biblio#full_path (filename)
	let filename = fnamemodify(filename, ':.')
	return filename
endfun

fun! biblio#mkdir (directory)
	" Create directory if non existent
	let directory = fnamemodify(a:directory, ':p')
	" ---- check not empty
	if empty(directory)
		echomsg 'biblio mkdir : dir name cannot be empty'
		return 'empty-dir-name'
	endif
	" ---- format dir name
	let directory = biblio#format_name (directory)
	" ---- nothing to do if directory already exists
	if isdirectory(directory)
		return 'nothing-to-do'
	endif
	" ---- create directory
	echomsg 'mkdir : creating directory' directory
	let success = mkdir(directory, 'p')
	if ! success
		echomsg 'mkdir : error creating directory' directory
		return 'failure'
	endif
	return 'success'
endfun

fun! biblio#copy (source, destination, ask = 'confirm')
	" Copy file ; perform some checks
	let source = a:source
	let destination = a:destination
	let ask = a:ask
	" ---- check not empty
	if empty(source)
		echomsg 'rename : file name cannot be empty'
		return 'empty-source-file-name'
	endif
	if empty(destination)
		echomsg 'rename : file name cannot be empty'
		return 'empty-destination-file-name'
	endif
	" ---- full path
	let source = biblio#full_path (source)
	let destination = biblio#format_name (destination)
	" ---- nothing to do if source == destination
	if source ==# destination
		echomsg 'copy : nothing to do if new filename == old one'
		return 'nothing-to-do'
	endif
	" ---- check source is directory
	if isdirectory(source)
		echomsg 'copy : source must be a regular file'
		return 'source-is-directory'
	endif
	" ---- check non existent source
	if ! filereadable(source)
		echomsg 'copy : source file not readable'
		return 'source-not-readable'
	endif
	" ---- check existent destination
	if ask ==# 'confirm' && filereadable(destination)
		let prompt = 'Replace existing ' .. destination .. ' ?'
		let overwrite = confirm(prompt, "&Yes\n&No", 2)
		if overwrite != 1
			return 'confirm-replace-destination-no'
		endif
	endif
	" ---- create directory if needed
	let directory = fnamemodify(destination, ':h')
	let returnstring = biblio#mkdir(directory)
	if returnstring ==# 'failure'
		return 'failure'
	endif
	" ---- copy
	let content = readfile(source, 'b')
	let zero = writefile(content, destination, 'b')
	if zero != 0
		return 'failure'
	endif
	return 'success'
endfun

fun! biblio#publish ()
	" Copy current file to ~/public/...
	let source = biblio#full_path ()
	if source =~ '\m^' .. $HOME .. '/racine/shell'
		let mode = 'shell'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/automat'
		let mode = 'automat'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/config'
		let mode = 'config'
		let repo = 'configuration'
	endif
	let source_dir = $HOME .. '/racine/' .. mode
	let target_dir = $HOME .. '/racine/public/' .. repo
	let destination = source->substitute(source_dir, target_dir, '')
	if ! filereadable(destination)
		let prompt = destination .. ' does not exists. Sure you want to publish ? '
		let publish = confirm(prompt, "&Yes\n&No", 2)
		if publish != 1
			return 'confirm-publish-no'
		endif
	endif
	let returnstring = biblio#copy (source, destination, 'force')
	if returnstring ==# 'success'
		echomsg 'publish : copied' source '->' destination
	endif
	return returnstring
endfun
