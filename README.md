.config-all
===========

Store config data on github, and allow user to apply config files to their own
environment quickly and easily.

Usage
-----
* Clone this repo and subrepo(s)
* `make setup`
* `./dotdrop.sh compare --profile=default` to show differences between repo and
  installed config
* `./dotdrop.sh import ~/.foo` to import a new config file `~/.foo`
* `./dotdrop.sh install --profile=default` to install dotfiles. Your old ones
  will be backed up!

To-do
-----
* Accept input from user for name, email. Replace config file data with user input.
* Add lots more config files...
* Differentiate filenames for better autocompletion: `config_files`,
  `config.yml`, `dotdrop/`, `dotdrop.sh`

Probably won't do
-----------------
