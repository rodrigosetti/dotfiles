# Dotfiles

This is a project to help me organize my dotfiles across several workstations
and host I have access.

## Installation

There's two methods for installation.

### Curl based

```console
$ curl -L https://raw.githubusercontent.com/rodrigosetti/dotfiles/master/install.sh | sh
```

### Clone and Install

```console
$ git clone git@github.com:rodrigosetti/dotfiles.git
$ cd dotfiles && ./install.sh
```

The install script will symlink every file `dot_file` in the repo to a `.file`
in your home directory. It will not erase regular files, only previous
symlinks.

Please feel free to use it if you like, and of course, to push request if
there's any dot file you use and it's not there.
