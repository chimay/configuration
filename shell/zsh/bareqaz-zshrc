# ~/.zshrc file for zsh interactive shell
# Made by BareqAZ
# This zshrc requires the following plugins to be cloned in "~/.zsh/"
# ZSH syntax highlighting - ZSH auto-complete - ZSH auto-suggestions
#
# "https://github.com/zsh-users/zsh-syntax-highlighting.git"
# "https://github.com/marlonrichert/zsh-autocomplete.git"
# "https://github.com/zsh-users/zsh-autosuggestions"
#
# you can use "ctrl + p" to switch the terminal mode
# also I recommend checking the rest of the keybindings
############################################################################




# initial configuration
 setopt autocd               # change directory just by typing its name
 setopt correct              # auto correct mistakes
 setopt interactivecomments  # allow comments in interactive mode
 setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
 setopt nonomatch            # hide error message if there is no match for the pattern
 setopt notify               # report the status of background jobs immediately
 setopt numericglobsort      # sort filenames numerically when it makes sense
 setopt promptsubst          # enable command substitution in prompt
 export LC_ALL=en_US.UTF-8   #
 export LANG=en_US.UTF-8     #
 autoload -U edit-command-line           ###################
 zle -N edit-command-line                # Enables Vi mode #
 bindkey -M vicmd v edit-command-line    ###################
 WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word
 zle -N toggle_prompt
 PROMPT_TYPE=full

# configure key keybindings
 bindkey '^[[1;5C' forward-word          # ctrl + ->             # moves pointer forward a word
 bindkey '^[[1;5D' backward-word         # ctrl + <-             # moves pointer backward a word
 bindkey '^[[1;3D' beginning-of-line     # alt  + ->             # moves pointer to start of the line
 bindkey '^[[1;3C' end-of-line           # alt  + <-             # moves pointer to end of the line
 bindkey '^[[1;5B' backward-kill-word    # ctrl + arrow down	 # deletes a word backwards
 bindkey '^[[3~'   kill-whole-line       # delete                # deletes whole line
 bindkey '^[[1;5A' undo                  # ctrl + arrow up       # undo
 bindkey '^x'	     edit-command-line	    # ctrl + x              # edit line in Vi
 bindkey '^x^e'	   edit-command-line	    # ctrl + x + e          # same but more common keybind
 bindkey '^P'      toggle_prompt         # ctrl + p              # change prompt mode


#History configurations
#History is not configured, if you want to enable it just removed '#' from the commands below.
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first      # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups            # ignore duplicated commands history list
setopt hist_ignore_space           # ignore commands that start with space
setopt hist_verify                 # show command with history expansion to user before running it
setopt share_history               # share command history data
alias history=zsh_history          # force zsh to show the complete history


zsh_history() {
    ARG=$1
    [ -z $ARG ] && less ~/.zsh_history || grep $1 ~/.zsh_history | sort | uniq -u | less
    }


# prompt styling
select_prompt() {
    case "$PROMPT_TYPE" in
        full)
            PROMPT=$'%F{red}┌──[%f%B%n%b%F{red}@%f%B%M%b%F{red}]-[%f%B%~%b%F{red}]%f\n%F{red}└─%f%b%B>%b ' 
            RPROMPT=$'%F{red}[%f%t%F{red} ]%f '
            ;;
        minimal)
            PROMPT=$'%F{red}[%f%B%~%b%F{red}]$%f '
            RPROMPT=
            ;;
    esac
   
}

toggle_prompt(){
    if [ "$PROMPT_TYPE" = full ]; then
        PROMPT_TYPE=minimal
    else
        PROMPT_TYPE=full
    fi
    select_prompt
    zle reset-prompt
}

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi




# addons
 [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]           && . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh && ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
 [ -f ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]          && . ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
 [ -f ~/.zsh/zsh_command_not_found ]                                 && . ~/.zsh/zsh_command_not_found


# enable syntax-highlighting
    if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=underline
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi

select_prompt
