# vim: set filetype=tmux.conf :

rename-session principal

select-window -t 0

kill-window -a

rename-window shell

new-window -d -n sand
new-window -d -n wave
new-window -d -n repo
new-window -d -n mail
new-window -d -n irc
