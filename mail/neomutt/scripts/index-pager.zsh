#!/bin/zsh

increment=$1

fichier=~/racine/config/mail/neomutt/data/number-of-lines

# Nombre de lignes

if [[ -e $fichier ]]
then
	numlines=`cat $fichier`
else
	numlines=`neomutt -D | grep pager_index_lines | cut --delimiter== -f	2`
fi

(( numlines += increment ))

echo $numlines >! $fichier

echo "set pager_index_lines=$numlines"
