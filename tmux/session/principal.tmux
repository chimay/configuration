# vim: set filetype=tmux.conf :

rename-session principal
rename-window shell

new-window -d -n courriel '~/racine/shell/run/lance-mutt.zsh'

new-window -d -n monitor '~/racine/shell/alarm/alarm-sensor.zsh +80 ++85 -30 7'

split-window -h -d -t principal:monitor 'zsh -l'

select-pane -t principal:monitor.2

split-window -v -d -t principal:monitor 'ncmpcpp'

resize-pane -L -t principal:monitor.1 65

new-window -d -n musique 'cmus'

new-window -d -n chaton '~/racine/shell/run/lance-weechat.zsh -a'
