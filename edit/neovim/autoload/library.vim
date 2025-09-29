" vim: set ft=vim fdm=indent iskeyword&:

" ---- helpers

fun! library#clear_status ()
    " Clear command line space
    " Does not clear the vim messages
    " credit :
    " https://neovim.discourse.group/t/how-to-clear-the-echo-message-in-the-command-line/268/2
    call feedkeys(':','nx')
endfun

fun! library#clear_messages ()
    " Clear vim messages
    messages clear
    echo 'messages cleared'
endfun

fun! library#execute (command)
	" Execute command in argument
	" Wrapper for vim-which-key
	execute a:command
endfun

fun! library#feedkeys (keys)
	" Feed keys in argument
	let keys = a:keys
	call feedkeys(keys,'n')
endfun

fun! library#complete_file_in_current_subtree (arglead, cmdline, cursorpos)
	" Complete with file name in current subtree
	" Use glob(expr, nosuf, list, alllinks)
	" nosuf, list, alllinks = false by default
	let cmdline = a:cmdline
	let arglead = a:arglead
	let cursorpos = a:cursorpos
	" ---- get tree of files & directories
	let tree = glob('**', v:false, v:true)
	eval tree->filter({ _, v -> v =~ cmdline})
	return tree
endfun

fun! library#complete_file_in_current_file_subtree (arglead, cmdline, cursorpos)
	" Complete with file name in current file subtree
	" Use glob(expr, nosuf, list, alllinks)
	" nosuf, list, alllinks = false by default
	let cmdline = a:cmdline
	let arglead = a:arglead
	let cursorpos = a:cursorpos
	" ---- get tree of files & directories
	let path = expand('%:p:h') . '/'
	execute 'lcd' path
	let tree = glob('**', v:false, v:true)
	eval tree->filter({ _, v -> v =~ cmdline})
	return tree
endfun

fun! library#full_path (...)
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

fun! library#relative_path (...)
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
	let filename = library#full_path (filename)
	let filename = fnamemodify(filename, ':.')
	return filename
endfun

" ---- help, informations

fun! library#helptags ()
	" Run helptags on doc dir
	if ! isdirectory('doc')
		echomsg 'doc is not a directory'
		return v:false
	endif
	helptags doc
	echomsg 'helptags updated'
	return v:true
endfun

fun! library#toggle_help_filetype ()
	" Toggle help / conf filetype
	if &filetype == 'help'
		set filetype=conf
	elseif &filetype == 'conf'
		set filetype=help
	endif
endfun

fun! library#highlight_group ()
	" Yanks and returns highlight group under cursor
	if !exists("*synstack")
		return 'synstack does not exist'
	endif
	let group = map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	let @+ = join(group, ' ')
	return group
endfun

" ---- man

fun! library#manual ()
	" Open a manual tab
	let arguments = input('Man args : ', '', 'shellcmd')
	execute 'Man' arguments
	execute "normal! \<c-w>T"
endfun

fun! library#manual_argv ()
	" Open a manual tab from vim command arguments
	let argv = argv()
	let arguments = join(argv, ' ')
	exe 'Man' arguments
	only
endfun

fun! library#manual_sections ()
	" Uses location list to display a manual page sections
	" -- vimgrep / copen for quickfix or
	" -- lvimgrep / lopen for location list of current window
	lvimgrep /^[A-Z][A-Z ]*$/ %
	lopen
	" -- add regex to search register
	" -- to be able tu use n/N to search next or previous
	let @/ = '^[A-Z][A-Z ]*$'
	" -- uncomment to put the list on the left side
	"wincmd H
	"vert resize 35
	" -- back to man page window
	"wincmd p
endfun

fun! library#manual_commands ()
	" Uses location list to display a manual page sections
	" -- vimgrep / copen for quickfix or
	" -- lvimgrep / lopen for location list of current window
	lvimgrep /^\s*[a-z-]\+\s\+/ %
	lopen
	" -- add regex to search register
	" -- to be able tu use n/N to search next or previous
	let @/ = '^\s*[a-z-]\+\s\+'
	" -- back to man page window
	"wincmd p
endfun

fun! library#manual_options ()
	" Uses location list to display a manual page options
	" -- vimgrep / copen for quickfix or
	" -- lvimgrep / lopen for location list of current window
	lvimgrep /^\s*--\?[a-zA-Z][a-zA-Z-]*,\?\s/ %
	lopen
	" -- add regex to search register
	" -- to be able tu use n/N to search next or previous
	let @/ = '^\s*--\?[a-zA-Z][a-zA-Z-]*,\?\s'
	" -- back to man page window
	"wincmd p
endfun

fun! library#manual_links ()
	" Uses location list to display a manual page links
	" to other manual pages
	" -- vimgrep / copen for quickfix or
	" -- lvimgrep / lopen for location list of current window
	lvimgrep /\w\+([0-9])/ %
	lopen
	" -- add regex to search register
	" -- to be able tu use n/N to search next or previous
	let @/ = '\w\+([0-9])'
	" -- back to man page window
	"wincmd p
endfun

fun! library#manual_open_list ()
	" open location list in man page
	" -- copen for quickfix or lopen for location list of current window
	lopen
endfun

fun! library#manual_close_list ()
	" close location list in man page
	" -- cclose for quickfix or lclose for location list of current window
	lclose
endfun

fun! library#manual_quit ()
	" quit manual buffer
	silent! lclose
	quit
endfun

" ---- moon

fun! library#moonphase ()
	" Moonphase, based on moonphase.py
	" Credit : http://inamidst.com/code/moonphase.py
	let moonphase = systemlist('~/racine/shell/calendar/moonphase.py')[0]
	let words = split(moonphase)
	" cycle : 0.0 = new moon ; 0.5 = full moon ; 1.0 = new moon
	let cycle = str2float(words[-1])
	" visible : 0.0 = new moon ; 1.0 = full moon
	let visible = 1.0 - 2 * abs(cycle - 0.5)
	" waxing or waning ?
	if cycle == 0.0 || cycle == 0.5 || cycle == 1.0
		let growth = 'neutral'
	elseif cycle < 0.5
		let growth = 'waxing'
	else
		let growth = 'waning'
	endif
	let moonphase = 'moon : '
	let moonphase ..= tolower(join(words[:-2]))
	let moonphase ..= '    cycle : ' .. string(cycle)
	let moonphase ..= '    visible : ' .. string(visible)
	let moonphase ..= '    ' .. growth
	return moonphase
endfun

" ---- file

fun! library#source_current_file ()
	" Source current file
	let filename = library#relative_path('%')
	let extension = fnamemodify(filename, ':e')
	if extension !=# 'vim'
		return 'not a vim file'
	endif
	source %
	echo 'file' filename 'sourced'
	return 'file sourced'
endfun

fun! library#edit_in_current_file_subtree ()
	" Edit file with completion in current file subtree
	let complete = 'customlist,library#complete_file_in_current_file_subtree'
	let file = input('Edit file : ', '', complete)
	let path = expand('%:p:h') . '/'
	execute 'edit' .. path .. file
endfun

fun! library#edit_minisnip_file ()
	" Edit file with completion in miniSnip subtree
	"let directory = getcwd()
	let minisnip_directory = '~/racine/plugin/data/neovim/miniSnip/'
	execute 'lcd' minisnip_directory
	echomsg getcwd()
	let complete = 'customlist,library#complete_file_in_current_subtree'
	let file = input('Edit miniSnip file : ', '', complete)
	execute 'edit' .. minisnip_directory .. file
endfun

fun! library#read_in_current_file_subtree ()
	" Read file with completion in current file subtree
	let complete = 'customlist,library#complete_file_in_current_subtree'
	let file = input('Read file : ', '', complete)
	let path = expand('%:p:h') . '/'
	execute 'read' .. path .. file
endfun

" -- quick access to particular files

fun! library#edit_myvimrc ()
	" Edit $MYVIMRC
	tabedit $MYVIMRC
endfun

fun! library#reload_myvimrc ()
	" Reload $MYVIMRC
	source $MYVIMRC
endfun

fun! library#edit_attic ()
	" Edit attic (Grenier)
	vsplit
	let attic = expand('%:p:h') . '/Grenier'
	execute 'edit' attic
	normal G
endfun

fun! library#edit_cronos ()
	" Edit cronos.org
	tabedit ~/racine/plain/organize/cronos.org
endfun

fun! library#edit_dream ()
	" Edit dream.org
	tabedit ~/racine/plain/orgmode/dream.org
	let end = line('$')
	let today = strftime('%A %d')
	let heading = '*** ' .. today
	let moonphase = library#moonphase ()
	call append(end, ['', heading, '', '', '', moonphase])
	let curline = line('$') - 2
	call cursor(curline, 1)
	normal zx
endfun

fun! library#edit_fix ()
	" Edit fix.org
	tabedit ~/racine/plain/orgmode/fix.org
	normal ggzx
endfun

fun! library#edit_ship_log ()
	" Edit ship log
	tabedit ~/racine/log/ship/captain.md
	normal ggzx
endfun

fun! library#edit_syntax_plugin ()
	" Edit syntax plugin file
	let file = expand('~/racine/config/edit/neovim/after/syntax/')
	let file = file .. &filetype .. '.vim'
	execute 'keepjumps vsplit' file
endfun

fun! library#edit_tasks ()
	" Edit tasks.org
	tabedit ~/racine/plain/orgmode/tasks.org
	normal ggzx
endfun

" ---- buffer

fun! library#write_all ()
	" Write all modified buffers
	wall
	echomsg 'all buffers saved'
endfun

" -- wrap begin & end

fun! library#wrap_up ()
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

fun! library#wrap_down ()
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

fun! library#toggle_readonly ()
	" Toggle readonly & nomodifiable
	if &modifiable || ! &readonly
		setlocal readonly nomodifiable
	else
		setlocal noreadonly modifiable
	endif
	setlocal readonly? modifiable?
endfun

fun! library#toggle_relative_linum ()
	" Toggle relative number
	if &relativenumber
		set number norelativenumber
	else
		set number relativenumber
	endif

	set relativenumber?
endfun

" -- smart tab

fun! library#smart_tab ()
	" Tab with contextual behaviour in insert mode
	" For :map-expression
	" If char before cursor is a space, return <c-t> to indent
	" Else, return <c-n> to complete
	let previous_column = col('.') - 2
	if previous_column >= 0
		let previous = getline('.')[:previous_column]
	else
		let previous = ''
	endif
	if empty(previous)
		return "\<c-t>"
	elseif previous =~ '\m^\s*$'
		return "\<c-t>"
	elseif previous[-1:] =~ '\m\S'
		return "\<c-n>"
	else
		return "\<c-v>\<tab>"
	endif
endfun

" -- exchange

fun! library#swap (object, with = 'after')
	" Swap with object after or before current one
	let object = a:object
	" ---- with : swap with object after or before current one
	let with = a:with
	if object ==# 'characters'
		if with ==# 'after'
			normal xp
		else
			normal Xp
		endif
	elseif object ==# 'words'
		if with ==# 'after'
			normal bdwelp
		else
			return 'not implemented'
		endif
	elseif object ==# 'lines'
		if with ==# 'after'
			normal ddp
		else
			normal ddkP
		endif
	elseif object ==# 'paragraphs'
		if with ==# 'after'
			normal {dap}P{
		else
			return 'not implemented'
		endif
	endif
endfun

" -- search & replace

fun! library#search_word ()
	" Search word
	let word = input('Search word : ')
	let pattern = '\m\<' .. word .. '\>'
	let @/ = pattern
	let found = search(pattern, 'w')
	if found == 0
		call library#clear_status ()
		echomsg 'word' word 'not found'
		return v:false
	endif
	return v:true
endfun

fun! library#search_and_replace_word ()
	" Search and replace word
	let word = input('Replace word : ')
	let after = input('Replace by : ')
	let before = '\m\<' .. word .. '\>'
	" ---- check if word is in the buffer
	let found = search(before, 'nw')
	if found == 0
		call library#clear_status ()
		echomsg 'word' word 'not found'
		return v:false
	endif
	" ---- check replacing pattern is not present if buffer
	let check = after
	"let check = '\m\<' .. after .. '\>'
	let found = search(check, 'nw')
	if found > 0
		let prompt = 'Replacing pattern ' .. after .. ' found in buffer. Continue ?'
		let continue = confirm(prompt, "&Yes\n&No", 2)
		if continue == 2
			return v:false
		endif
	endif
	" ---- replace
	let runme = 'silent % substitute/' .. before .. '/' .. after .. '/g'
	execute runme
	return v:true
endfun

" -- global actions on buffer lines

fun! library#global_yank (pattern, ...)
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

fun! library#global_delete (pattern, ...)
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

command! -nargs=1 GlobalYank :call library#global_yank(<q-args>, 'a')<cr>
command! -nargs=1 GlobalDelete :call library#global_delete(<q-args>, 'a')<cr>

" -- banner

fun! library#figlet ()
	" Insert figlet banner at current line
	let text = input('Text : ')
	execute 'read ! figlet' text
endfun

" -- passwords

fun! library#text_to_password ()
	" Insert some digits & special chars in password
	silent! % substitute/a/4/g
	silent! % substitute/b/6/g
	silent! % substitute/e/3/g
	silent! % substitute/g/9/g
	silent! % substitute/i/1/g
	silent! % substitute/l/£/g
	silent! % substitute/o/0/g
	silent! % substitute/s/$/g
endfun

fun! library#password_to_text ()
	" Remove digits & special chars from password
	silent! % substitute/4/a/g
	silent! % substitute/6/b/g
	silent! % substitute/3/e/g
	silent! % substitute/9/g/g
	silent! % substitute/1/i/g
	silent! % substitute/£/l/g
	silent! % substitute/0/o/g
	silent! % substitute/\$/s/g
endfun

" ---- windows & tabs

fun! library#equal_windows ()
	" Equalize windows on all tabs
	let current_tab = tabpagenr()
	tabdo wincmd =
	execute current_tab .. 'tabnext'
endfun

fun! library#win2prev_tab ()
	" Send window to previous tab
	let bufnum = bufnr('%')
	close
	tabnext -1
	split
	execute 'buffer' bufnum
endfun

fun! library#win2next_tab ()
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

" -- generate expressions for foldings, tabs, etc

fun! library#folding_text ()
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

fun! library#tablabel (tabnum)
	" Label of a tab
	let tabnum = a:tabnum
	let buflist = tabpagebuflist(tabnum)
	let winnr = tabpagewinnr(tabnum)
	let buffernr = buflist[winnr - 1]
	let buffername = bufname(buffernr)
	let filename = fnamemodify(buffername, ':t')[0:14]
	let label = ''
	for bufnr in buflist
		if getbufvar(bufnr, "&modified")
			let label .= '[+]'
			break
		endif
	endfor
	return tabnum .. '. ' .. filename .. ' ' .. label
endfu

fun! library#tabline ()
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
		let title .= ' %{library#tablabel(' . tabnum . ')} '
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

fun! library#terminal ()
	" Run terminal in new split
	if has('nvim')
		let default_shell = 'zsh -l'
	else
		if executable('fish')
			let default_shell = 'fish -l'
		else
			let default_shell = 'bash -l'
		endif
	endif
	let shell = input('Shell to use ? ', default_shell)
	if empty(shell)
		return v:false
	endif
	if has('nvim')
		tabnew
		execute 'terminal' shell
	else
		execute 'terminal ++close' shell
		" if terminal is the only window,
		" it causes strange characters on gvim window on quit
		"execute "normal! \<c-w>T"
	endif
endfun

" ---- disc operations

fun! library#chmodexec ()
	" Make current file executable
	let filename = library#full_path()
	let chmod = 'chmod +x ' .. filename
	let output = system(chmod)
	let list = 'ls -l ' .. filename
	let info = systemlist(list)[0]
	echomsg info
endfun

fun! library#format_name (filename)
	" Format filename to avoid annoying characters
	let filename = a:filename
	let filename = library#full_path (filename)
	let filename = substitute(filename, ' ', '_', 'g')
	return filename
endfun

fun! library#mkdir (directory)
	" Create directory if non existent
	let directory = fnamemodify(a:directory, ':p')
	" ---- check not empty
	if empty(directory)
		echomsg 'biblio mkdir : dir name cannot be empty'
		return 'empty-dir-name'
	endif
	" ---- format dir name
	let directory = library#format_name (directory)
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

fun! library#copy (source, destination, ask = 'confirm')
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
	let source = library#full_path (source)
	let destination = library#format_name (destination)
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
	let returnstring = library#mkdir(directory)
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

" ---- publish

if exists('s:dont_publish')
	unlockvar! s:dont_publish
endif
let s:dont_publish = [
	\ '\m.*perso.*',
	\ '\m.*qutebrowser/config.*',
	\ '\m.*bookmark.*',
	\ '\m.*quickmark.*',
	\ '\m.*pass-to-gpg-symmetric.*',
	\ '\m.*pass-to-age.*',
	\ '\m.*rofi-pass.*',
	\ '\m.*torrc.*',
	\ '\m.*install-essential-folders.*',
	\ '\mGrenier',
	\ ]
lockvar! s:dont_publish

fun! library#publish ()
	" Copy current file to ~/public/...
	let source = library#full_path ()
	for pattern in s:dont_publish
		if source =~ pattern
			return 'dont-publish-file'
		endif
	endfor
	if source =~ '\m^' .. $HOME .. '/racine/config'
		let mode = 'config'
		let repo = 'configuration'
	elseif source =~ '\m^' .. $HOME .. '/racine/fun'
		let mode = 'fun'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/self'
		let mode = 'self'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/shell'
		let mode = 'shell'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/automat'
		let mode = 'automat'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/snippet'
		let mode = 'snippet'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/site'
		let mode = 'site'
		let repo = 'scripts/' .. mode
	elseif source =~ '\m^' .. $HOME .. '/racine/musica/lilypond/template'
		let mode = 'musica/lilypond/template'
		let repo = 'lilypond-templates'
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
	let returnstring = library#copy (source, destination, 'force')
	if returnstring ==# 'success'
		let source_tilde = fnamemodify(source, ':~')
		let destination_tilde = fnamemodify(destination, ':~')
		echomsg 'publish : copied' source_tilde '->' destination_tilde
	endif
	return returnstring
endfun

" ---- music

fun! library#make_midi ()
	" Make midi file from lilypond file
	call library#write_all ()
	let extension = fnamemodify(expand('%'), ':e:e')
	if extension == 'mld.ly'
		let shortname = fnamemodify(expand('%'), ':t:r:r')
		let parent    = fnamemodify(expand('%'), ':h:h')
		let filename = parent .. '/' .. shortname
		let midiname = filename .. '.midi'
	elseif extension == 'ly'
		let filename = fnamemodify(expand('%'), ':p:r')
		let midiname = filename .. '.midi'
	else
		return 'filetype not supported'
	endif
	setlocal makeprg=make
	execute 'make! -k' midiname
	return 'success'
endfun

fun! library#make_ogg ()
	" Make ogg file from lilypond file
	call library#write_all ()
	let extension = fnamemodify(expand('%'), ':e:e')
	if extension == 'mld.ly'
		let shortname = fnamemodify(expand('%'), ':t:r:r')
		let parent    = fnamemodify(expand('%'), ':h:h')
		let filename = parent .. '/' .. shortname
		let oggname = filename .. '.ogg'
	elseif extension == 'ly'
		let filename = fnamemodify(expand('%'), ':p:r')
		let oggname = filename .. '.ogg'
	else
		return 'filetype not supported'
	endif
	setlocal makeprg=make
	execute 'make! -k' oggname
	return 'success'
endfun

fun! library#make_mp3 ()
	" Make mp3 file from lilypond file
	call library#write_all ()
	let extension = fnamemodify(expand('%'), ':e:e')
	if extension == 'mld.ly'
		let shortname = fnamemodify(expand('%'), ':t:r:r')
		let parent    = fnamemodify(expand('%'), ':h:h')
		let filename = parent .. '/' .. shortname
		let mp3name = filename .. '.mp3'
	elseif extension == 'ly'
		let filename = fnamemodify(expand('%'), ':p:r')
		let mp3name = filename .. '.mp3'
	else
		return 'filetype not supported'
	endif
	setlocal makeprg=make
	execute 'make! -k' mp3name
	return 'success'
endfun

fun! library#display_pdf ()
	" Display pdf file from lilypond file
	call library#write_all ()
	let extension = fnamemodify(expand('%'), ':e:e')
	if extension == 'mld.ly'
		let shortname = fnamemodify(expand('%'), ':t:r:r')
		let parent    = fnamemodify(expand('%'), ':h:h')
		let filename = parent .. '/' .. shortname
		let pdfname = filename .. '.pdf'
	elseif extension == 'ly'
		let filename = fnamemodify(expand('%'), ':p:r')
		let pdfname = filename .. '.pdf'
	else
		return 'filetype not supported'
	endif
	setlocal makeprg=make
	execute 'make! -k' pdfname
	let display = 'zathura ' .. pdfname .. '&'
	echomsg display
	let output = system(display)
	"echomsg output
	return 'success'
endfun
