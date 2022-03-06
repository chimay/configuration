# vim: set filetype=tmux.conf :

# Préfixe {{{1

unbind C-b

set -g prefix F1

bind F1 send-prefix

# Répétition sans préfixe

set -g repeat-time 1275

# }}}1

# Key tables {{{1

bind -n F2 switch-client -T custom
bind -n F3 switch-client -T resize
bind -n F4 copy-mode

# }}}1

# Rechargement de tmux.conf {{{1

bind -T custom @ source-file ~/racine/config/multiplex/tmux/tmux.conf \; \
		display-message 'Fichier de configuration rechargé'

# }}}1

# Aide {{{1

bind -T custom H list-keys

# }}}1

# Quitter {{{1

bind -T custom q confirm kill-pane
bind -T custom M-q confirm kill-window
bind -T custom Q confirm kill-session
bind -T custom C-q confirm kill-server

# }}}1

# Messages {{{1

bind -T custom i show-messages

# }}}1

# Barre de statut {{{1

bind -T custom b set-option status

# }}}1

# Ligne de commande {{{1

bind ':' command-prompt -p 'tmux :'

# Menu

bind -T custom ':' send-keys '~/racine/shell/dialog/fzf-tmux-command.zsh' Enter
bind -T custom ';' send-keys '~/racine/shell/dialog/fzf-tmux-command.zsh -s' Enter

# Historique

bind -T custom µ send-keys '~/racine/shell/dialog/fzf-tmux-history.zsh' Enter
bind -T custom £ send-keys '~/racine/shell/dialog/fzf-tmux-history.zsh -s' Enter

# }}}1

# Sessions {{{1

bind -T custom s split-window -p 30 'exec ~/racine/shell/dialog/fzf-tmux-session.zsh'

bind -T custom S command-prompt -p 'Nom de la nouvelle session ? ' "new-session -s '%%'"
bind -T custom M command-prompt -p 'Nouveau nom de la session ? ' "rename-session '%%'"

bind -T custom d detach-client

# Précédente, Suivante

bind -T custom '{' switch-client -p
bind -T custom '}' switch-client -n

# }}}1

# Historique d’un panel {{{1

bind -T custom ù send-keys "tmux capture-pane -S - -p | less +G" Enter

bind -T custom c command-prompt -p 'save history to filename:' \
	-I '~/racine/hist/tmux/#h-#S-#W-#P.history' 'capture-pane -S - ; \
	save-buffer %1 ; delete-buffer'

# Active / Désactive la copie de la sortie vers un fichier

bind -T custom p pipe-pane -o 'cat >> ~/racine/hist/tmux/#h-#S-#W-#P.pipe'

# Pipe le pane vers w3m

bind -T custom w capture-pane \; save-buffer /tmp/tmux-buffer \; \
	new-window -n "w3m" '$SHELL -c "w3m < /tmp/tmux-buffer"'

# }}}1

# }}}1

# Verrouillage {{{1

bind -T custom M-l lock-client

# }}}1

# Arbre des Sessions, Fenêtres & Panels {{{1

bind -T custom § choose-tree -Zw

# }}}1

# Tmux windows = tabs {{{1

bind -T custom t command-prompt \
	-p 'Nom de la nouvelle fenêtre ? ' \
	-I 'shell' \
	"new-window -n '%%'"

bind -T custom M-t command-prompt -p 'Commande de la nouvelle fenêtre ? ' "new-window '%%'"

bind -T custom ! split-window -p 30 'exec ~/racine/shell/dialog/fzf-tmux-new-tab.zsh'

bind -T custom m command-prompt -p 'Nouveau nom de la fenêtre ? ' "rename-window '%%'"

bind -n C-PageUp previous-window
bind -n C-PageDown next-window

bind -T custom '^' last-window

bind -T custom '(' move-window -t :-1
bind -T custom ')' move-window -t :+1

# }}}1

# Tmux panes = windows {{{1

# h & v like vim
bind -T custom 'h' split-window -v
bind -T custom 'v' split-window -h

bind -T custom M-h command-prompt -p 'Commande pour le nouveau panel ? ' "split-window -h '%%'"
bind -T custom M-v command-prompt -p 'Commande pour le nouveau panel ? ' "split-window -v '%%'"

bind -T custom "'" display-panes

bind -T custom l last-pane

bind -n S-Left  select-pane -L
bind -n S-Down  select-pane -D
bind -n S-Up    select-pane -U
bind -n S-Right select-pane -R

bind -T custom z resize-pane -Z

bind -T custom -r + resize-pane -U 2
bind -T custom -r - resize-pane -D 2
bind -T custom -r < resize-pane -L 2
bind -T custom -r > resize-pane -R 2

bind -T custom -r S-Up resize-pane -U 2
bind -T custom -r S-Down resize-pane -D 2
bind -T custom -r S-Left resize-pane -L 2
bind -T custom -r S-Right resize-pane -R 2

bind -n C-Down rotate-window -D
bind -n C-Up rotate-window -U

bind -n C-Left  swap-pane -D
bind -n C-Right    swap-pane -U

bind -T custom $ set -w synchronize-panes

# }}}1

# Commande en arrière-plan {{{1

bind -T custom '&' command-prompt -p 'Commande à lancer ? ' "run-shell -b '%%'"

# }}}1

# Mode redimensionnement {{{1

bind -T resize Left  resize-pane -L \; switch-client -T resize
bind -T resize Down  resize-pane -D \; switch-client -T resize
bind -T resize Up    resize-pane -U \; switch-client -T resize
bind -T resize Right resize-pane -R \; switch-client -T resize

bind -T resize S-Left  resize-pane -L 5 \; switch-client -T resize
bind -T resize S-Down  resize-pane -D 5 \; switch-client -T resize
bind -T resize S-Up    resize-pane -U 5 \; switch-client -T resize
bind -T resize S-Right resize-pane -R 5 \; switch-client -T resize

bind -T resize h resize-pane -L \; switch-client -T resize
bind -T resize j resize-pane -D \; switch-client -T resize
bind -T resize k resize-pane -U \; switch-client -T resize
bind -T resize l resize-pane -R \; switch-client -T resize

bind -T resize H resize-pane -L 5 \; switch-client -T resize
bind -T resize J resize-pane -D 5 \; switch-client -T resize
bind -T resize K resize-pane -U 5 \; switch-client -T resize
bind -T resize L resize-pane -R 5 \; switch-client -T resize

# }}}1

# Mode copie {{{1

bind -T custom p paste-buffer
bind -T custom '"' choose-buffer
bind -T custom 'M-"' list-buffers

bind -T copy-mode-vi 'v' send -X  begin-selection
bind -T copy-mode-vi 'C-v' send -X rectangle-toggle

bind -T copy-mode-vi 'y' send -X  copy-selection
bind -T copy-mode-vi 'p' send -X  paste-buffer

# }}}1
