# ~/.bash_aliases

# Detect which `ls` binary is in use and set flags
if ls --color > /dev/null 2>&1; then
	colorflag="--color"  # It's GNU ls
else
	colorflag="-G"  # It's OSX ls
fi

alias ls="ls --group-directories-first -vhF ${colorflag}"  # Display dirs first, -v: Version sorting (dotfiles first)
alias ll='ls -alF'  # -a: Don't ignore '.'files, -l: Long listing, -F: add classification indicator
alias la='ls -A'  # -A: like -a but ignores implied '..' and '.'
alias l='ls -CF'  # -C: list by columns

alias tmux='TERM=screen-256color-bce tmux'

alias grep='grep --color=auto'
alias codegrep='grep -R --exclude-dir=".git" --exclude="*.log"'  # grep for code, not logs or metadata

alias sshp='ssh -o PreferredAuthentications=password,keyboard-interactive -o PubkeyAuthentication=no'
alias fixsshagent='eval $(tmux showenv -s SSH_AUTH_SOCK)'  # What was this for?

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
