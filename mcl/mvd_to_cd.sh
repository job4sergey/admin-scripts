#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

curd=`pwd`

cd ~/Downloads

path=`ls -Art | tail -n 1`
res=$(printf "%s" "$path" | $SCRIPTPATH/chompit.py)
printf "%s" "$res" |  $SCRIPTPATH/clipit.py

if [ -d "$path" ];
then
	echo "Latest modified is directory: $path, exiting"
	exit 0
else
	echo "Latest downloaded: $path"
fi

if [ "$#" -eq 1 ]; then  
  mv "$path" "$curd"
  echo "Moved."
  cd $curd
  curn=$(basename -- "$path")  
  echo "$curd/$curn" | xargs -0 $SCRIPTPATH/absolute_path_to_clipboard.sh  
  echo "In clipboard: $curd/$curn"
fi