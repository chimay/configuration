# vim: set filetype=tmux.conf :

# Liste de plugins {{{1

set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-yank'

set -g @plugin 'tmux-plugins/tmux-urlview'
set -g @plugin 'laktak/extrakto'

set -g @plugin 'tmux-plugins/tmux-logging'

set -g @plugin 'whame/tmux-modal'

# set -g @plugin 'tmux-plugins/tmux-resurrect'
# set -g @plugin 'tmux-plugins/tmux-continuum'

# }}}1

# Configuration {{{1

set -g @prefix_highlight_output_prefix '['
set -g @prefix_highlight_output_suffix ']'
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_fg '1'
set -g @prefix_highlight_bg 'default'
set -g @prefix_highlight_copy_mode_attr 'none,fg=1,bg=default'

# clipboard, primary ou secondary
set -g @yank_selection 'clipboard'

# set -g @open 'o'
# set -g @open-editor 'C-o'
# set -g @urlview-key 'u'

set -g @modal-yesno-cmd on

set -g @extrakto_key 'tab'
set -g @extrakto_split_direction 'p'
set -g @extrakto_split_size '50%'
set -g @extrakto_popup_size '90%'

#set -g @resurrect-capture-pane-contents 'on'
#set -g @resurrect-processes 'ncmpcpp cmus elinks alarm-sensor.zsh'
# set -g @resurrect-save 'C-S'
# set -g @resurrect-restore 'C-R'

# set -g @continuum-boot 'on'
# set -g @continuum-systemd-start-cmd 'new-session -d'
# set -g @continuum-save-interval '300'
#set -g @continuum-restore 'on'

# }}}1

# Installation automatique {{{1

# if "test ! -d ~/.tmux/plugins/tpm" \
#    "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

# }}}1

# Initialisation {{{1

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)

run '~/racine/plugin/manager/tmux-plugins/tpm/tpm'

# }}}1

# }}}1
