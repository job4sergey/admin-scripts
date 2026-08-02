#!/bin/sh

. "${HOME}/.admin_script"

path=$(sh -c "$CLIPBOARD_PASTE")

cp -R "$path" .


