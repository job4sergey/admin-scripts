SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

path=`xclip -sel c -o`

cp "$path" .


