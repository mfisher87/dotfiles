#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Configuration
PS1='[\u@\h \W]\$ '
set -o vi
export PATH=$PATH:/home/mfisher/.gem/ruby/2.1.0/bin
export LC_ALL="C"

# Aliases
alias ls='ls --group-directories-first -h --color=auto'

# Variables
export web_dir='/srv/http'

# Functions
mv_dot() {
	mv "${1}" ".${1}"
}

mv_bkp() {
	mv "${1}" "${1}.bkp"
}

