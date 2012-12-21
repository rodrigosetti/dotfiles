#! /bin/sh

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

###### Special installation for .vim directory ######

# Creates .vim directory in home, if not exists
[ ! -d "$HOME/.vim" ] && mkdir -v "$HOME/.vim"

# Create backup and temporary directories in .vim (to be local)
[ ! -d "$HOME/.vim/backup" ] && mkdir -v "$HOME/.vim/backup"
[ ! -d "$HOME/.vim/tmp" ] && mkdir -v "$HOME/.vim/tmp"

# For every file in installation vim directory
for FILE_NAME in `ls vim`; do
    HOME_FILEPATH="$HOME/.vim/$FILE_NAME"

    # If file in home directory is a link, then we remove it
    if [ -L "$HOME_FILEPATH" ]; then
        rm -v "$HOME_FILEPATH"
    fi

    # If file in home does not exists as file or directory, create the link
    if [ ! -f "$HOME_FILEPATH" -a ! -d "$HOME_FILEPATH" ]; then
        ln -vs "`pwd`/vim/$FILE_NAME" "$HOME_FILEPATH"
    else
        echo "File exists and is not a link, not writing: $HOME_FILEPATH" > /dev/stderr
    fi
done

