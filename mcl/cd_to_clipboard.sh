SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

res=$(printf "%s" "$(pwd)" | $SCRIPTPATH/chompit.py)
printf "%s" "$res" |  $SCRIPTPATH/clipit.py
