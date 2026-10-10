#!/bin/sh
# Compare mc active/other pane cursor files (from ~/.mc_state) with kdiff3.
# Refresh state in mc first: F2 → s

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
exec "$SCRIPTPATH/mc_kdiff3.py" "$@"
