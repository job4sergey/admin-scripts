#!/bin/sh

# args=("$@")
file=$*
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
# printf "%s\n" "$file"

dname=`dirname "$file"`
bname=`basename "$file"`
absolute="$(cd $dname; pwd)/$bname"
# printf "%s\n" "$absolute"
res=$(printf "%s" "$absolute" | $SCRIPTPATH/chompit.py)

printf "%s" "$res" | $SCRIPTPATH/clipit.py