# Dotfiles

This is a project to help me organize my dotfiles across several
workstations and host I have access.

Being a public repo, of course, I leave out sensitive stuff like`.ssh`
keys

## Usage

There is a install script file for convenience:

    $ git clone git@github.com:rodrigosetti/dotfiles.git dotfiles
    $ cd dotfile && sh install.sh

The install script will symlink every file `dot_file` in the repo to a
`.file` in your home directory. It will not erase regular files, only
previous symlinks.

Please feel free to use it if you like, and of course, to push request if
there's any dot file you use and it's not there.

