#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Configuration
if [[ $TERM == "xterm" ]]; then
	export TERM="xterm-256color"
fi
PS1='[\u@\h \W]\$ '
set -o vi
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'
export LC_ALL="C"

# Aliases
alias ls='ls --group-directories-first -h --color=auto'
alias tmux='TERM=screen-256color-bce tmux'

# Variables
export web_dir='/srv/http'

# Functions
mv_dot() {
	mv "${1}" ".${1}"
}

mv_bkp() {
	mv "${1}" "${1}.bkp"
}

