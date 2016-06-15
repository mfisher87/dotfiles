#!/usr/bin/env bash

if [ "$(uname -s)" = "Darwin" ]; then
	source ~/.bash_osx
fi

for file in ~/.path ~/.bash_{prompt,exports,aliases,funcs,extra}; do
	if [ -r "$file" ] && [ -f "$file" ]; then
		source "$file"
	fi
done
unset file

if [ -f $HOME/.bash_profile.local ]; then
	source $HOME/.bash_profile.local
fi

# Shell vi mode
set -o vi

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
