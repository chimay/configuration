# vim: set filetype=tmux.conf :

# terminal {{{1

set -g default-terminal "tmux-256color"

# Extra xterm key sequences to indicate modifiers

set -g xterm-keys on

# Escape, Alt, Meta
# Remarque : il vaut mieux utiliser C-c au lieu de Esc dans vim

set -s escape-time 30

# True colors

#set -ga terminal-overrides ",tmux-256color:Tc"
set -ga terminal-overrides ",xterm-256color:Tc"
#set -ga terminal-overrides ",kitty-256color:Tc"

#set -sa terminal-features ',xterm-kitty:RGB'

# Resize

set-window -g aggressive-resize on

# Events

set -g focus-events on

# title {{{1

set -g set-titles on
set -g set-titles-string '#{pane_title}'

# environment variables {{{1

# Pour les variables, d’environnement,
# il est important que ce soit $HOME
# et pas ~

set-environment -g HOME $HOME

set-environment -g PATH "$HOME/perl5/bin:$HOME/.pip/bin:$HOME/racine/self/bin/build:$HOME/racine/self/bin/filesys:$HOME/racine/self/bin/install:$HOME/racine/self/bin/system:$HOME/racine/self/bin/version:$HOME/racine/automat:$HOME/racine/pack/bin:$HOME/racine/shell/alarm:$HOME/racine/shell/backup:$HOME/racine/shell/convert:$HOME/racine/shell/crypte:$HOME/racine/shell/dialog:$HOME/racine/shell/directory:$HOME/racine/shell/disk:$HOME/racine/shell/fileman:$HOME/racine/shell/generic:$HOME/racine/shell/math:$HOME/racine/shell/multimedia:$HOME/racine/shell/network:$HOME/racine/shell/pack:$HOME/racine/shell/process:$HOME/racine/shell/run:$HOME/racine/shell/search:$HOME/racine/shell/source:$HOME/racine/shell/sync:$HOME/racine/shell/version:$HOME/racine/shell/visu:$HOME/racine/shell/windenv:$HOME/racine/shell/directory/fzf-nova:$HOME/racine/shell/directory/fzf-speed:$HOME/racine/prolang/interpreted/perl:$HOME/racine/prolang/interpreted/python/bin:$HOME/racine/prolang/interpreted/pip/bin:$HOME/racine/prolang/interpreted/ruby/bin:$HOME/racine/prolang/interpreted/gem/ruby/3.0.0/bin:$HOME/racine/prolang/compiled/clang:$HOME/racine/prolang/compiled/rust:$HOME/racine/prolang/compiled/go/bin:$HOME/racine/prolang/compiled/misc:$HOME/racine/bin/fzf-nova:$HOME/racine/local/bin:$HOME/racine/matemat/octave:$HOME/racine/config/webrowser/w3m/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/snap/bin:/var/lib/flatpak/exports/bin"

# shell {{{1

# only used when default-command is empty
set -g default-shell "/bin/sh"

# default commands {{{1

# Commande par défaut pour :
#
# 	* les nouvelles sessions
# 	* les nouvelles fenêtres
# 	* les nouveaux panels

set -g default-command "zsh -l"

# commandlines {{{1

set -w -g status-keys emacs

# messages {{{1

set -g message-limit 84

# status bar {{{1

set -g status-position bottom

set -g display-time 1234

set -g status on

set -g status-interval 15

set -g status-justify centre

set -g status-left-length 45
set -g status-right-length 40

# history {{{1

set -g history-limit 123470

# Ligne de commande

set -g history-file ~/racine/hist/tmux/cmdline-$HOST

# monitoring {{{1

set -g monitor-bell on
set -g bell-action any
set -g visual-bell off

set -g monitor-activity off
set -g activity-action any
set -g visual-activity off

set -g monitor-silence 0
set -g silence-action any
set -g visual-silence off

set -g window-status-bell-style 'fg=#b21818'
set -ag window-status-bell-style bg=black
set -ag window-status-bell-style 'blink'

set -g window-status-activity-style 'fg=#b21818'
set -ag window-status-activity-style bg=black
set -ag window-status-activity-style 'blink'

# lock {{{1

set -g lock-command "vlock"

# Désactiver, vlock a un bug

set -g lock-after-time 108000000

# sessions {{{1

set -s exit-unattached off

set -g destroy-unattached off
set -g detach-on-destroy on

# windows (~ tabs) {{{1

set -g base-index 1

set -g automatic-rename off

set -w -g allow-rename off

# Si on, restore l’écran d’avant le lancement d’une TUI
# Si off, la fenêtre du TUI s’insère dans le flux du terminal

set -g alternate-screen off

# panels (~ windows) {{{1

set -g pane-base-index 1

set -g display-panes-time 84712

# copy mode {{{1

set -g assume-paste-time 1

set -s buffer-limit 30

# Vi keys en mode copie

set -w -g mode-keys vi

# mouse {{{1

set -g mouse on

# clock {{{1

set -g clock-mode-style 24
