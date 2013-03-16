# Dotstrap

This repository contains my custom dotfiles and a install script to symlink them from the home directory. It is based on Michael Smalley's article [Using Git and GitHub to Manage Your Dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/) and the [corresponding script](https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh).

This repo should be cloned to your home directory so that the path is ~/dotstrap/. The included setup script creates symlinks from your home directory to the files which are located in ~/dotstrap/. It also is smart enough to back up your existing dotfiles into a ~/dotfiles_old/ directory if you already have any dotfiles of the same name as the dotfile symlinks being created in your home directory.

To summarize, the install script will:

* Back up any existing dotfiles in your home directory to ~/dotfiles_old/
* Create symlinks to the dotfiles in ~/dotstrap/ in your home directory

## Future Development

* Currently the install script has a list of dotfiles to be used (backed up and symlinked); this list must be manually updated every time a dotfile is added to or removed from the repo. I would prefer to instead have a list of *excluded* files (.*, makesymlinks.sh, README.md, and LICENSE) and automatically use all files in the repo that aren't excluded.
* If the install script is run twice on the same account, it will overwrite the backups in ~/dotfiles_old/ with symlinks. The backup routine should ignore symlinks instead.
* If there is nothing to back up (all prospective back-up targets are either symlinks or nonexistent), ~/dotfiles_old/ should not be created.
* Tangentially, I should figure out a way to make .screenrc specify different escape keys depending on whether the system is "first tier" or "second tier" in my screen layout, probably indicated by the presence or absence of ~/.screen_tier_2. See [this](http://unix.stackexchange.com/questions/21523/how-can-i-automatically-run-a-script-inside-screen-if-the-script-is-not-in-path), possibly.

### Some pseudocode

For each file FOO in the repo (and not dotted or on the exclusion list):
* Look for an "oldfile"  ~/.FOO. If "oldfile" exists and is not a symlink, create ~/dotfiles_old/ and move ~/.FOO there (possibly stripping the leading dot?).
* Make ~/.FOO a symlink to FOO.
