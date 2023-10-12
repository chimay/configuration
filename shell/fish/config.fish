# vim: set filetype=sh:

status is-login ; and source ~/racine/config/cmdline/fish/login.fish
source ~/racine/config/cmdline/fish/environment.fish
source ~/racine/config/cmdline/fish/universal.fish
source ~/racine/config/cmdline/fish/abbr.fish
source ~/racine/config/cmdline/fish/alias.fish
source ~/racine/config/cmdline/fish/binding.fish
source ~/racine/config/cmdline/fish/colour.fish

# Add ons {{{1

# zoxide {{{2

zoxide init fish | source
