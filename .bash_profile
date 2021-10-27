#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.local_profile ]] && . ~/.local_profile

source "$HOME/.cargo/env"
