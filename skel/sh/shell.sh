#!/usr/bin/env sh
#/ Author: Edson César <edsono@gmail.com>
#/ Date: $date
#/ Usage: <filename> [OPTION] <argument>...
#/ Description...
set -e

if [ $# -eq 0 -o "$1" = "--help" ]
then
    grep '^#/' <"$0" |
    cut -c4-
    exit 2
fi

# TODO code!
