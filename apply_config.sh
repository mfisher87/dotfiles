#!/usr/bin/env bash
bkp_dir="$HOME/.cfg-bkp"
if [ -n "$1" ]; then
	destination="$1"
else
	destination="$HOME"
fi

echo "Syncing config files to $destination"

cd "$(dirname "${BASH_SOURCE}")/config_files"

git pull origin master

function sync() {
	rsync -avh --no-perms --backup-dir=$bkp_dir . "$destination";
	source ~/.bash_profile
}

if [ "$1" == "-f" ]; then
	sync
else
	read -p 'This will overwrite conflicting files in your home directory. Continue? (y/n)' -n 1
	echo ''
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync
	fi
fi
unset sync

cd ..
