# vim: set filetype=sh:

function fish_right_prompt -d "Write out the right prompt"

	echo -s (date '+%a %d %b %Y') " --+ "
end
