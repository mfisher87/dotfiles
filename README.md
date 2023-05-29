# Matt Fisher's home directory configuration

This is my home directory configuration. It may not be great, or even good, but
it's what I'm used to.

This configuration is deployed with `git` using the "bare repo" approach. This
means that this Git repository (i.e. the `.git/` dir) is located in an
arbitrary location, while its worktree (the config files) is checked out to
`$HOME`. In this way, we get the usual benefits of using Git to manage the
files, plus Git acts as our "installer", removing the need for other
dependencies or scripts.


## Conventions

* Scripts go in `.local/bin`.
* Don't check in Vim plugins. Install a Vim plugin manager (e.g. `VimPlug`)
  separately and use it to install the plugins listed in the config.


## Usage

*NOTE: This is my config, so my name and e-mail address can be found within. If
you borrow from this, please be sure to replace my personal details with yours.*


### Installing this repository

First, clone the config repo if you haven't already:

```
git clone --bare https://github.com/<username>/dotfiles.git ${HOME}/.dotfiles
```

Next, ensure you have an alias set up for this repo:

```
alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"
```

Now, you can use the `dotfiles` command to manage your dotfiles with the Git
interface.

Finally, tell Git not to show untracked files for this repository.

```
dotfiles config --local status.showUntrackedFiles no
```


### Deploying config

To deploy this config and blow away any existing configuaration:

```
dotfiles switch -f main
```

If you want to carefully evaluate changes, you may prefer to:

```bash
dotfiles restore --staged ~
```

...and use `dotfiles status` and `dotfiles diff` to decide how to apply config.


### Upgrading config

*NOTE: If upgrading from my old repository using "dotdrop", follow the "keep
existing config" install instructions.*

```
dotfiles fetch origin main:main
```


### Changing config

Remember that `dotfiles` has the same interface as `git`.

First, consider if you should create a branch (`dotfiles switch -c <branchname>`).

* Edit a config file
* `dotfiles add --force <dotfile>` (`--force` must be used because all
  untracked files are ignored by `*` rule in `.gitignore`)
* `dotfiles commit`

Push your commits (`dotfiles push ...`).


## TLDR; bootstrap me

On a new machine, or in another situation where you don't care about clobbering config:

```bash
git clone --bare https://github.com/<username>/dotfiles.git ${HOME}/.dotfiles
git --git-dir=${HOME}/.dotfiles --work-tree=${HOME} config --local status.showUntrackedFiles no
git --git-dir=${HOME}/.dotfiles --work-tree=${HOME} switch -f main
```

Log out and log back in, or manually source your config files to activate the
`dotfiles` alias.


## Pitfalls

* ...


## References

This is not my idea. I'm not sure whose it was.

* [Storing dotfiles with Git](https://web.archive.org/web/20221130142525/https://engineeringwith.kalkayan.io/series/developer-experience/storing-dotfiles-with-git-this-is-the-way/)
* [fperez/dotfiles](https://github.com/fperez/dotfiles/blob/main/.README.md)
* [Atlassian tutorial](https://www.atlassian.com/git/tutorials/dotfiles)


## Future considerations

* If I ever have to work with MacOS regularly, I may want some templating features.
    * GNU Stow?
    * Chezmoi?
