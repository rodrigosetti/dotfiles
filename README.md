# dotfiles

This is a project to help me organize my dotfiles across several workstations
and host I have access.

Being a public repo, of course, I leave out sensitive stuff like `.ssh` keys

The best way to use it in your home dir is to symlink every dotfile from
a cloned directory (i.e. not making your home a repo itself):

    $ git clone git@github.com:rodrigosetti/dotfiles.git dotfiles
    $ ln -s dotfiles/.vim
    $ ln -s dotfiles/.vimrc
    $ ln -s dotfiles/.bashrc
    $ ln -s dotfiles/...

Please feel free to use it if you like, and of course, to push request if
there's any dot file you use and it's not there.

