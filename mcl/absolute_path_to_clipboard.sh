args=("$@")
file="${args[0]}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

absolute="$(cd $(dirname $file); pwd)/$(basename $file)"
res=$(printf "%s" "$absolute" | $SCRIPTPATH/chompit.py)

printf "%s" "$res" | $SCRIPTPATH/clipit.py

