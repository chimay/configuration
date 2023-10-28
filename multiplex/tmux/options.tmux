# vim: set filetype=tmux.conf :

# Terminal {{{1

set -g default-terminal "tmux-256color"

# Extra xterm key sequences to indicate modifiers

set -g xterm-keys on

# Escape, Alt, Meta
# Remarque : il vaut mieux utiliser C-c au lieu de Esc dans vim

set -s escape-time 30

# True colors

set -ga terminal-overrides ",xterm-256color:Tc"

# Resize

set-window -g aggressive-resize on

# Events

set -g focus-events on

# Titre {{{1

set -g set-titles on
set -g set-titles-string 'tmux:#{pane_title}'
#set -g set-titles-string 'tmux:#{pane_id}'

# Variables d’environnement {{{1

# Pour les variables, d’environnement,
# il est important que ce soit $HOME
# et pas ~

set-environment -g HOME $HOME

set-environment -g PATH "$HOME/.local/bin:$HOME/.gem/ruby/2.3.0/bin:$HOME/.gem/ruby/2.4.0/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/racine/self:$HOME/racine/automat:$HOME/racine/pack/bin:$HOME/racine/shell/alarm:$HOME/racine/shell/disk:$HOME/racine/shell/mail:$HOME/racine/shell/media:$HOME/racine/shell/network:$HOME/racine/shell/power:$HOME/racine/shell/run:$HOME/racine/shell/start:$HOME/racine/shell/version:$HOME/racine/shell/visu:$HOME/racine/bin/binar:$HOME/racine/bin/go:$HOME/racine/bin/make:$HOME/racine/bin/python:$HOME/racine/bin/utils:$HOME/racine/install/bootstrap:$HOME/racine/install/build:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:$HOME/racine/plugin/manager/plugged/fzf/bin"


# Shell {{{1

set -g default-shell "zsh"

# Commande par défaut {{{1

# Commande par défaut pour :
#
# 	* les nouvelles sessions
# 	* les nouvelles fenêtres
# 	* les nouveaux panels

set -g default-command "zsh -l"


# Ligne de commande {{{1

set -w -g status-keys emacs


# Messages {{{1

set -g message-limit 84


# Barre de statut {{{1

set status-position bottom
#set status-position top

set -g display-time 1234

set -g status on

set -g status-interval 15

set -g status-justify centre

set -g status-left-length 45
set -g status-right-length 40


# Historique {{{1

set -g history-limit 347120

# Ligne de commande

set -g history-file ~/racine/hist/tmux/cmdline-$HOST

# Monitoring {{{1

set -g bell-action any

#set -g visual-content on

set -g activity-action off

set -g visual-activity on
set -g visual-bell on
set -g visual-silence on


# Verrouillage {{{1

set -g lock-command "vlock"

# Désactiver, vlock a un bug

set -g lock-after-time 108000000


# Sessions {{{1

set -s exit-unattached off

set -g destroy-unattached off
set -g detach-on-destroy on


# Monitoring {{{1

set -g window-status-bell-style 'blink'
set -ag window-status-bell-style 'fg=#b21818'
set -ag window-status-bell-style bg=black

set -g window-status-activity-style 'blink'
set -ag window-status-activity-style 'fg=#b21818'
set -ag window-status-activity-style bg=black


# Fenêtres {{{1

set -g base-index 1

set -g automatic-rename off

set -w -g allow-rename off

# Si on, restore l’écran d’avant le lancement d’une TUI
# Si off, la fenêtre du TUI s’insère dans le flux du terminal

set -g alternate-screen off


# Panels {{{1

set -g pane-base-index 1

set -g display-panes-time 84712


# Mode copie {{{1

set -g assume-paste-time 1

set -s buffer-limit 30

# Vi keys en mode copie

set -w -g mode-keys vi


# Souris {{{1

set -g mouse on


# Horloge {{{1

set -g clock-mode-style 24

