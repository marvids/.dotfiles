#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LC_NUMERIC="en_US.UTF-8"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias t='tmux attach || tmux new'
alias c='cd ..'
alias ll='ls -l'
alias la='ls -al'
alias ssh='TERM=xterm ssh'

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

export WORKON_HOME=~/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=True
export PROMPT_COMMAND='history -a;'
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.local/bin

# Bash history settings
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignorespace
export HISTIGNORE='ls:history:ll'
export HISTTIMEFORMAT='%F %T '

export BAT_THEME="Solarized (dark)"

export SHELLCHECK_OPTS="-e SC2039"

# Append to bash_history instead of overwriting
shopt -s histappend

# Substitute a string in all checked-in files
git-substr() {
    git grep -Il "$1" | xargs sed -bi "s/$1/$2/g"
}

for file in ~/.bash.d/*; do
    if [[ -f $file ]] && [[ $(basename "$file") =~ ^[0-9]{2}-.* ]] ; then
        source "$file"
    fi
done

PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source "$HOME/.cargo/env"
