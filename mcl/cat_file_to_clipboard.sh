#!/bin/sh

args=("$@")
file="${args[0]}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

absolute="$(cd $(dirname $file); pwd)/$(basename $file)"

cat "$absolute" | $SCRIPTPATH/clipit.py
