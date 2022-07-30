#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
printf "%s" "$*" |  $SCRIPTPATH/explorerit.py
