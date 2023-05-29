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

# Manage dotfiles with Git (see: https://github.com/mfisher87/dotfiles)
alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"

alias sshp='ssh -o PreferredAuthentications=password,keyboard-interactive -o PubkeyAuthentication=no'
alias fixsshagent='eval $(tmux showenv -s SSH_AUTH_SOCK)'  # What was this for?

alias nginxcontainer='docker run --rm -p 80:80 -v ${PWD}:/var/lib/nginx/html:ro dceoy/nginx-autoindex'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Play a tone based on $1, e.g. `note E3`
alias note='play -qn synth 2 sine'

# Parse puppetry in ./puppet
alias puppetparse='docker run --volume $PWD/puppet/:/etc/puppetlabs/code/ --entrypoint=puppet puppet/puppetserver:6.14.1 parser validate /etc/puppetlabs/code/site.pp'

# ¯\_(ツ)_/¯
alias shrug='echo "¯\_(ツ)_/¯"'

# Rsync with vagrant identity
alias vrsync='rsync -e "ssh -i $HOME/.ssh/id_rsa_vagrant_vsphere"'
