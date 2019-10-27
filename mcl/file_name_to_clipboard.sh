args=("$@")
file="${args[0]}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

name="$(basename $file)"
res=$(printf "%s" "$name" | $SCRIPTPATH/chompit.py)

printf "%s" "$res" | $SCRIPTPATH/clipit.py

