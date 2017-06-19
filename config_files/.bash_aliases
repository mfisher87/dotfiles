#!/usr/bin/env bash

# Detect which `ls` binary is in use and set flags
if ls --color > /dev/null 2>&1; then
	colorflag="--color" # It's GNU ls
else
	colorflag="-G" # It's OSX ls
fi


# Customized commands
alias ls="ls --group-directories-first -hF ${colorflag}"
alias tmux='TERM=screen-256color-bce tmux'
alias grep='grep --color=auto'
alias sshp='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
