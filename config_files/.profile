# ~/.profile: For login shells.
# The concept of a "login profile" is not really useful anymore in my view. If
# there are any actions you want performed _only_ on login, add them to the end
# of this script. For example, if you want to see CPU load only when you login,
# not for subshells, add it here.
#
# This file is NOT read first by bash; if ~/.bash_profile or ~/.bash_login also
# exist, they will be prioritized. For this to work, please ensure neither of
# those files exist. For more information:
#
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash and .bashrc exists, include .bashrc
# .bashrc should contain code for setting PATH, aliases, functions, etc.
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Disable webcam auto-exposure that blows out images
# if type v4l2-ctl >/dev/null 2>&1; then
#     v4l2-ctl -c exposure_auto_priority=0
# else
#     echo "v4l2-ctl webcam configuration tool not installed."
# fi
