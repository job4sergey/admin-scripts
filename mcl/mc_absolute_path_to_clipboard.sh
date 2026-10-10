#!/bin/sh
# Copy absolute path of mc active-pane cursor file (from ~/.mc_state) to clipboard.
# Refresh state in mc first: F2 → S

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

res=$("$SCRIPTPATH/mc_absolute_path_to_clipboard.py") || exit $?
res=$(printf "%s" "$res" | "$SCRIPTPATH/chompit.py")
printf "%s" "$res" | "$SCRIPTPATH/clipit.py"
