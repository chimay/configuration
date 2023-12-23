" vim: set ft=vim fdm=indent iskeyword&:

fun! mail#library#send_archive ()
	"let sujet = "archives : " . expand('%:r:r')
	let sujet = "archives : " . expand('%')
	let attache = expand('%:p')
	let destinataire = 'nice@mail.net'
	exe '! mutt -a' attache '-s "' . sujet . '" --' destinataire '< ~/racine/common/mail/archive'
endfun
