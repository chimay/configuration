# vim: set filetype=tmux.conf :

# documentation {{{1

# ---- copycat
# prefix / : regex search
# prefix + ctrl-f - simple file search
# prefix + ctrl-g - jumping over git status files (best used after git status command)
# prefix + alt-h - jumping over SHA-1/SHA-256 hashes (best used after git log command)
# prefix + ctrl-u - url search (http, ftp and git urls)
# prefix + ctrl-d - number search (mnemonic d, as digit)
# prefix + alt-i - ip address search

# ---- fzf url
# prefix u : choose url to open

# ---- logging
# prefix shift-p : start/stop logging pane
# prefix alt-p : save visible text in pane
# prefix alt-shift-p : save all pane history

# ---- modal
# alt-m to toggle it

# ---- urlview
# prefix u : launch urlview on pane content

# ---- yank
# -- normal & copy mode
# prefix y : copy
# -- copy mode
# prefix Y : copy & paste

# plugin list {{{1

set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-logging'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'laktak/extrakto'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'whame/tmux-modal'

# set -g @plugin 'tmux-plugins/tmux-resurrect'
# set -g @plugin 'tmux-plugins/tmux-continuum'

# configuration {{{1

set -g @prefix_highlight_output_prefix '['
set -g @prefix_highlight_output_suffix ']'
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_fg '1'
set -g @prefix_highlight_bg 'default'
set -g @prefix_highlight_copy_mode_attr 'none,fg=1,bg=default'

#set -g @extrakto_split_size "15"
#set -g @extrakto_clip_tool "xsel --input --clipboard" # works better for nvim
#set -g @extrakto_copy_key "tab"      # use tab to copy to clipboard
#set -g @extrakto_insert_key "enter"  # use enter to insert selection
#set -g @extrakto_fzf_unset_default_opts "false"  # keep our custom FZF_DEFAULT_OPTS
#set -g @extrakto_fzf_header "i c f g" # for small screens shorten the fzf header

set -g @fzf-url-bind 'u'
set -g @fzf-url-history-limit '900'
set -g @fzf-url-fzf-options '--layout=reverse'
#set -g @fzf-url-open "tmux split w3m"
set -g @fzf-url-open "qutebrowser"

set -g @logging-path "~/log"

set -g @modal-yesno-cmd on

# clipboard, primary ou secondary
set -g @yank_selection 'clipboard'

#set -g @resurrect-capture-pane-contents 'on'
#set -g @resurrect-processes 'ncmpcpp cmus elinks alarm-sensor.zsh'
# set -g @resurrect-save 'C-S'
# set -g @resurrect-restore 'C-R'

# set -g @continuum-boot 'on'
# set -g @continuum-systemd-start-cmd 'new-session -d'
# set -g @continuum-save-interval '300'
#set -g @continuum-restore 'on'

# automatic install {{{1

# if "test ! -d ~/.tmux/plugins/tpm" \
#    "run-shell 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

# initialization {{{1

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)

run-shell '~/racine/plugin/manager/tmux/plugins/tpm/tpm'
