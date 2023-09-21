# vim: set filetype=tmux.conf :

rename-session plume

select-window -t 0

kill-window -a

rename-window shell

new-window -d -n sand
new-window -d -n wave
