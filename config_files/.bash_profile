#
# ~/.bash_profile
###########################
# DO NOT EDIT THIS SECTION

[[ -f ~/.bashrc ]] && . ~/.bashrc

# DO NOT EDIT THIS SECTION
###########################

if [ -f .bash_profile.local ]; then
	source .bash_profile.local
fi
