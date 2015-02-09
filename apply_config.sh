#!/bin/bash
bkp_dir="$HOME/.cfg-bkp"

# Loop over config files in the repo
for file in $( ls -a "$PWD/config_files" )
do
	source="$PWD/config_files/$file"
	filename=$( basename "$source" )
	target="$HOME/$filename"

	# Ignore current and parent directory
	if [ "$filename" != "." -a "$filename" != ".." ]
	then
		# If symlink already exists, we "continue" the loop, or recreate it.
		# Re-creating is safer.
		if [ -h "$target" ]
		then
			echo "Removed pre-existing symbolic link at $target"
			rm "$target"
		# If there's a pre-existing normal config file, back it up safely.
		elif [ -e "$target" ]
		then
			if [ ! -d "$bkp_dir" ]
			then
				mkdir "$bkp_dir"
			fi
			echo "$target already exists as a normal file. Copied to $bkp_dir"
			mv "$target" "$bkp_dir"
		fi

		# Finally create symbolic link
		ln -s "$source" "$HOME"
	fi
done
