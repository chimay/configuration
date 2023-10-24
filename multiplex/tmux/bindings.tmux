# vim: set filetype=tmux.conf :

# Préfixe {{{1

unbind C-b

set -g prefix F1

# Pass F1 prefix to term apps

bind F1 send-prefix

# Temps max de répétition sans préfixe

set -g repeat-time 1275


# Key tables {{{1

bind -n F2 switch-client -T custom
bind -n F3 switch-client -T resize
bind -n F4 copy-mode


# Rechargement de tmux.conf {{{1

bind -T custom @ \
	source ~/racine/config/multiplex/tmux/tmux.conf \; \
	display-message 'tmux.conf reloaded'


# Aide {{{1

bind -T custom H list-keys


# Quitter {{{1

bind -T custom q confirm kill-pane
bind -T custom M-q confirm kill-window
bind -T custom Q confirm kill-session
bind -T custom C-q confirm kill-server


# Messages {{{1

bind -T custom i show-messages


# Barre de statut {{{1

bind -T custom b set-option status


# Ligne de commande {{{1

bind ':' command-prompt -p 'tmux :'

# Menu

bind -T custom ':' send-keys '~/racine/shell/dialog/fzf-tmux-command.zsh' Enter
bind -T custom ';' send-keys '~/racine/shell/dialog/fzf-tmux-command.zsh -s' Enter

# Historique

bind -T custom µ send-keys '~/racine/shell/dialog/fzf-tmux-history.zsh' Enter
bind -T custom £ send-keys '~/racine/shell/dialog/fzf-tmux-history.zsh -s' Enter


# Sessions {{{1

bind -T custom s split-window -p 30 'exec ~/racine/shell/dialog/fzf-tmux-session.zsh'

bind -T custom S command-prompt -p 'Nom de la nouvelle session ? ' "new-session -s '%%'"
bind -T custom M command-prompt -p 'Nouveau nom de la session ? ' "rename-session '%%'"

bind -T custom d detach-client

# Précédente, Suivante

bind -T custom '{' switch-client -p
bind -T custom '}' switch-client -n


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



# Verrouillage {{{1

bind -T custom M-l lock-client


# Arbre des Sessions, Fenêtres & Panels {{{1

bind -T custom § choose-tree -Zw


# Tmux windows = tabs {{{1

bind -T custom t command-prompt \
	-p 'Nom de la nouvelle fenêtre ? ' \
	-I 'shell' \
	"new-window -n '%%'"

bind -T custom M-t command-prompt -p 'Commande de la nouvelle fenêtre ? ' "new-window '%%'"

bind -T custom $ split-window -p 30 'exec ~/racine/shell/dialog/fzf-tmux-new-cli.zsh'
bind -T custom ! split-window -p 30 'exec ~/racine/shell/dialog/fzf-tmux-new-tui.zsh'

bind -T custom m command-prompt -p 'Nouveau nom de la fenêtre ? ' "rename-window '%%'"

bind -n C-PageUp previous-window
bind -n C-PageDown next-window

bind -T custom '^' last-window

bind -T custom '(' move-window -t :-1
bind -T custom ')' move-window -t :+1

bind -T custom 1 select-window -t :=1
bind -T custom 2 select-window -t :=2
bind -T custom 3 select-window -t :=3
bind -T custom 4 select-window -t :=4
bind -T custom 5 select-window -t :=5
bind -T custom 6 select-window -t :=6
bind -T custom 7 select-window -t :=7
bind -T custom 8 select-window -t :=8
bind -T custom 9 select-window -t :=9
bind -T custom 0 select-window -t :=10

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

bind -T custom M-$ set -w synchronize-panes


# Commande en arrière-plan {{{1

bind -T custom '&' command-prompt -p 'Commande à lancer ? ' "run-shell -b '%%'"


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


# Mode copie {{{1

bind -T custom p paste-buffer
bind -T custom '"' choose-buffer
bind -T custom 'M-"' list-buffers

bind -T copy-mode-vi 'v' send -X  begin-selection
bind -T copy-mode-vi 'C-v' send -X rectangle-toggle

bind -T copy-mode-vi 'y' send -X  copy-selection
bind -T copy-mode-vi 'p' send -X  paste-buffer
