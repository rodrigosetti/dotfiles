#! /bin/sh

if [ ! -f dot_vimrc ]; then
    # Remote installation

    echo "\033[0;34mCloning dotfiles...\033[0m"
    hash git >/dev/null && /usr/bin/env git clone https://github.com/rodrigosetti/dotfiles.git $HOME/.dotfiles || {
        echo "git not installed"
        exit
    }
    cd $HOME/.dotfiles
fi

# For every dot_* file in installation
for REP_FILE in `ls -d dot_*`; do
    DOT_FILE=`echo "$REP_FILE" | sed 's/^dot_/./'`

    # If file in home directory is a link, then we remove it
    if [ -L "$HOME/$DOT_FILE" ]; then
        rm -v "$HOME/$DOT_FILE"
    fi

    # If file in home does not exists as file or directory, create the link
    if [ ! -f "$HOME/$DOT_FILE" -a ! -d "$HOME/$DOT_FILE" ]; then
        ln -vs "`pwd`/$REP_FILE" "$HOME/$DOT_FILE"
    else
        echo "File exists and is not a link, not writing: $HOME/$DOT_FILE" > /dev/stderr
    fi
done

# Creates .config directory in home, if not exists
[ ! -d "$HOME/.config" ] && mkdir -v "$HOME/.config"

# For every file in installation config directory
for FILE_NAME in `ls config`; do
    HOME_FILEPATH="$HOME/.config/$FILE_NAME"

    # If file in home directory is a link, then we remove it
    if [ -L "$HOME_FILEPATH" ]; then
        rm -v "$HOME_FILEPATH"
    fi

    # If file in home does not exists as file or directory, create the link
    if [ ! -f "$HOME_FILEPATH" -a ! -d "$HOME_FILEPATH" ]; then
        ln -vs "`pwd`/config/$FILE_NAME" "$HOME_FILEPATH"
    else
        echo "File exists and is not a link, not writing: $HOME_FILEPATH" > /dev/stderr
    fi
done

######  Installs Neobundle

git clone "git@github.com:Shougo/neobundle.vim.git" "$HOME/.vim/bundle/neobundle.vim"

###### Installs oh-my-zsh

if [ ! -d $HOME/.oh-my-zsh ]; then
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

