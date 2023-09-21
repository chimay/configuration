# vim: set ft=sh :

# prompt
PS1='[\u@\h \W]\$ '

#  {{{ Prompt
# ------------------------------------------------------------------------

# function prompt_command {
# 	tput sc
# 	let backwash=$(tput cols)-$(echo $(pwd) | wc -m)-2
# 	tput cup 0 ${backwash}
# 	# tput setaf 4
# 	# tput bold
# 	echo -n "["
# 	# tput setaf 8
# 	echo -n "$(pwd)"
# 	# tput setaf 4
# 	# tput bold
# 	echo -n "]"
# 	tput rc
# }

# }}}
