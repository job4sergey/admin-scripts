SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
printf "%s" "$*" |  $SCRIPTPATH/vimp.py
