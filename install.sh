#! /bin/sh

for REP_FILE in `ls -d dot_*`; do
    DOT_FILE=`echo "$REP_FILE" | sed 's/^dot_/./'`

    if [ -L "$HOME/$DOT_FILE" ]; then
        echo "Removing previous link $HOME/$DOT_FILE"
        rm "$HOME/$DOT_FILE"
    fi

    if [ ! -f "$HOME/$DOT_FILE" ]; then
        ln -s "`pwd`/$REP_FILE" "$HOME/$DOT_FILE"
    else
        echo "File exists and is not a link, not writing: $HOME/$DOT_FILE" > /dev/stderr
    fi
done

