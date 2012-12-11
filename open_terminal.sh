#!/bin/bash

USAGE="Usage: -p Project path"

while getopts  p: options; do
    case $options in
        p ) PROJECT="$OPTARG";;
    esac
done

if [ $# -eq 0 ]; then
    echo $USAGE
    exit
fi


PROJECT_NAME=`basename $PROJECT`

GLOBAL_OPTIONS="--maximize --hide-menubar --disable-factory"

TAB1="bash -c 'cd $PROJECT && tconsole all '"
TITLE1="TCONSOLE | [$PROJECT_NAME]"

TAB2="sh -c 'cd $PROJECT; rails c; exec bash'"
TITLE2="CONSOLE | [$PROJECT_NAME]"

TAB3="sh -c 'cd $PROJECT; rails s; exec bash'"
TITLE3="SERVER | [$PROJECT_NAME]"

gnome-terminal $GLOBAL OPTIONS --tab -e "$TAB1" --title "$TITLE1" --tab -e "$TAB2" --title "$TITLE2" --tab -e "$TAB3" --title "$TITLE3" 
