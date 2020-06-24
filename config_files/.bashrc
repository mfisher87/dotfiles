# ~/.bashrc: for non-login shells.
# In this case, we're using it for both, so all configuration should go here.
# The need for login/non-login shells seems to me to be not very useful in
# modern times.


# If not running interactively, don't do anything:
# case $- in
#     *i*) ;;
#       *) return;;
# esac

# Source files for specific settings: PATH, prompt, exports, aliases,
# functions, miscellaneous, and additional local .bashrc config
for file in ~/.bash_{path,prompt,exports,aliases,funcs,extra}; do
	if [ -r "$file" ] && [ -f "$file" ]; then
		source "$file"
	fi
done
unset file

if [ -f $HOME/.bashrc.local ]; then
	source "$HOME/.bashrc.local"
fi


##################
# Custom options #
##################

# Allow vi command mode in regular shell by pressing ESC
set -o vi

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


########################################
# Programmatically-added configuration #
########################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mfisher/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mfisher/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mfisher/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mfisher/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
