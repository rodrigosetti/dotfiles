#! /bin/sh

for REP_FILE in `ls -d dot_*`; do
    DOT_FILE=`echo "$REP_FILE" | sed 's/^dot_/./'`

    if [ -L "$HOME/$DOT_FILE" ]; then
        rm -v "$HOME/$DOT_FILE"
    fi

    if [ ! -f "$HOME/$DOT_FILE" -a ! -d "$HOME/$DOT_FILE" ]; then
        ln -vs "`pwd`/$REP_FILE" "$HOME/$DOT_FILE"
    else
        echo "File exists and is not a link, not writing: $HOME/$DOT_FILE" > /dev/stderr
    fi
done

# Creates .config directory in home, if not exists
[ ! -d "$HOME/.config" ] && mkdir -v .config

for REP_DIR in `ls config`; do
    CONFIG_DIR=".config/$REP_DIR"

    if [ -L "$HOME/$CONFIG_DIR" ]; then
        rm -v "$HOME/$CONFIG_DIR"
    fi

    if [ ! -f "$HOME/$CONFIG_DIR" -a ! -d "$HOME/$CONFIG_DIR" ]; then
        ln -vs "`pwd`/config/$REP_DIR" "$HOME/$CONFIG_DIR"
    else
        echo "File exists and is not a link, not writing: $HOME/$CONFIG_DIR" > /dev/stderr
    fi
done

