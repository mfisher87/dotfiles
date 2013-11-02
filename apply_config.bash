#!/bin/bash
# issue a warning
echo "This script will copy the config files in this repo to your home
directory. The following files will be overwritten:"


# dump array of config files

# get inputs for personal info for some config files... the rest is preset.
#echo "input name:"
#echo "input email:"

# iterate through the config files and copy them
# build array of config files
cat files_to_copy.txt | while read source
do
	source="./config_files/$source"
	printf "Copying $source to $HOME"
	cp -r $source ~/. && printf "...OK"
	printf "\n"
done
