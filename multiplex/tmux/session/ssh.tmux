# vim: set filetype=tmux.conf :

rename-session ssh
select-window -t 1
kill-window -a
rename-window shell
new-window -d -n sand
new-window -d -n wave
