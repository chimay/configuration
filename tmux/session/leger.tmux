# vim: set filetype=tmux.conf :

rename-session leger
rename-window shell

new-window -d -n remote 'zsh -l'

new-window -d -n monitor '~/racine/shell/alarm/alarm-sensor.zsh +80 ++85 -30 7'

split-window -h -d -t leger:monitor 'zsh -l'

select-pane -t leger:monitor.2

split-window -v -d -t leger:monitor 'ncmpcpp'

resize-pane -L -t leger:monitor.1 54
