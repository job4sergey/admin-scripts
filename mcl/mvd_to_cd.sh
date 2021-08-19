SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

curd=`pwd`

cd ~/Downloads

path=`ls -Art | tail -n 1`
res=$(printf "%s" "$path" | $SCRIPTPATH/chompit.py)
printf "%s" "$res" |  $SCRIPTPATH/clipit.py

echo "Latest downloaded: $path"

if [ "$#" -eq 1 ]; then  
  mv "$path" $curd
  echo "Moved."
fi