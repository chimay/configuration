# vim: set filetype=tmux.conf :

# Ligne de commande {{{1

#set -g message-style 'fg=#B36700,dim'

set -g message-style 'fg=#9b3c11'
set -ag message-style 'bg=#070403'

set -g message-command-style fg=green
set -ag message-command-style bg=black

# }}}1

# Barre de statut {{{1

#set -g status-style underscore
set -g status-style none
set -ag status-style 'fg=#5b3c11'
set -ag status-style bg=black

set -g window-status-current-style none
set -ag window-status-current-style 'fg=#9b3c11'
set -ag window-status-current-style bg=black

set -g window-status-last-style none
set -ag window-status-last-style 'fg=#5b3c11'
set -ag window-status-last-style bg=black

# }}}1

# Panneaux {{{1

set -g pane-active-border-style "fg=#754321"
set -g pane-border-style "fg=#341207"

# }}}1

# Mode copie {{{1

set -g mode-style fg=black
set -ag mode-style "bg=#5b3c11"

# }}}1

# }}}1

# Contenu {{{1

#set -g status-left " #S > #W > #P #[fg=red,none]#{s/root//:client_key_table}#[fg=default,underscore] #[none]#{prefix_highlight}#[default]"
set -g status-left " #S > #W > #P #[fg=red,none]#{s/root//:client_key_table}#[fg=default] #[none]#{prefix_highlight}#[default]"

set -g status-right ' %H:%M %A %d %B %Y'

set -g window-status-separator ' | '

set -g window-status-format '#I #W#F'
set -g window-status-current-format '#[none][ #I #W#F ]#[default]'

# }}}1
