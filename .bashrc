#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval `dircolors ~/.dir_colors`

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias t='tmux attach || tmux new'
alias c='cd ..'
alias ll='ls -l'
alias la='ls -al'

export TERM=xterm-256color

source ~/.prompt
export VIRTUAL_ENV_DISABLE_PROMPT=True

PROMPT_COMMAND='history -a;'

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Bash history settings
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignorespace
export HISTIGNORE='ls:history:ll'
export HISTTIMEFORMAT='%F %T '

# Append to bash_history instead of overwriting
shopt -s histappend

source .project
source .virtualenvwrapper_light

[[ -f ~/.localrc ]] && source ~/.localrc

