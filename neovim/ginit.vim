" vim: set filetype=vim :

"  {{{ Police
" ------------------------------------------------------------------------

GuiFont Monospace:h11

" }}}

" Version de vim

" {{{ Console

set guipty

" }}}

"  {{{ Sélections
" ------------------------------------------------------------------------

set guioptions+=a

" Pour le modeless (normalement inclus dans le flag a)
set guioptions+=A

" }}}

" {{{ Fonte

set guifont=Monospace\ 11

" }}}

" {{{ Onglets

" Sans les onglets graphiques, affiche les onglets comme dans un terminal

"set guioptions+=e
set guioptions-=e

" }}}

" {{{ Boites de dialogue

" Dialogues simples en format texte
set guioptions+=c

set guioptions-=v
set guioptions-=p

" }}}

" {{{ Avant-plan

set guioptions+=f

" }}}

"  {{{ Fenêtre
" ------------------------------------------------------------------------

if has("gui_running")
  set lines=43
  set columns=150
endif

" }}}

" {{{ Curseur

" set guicursor=
"
" set guicursor+=n:block-blinkwait700-blinkon700-blinkoff250-Cursor/lCursor
" set guicursor+=o:hor35-blinkwait700-blinkon700-blinkoff250-Cursor
"
" set guicursor+=v:block-blinkon0-vCursor/lCursor
" set guicursor+=ve:ver35-blinkon0-vCursor
"
" set guicursor+=i:ver25-blinkwait700-blinkon700-blinkoff250-iCursor/lCursor
" set guicursor+=r:hor20-blinkwait700-blinkon700-blinkoff250-iCursor/lCursor
"
" set guicursor+=sm:block-blinkwait175-blinkoff150-blinkon175-Cursor
"
" set guicursor+=c:block-blinkwait700-blinkon700-blinkoff250-Cursor/lCursor
" set guicursor+=ci:ver25-blinkwait700-blinkon700-blinkoff250-Cursor/lCursor
" set guicursor+=cr:hor20-blinkwait700-blinkon700-blinkoff250-Cursor/lCursor

" }}}

"  {{{ Barres de défilement
" ------------------------------------------------------------------------

" Barre de défilement verticale

set guioptions-=r
set guioptions-=l

" Barre de défilement horizontale

set guioptions-=b
set guioptions-=h

" }}}

"  {{{ Barre de menu
" ------------------------------------------------------------------------

set guioptions-=m

set guioptions-=t
set guioptions-=g

" }}}

"  {{{ Barre d'outils
" ------------------------------------------------------------------------

" Pas de barre d'outils

set guioptions-=T

" }}}

"  {{{ Icone
" ------------------------------------------------------------------------

set guioptions-=i

" }}}
