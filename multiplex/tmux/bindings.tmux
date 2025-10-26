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

# Reload tmux.conf {{{1

bind -T custom @ \
	source ~/racine/config/multiplex/tmux/tmux.conf \; \
	display-message 'tmux.conf reloaded'

# Pass through next key {{{1

bind -n F5 command-prompt -kp 'pass through key' 'send-keys %%%'

# Help {{{1

bind -T custom H list-keys

# Quit {{{1

bind -T custom q confirm kill-pane
bind -T custom M-q confirm kill-window
bind -T custom Q confirm kill-session
bind -T custom C-q confirm kill-server

# Messages {{{1

bind -T custom i show-messages

# Status bar {{{1

bind -T custom b set-option status

# Tmux command line {{{1

bind ':' command-prompt -p 'tmux :'

# Menu

bind -T custom ':' capture-pane \; save-buffer /tmp/tmux-buffer \; delete-buffer \; display-popup -w 80% -h 60% -E "fzf-tmux-command.zsh"
bind -T custom ',' capture-pane \; save-buffer /tmp/tmux-buffer \; delete-buffer \; display-popup -w 80% -h 60% -E "fzf-speed"

# Historique

bind -T custom ';' capture-pane \; save-buffer /tmp/tmux-buffer \; delete-buffer \; display-popup -w 80% -h 60% -E "fzf-tmux-history.zsh"

# Sessions {{{1

bind -T custom s split-window -l 30% 'exec ~/racine/shell/multiplex/fzf-tmux-session.zsh'

bind -T custom S command-prompt -p 'Nom de la nouvelle session ? ' "new-session -s '%%'"
bind -T custom M command-prompt -p 'Nouveau nom de la session ? ' "rename-session '%%'"

bind -T custom d detach-client

# Précédente, Suivante

bind -T custom '{' switch-client -p
bind -T custom '}' switch-client -n

# Panel history {{{1

bind -T custom ù send-keys "tmux capture-pane -S - -p | less +G" Enter

bind -T custom c command-prompt -p 'save history to filename:' \
	-I '~/racine/hist/tmux/#h-#S-#W-#P.history' 'capture-pane -S - ; \
	save-buffer %1 ; delete-buffer'

# Active / Désactive la copie de la sortie vers un fichier

bind -T custom '|' pipe-pane -o 'cat >> ~/racine/hist/tmux/#h-#S-#W-#P.pipe'

# Pipe le pane vers w3m

bind -T custom w capture-pane \; save-buffer /tmp/tmux-buffer \; \
	new-window -n "w3m" '$SHELL -c "w3m < /tmp/tmux-buffer"'

# Lock {{{1

bind -T custom M-l lock-client

# Sessions, windows & panels tree {{{1

bind -T custom § choose-tree -Zw

# Tmux windows = tabs {{{1

bind -T custom t command-prompt \
	-p 'Nom de la nouvelle fenêtre ? ' \
	-I 'shell' \
	"new-window -n '%%'"

bind -T custom M-t command-prompt -p 'Commande de la nouvelle fenêtre ? ' "new-window '%%'"

bind -T custom M-Enter split-window -p 30 'exec ~/racine/shell/multiplex/fzf-tmux-new-cli.zsh'
bind -T custom M-! split-window -p 30 'exec ~/racine/shell/multiplex/fzf-tmux-new-tui.zsh'

bind -T custom m command-prompt -p 'Nouveau nom de la fenêtre ? ' "rename-window '%%'"

bind -n C-PageUp previous-window
bind -n C-PageDown next-window

bind -T custom '^' last-window
bind -n C-Home last-window

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

# split {{{2

# h & v like vim
bind -T custom 'h' split-window -v
bind -T custom 'v' split-window -h

bind -T custom M-h command-prompt -p 'Commande pour le nouveau panel ? ' "split-window -h '%%'"
bind -T custom M-v command-prompt -p 'Commande pour le nouveau panel ? ' "split-window -v '%%'"

# navigation {{{2

#bind -n C-Left  select-pane -L
#bind -n C-Down  select-pane -D
#bind -n C-Up    select-pane -U
#bind -n C-Right select-pane -R

bind -T custom "'" display-panes

bind -T custom '$' last-pane
bind -n C-End last-pane

# Seamless navigation with tmux panes and vim windows
# Smart pane switching with awareness of Vim splits.
#
# credit : https://github.com/christoomey/vim-tmux-navigator

vim_pattern='(\S+/)?g?\.?(view|l?n?vim?x?|fzf)(diff)?(-wrapped)?'

is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +${vim_pattern}$'"

bind-key -n 'C-Left'  if-shell "$is_vim" 'send-keys C-Left'  'select-pane -L'
bind-key -n 'C-Right' if-shell "$is_vim" 'send-keys C-Right'  'select-pane -R'
bind-key -n 'C-Down'  if-shell "$is_vim" 'send-keys C-Down'  'select-pane -D'
bind-key -n 'C-Up'    if-shell "$is_vim" 'send-keys C-UP'  'select-pane -U'

bind-key -T copy-mode-vi 'C-Left'  select-pane -L
bind-key -T copy-mode-vi 'C-Right' select-pane -R
bind-key -T copy-mode-vi 'C-Down'  select-pane -D
bind-key -T copy-mode-vi 'C-Up'    select-pane -U

# move {{{2

bind -n S-Down rotate-window -D
bind -n S-Up rotate-window -U
bind -n S-Left  swap-pane -D
bind -n S-Right swap-pane -U

# layout {{{2

bind -T custom l next-layout
# current pane to new window
bind -T custom T break-pane

# synchronize {{{2

bind -T custom M-$ set -w synchronize-panes

# resize {{{2

bind -T custom z resize-pane -Z

bind -T custom -r + resize-pane -U 2
bind -T custom -r - resize-pane -D 2
bind -T custom -r < resize-pane -L 2
bind -T custom -r > resize-pane -R 2

bind -T custom -r S-Up resize-pane -U 2
bind -T custom -r S-Down resize-pane -D 2
bind -T custom -r S-Left resize-pane -L 2
bind -T custom -r S-Right resize-pane -R 2

# Background command {{{1

bind -T custom '&' command-prompt -p 'Commande à lancer ? ' "run-shell -b '%%'"

# Resize mode {{{1

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

# Copy mode {{{1

bind -T custom p paste-buffer
bind -T custom '"' choose-buffer
bind -T custom 'M-"' list-buffers

bind -T copy-mode-vi 'v' send -X  begin-selection
bind -T copy-mode-vi 'C-v' send -X rectangle-toggle

bind -T copy-mode-vi 'y' send -X  copy-selection
bind -T copy-mode-vi 'p' send -X  paste-buffer

# Mouse {{{1

bind -T custom C-m set -g mouse on \; display "Mouse : on"
bind -T custom M-m set -g mouse off \; display "Mouse : off"
