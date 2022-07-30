#!/bin/sh

#args=("$@")
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

res=$(printf "%s" "$*" | $SCRIPTPATH/chompit.py)

find . -name "*.$res"

