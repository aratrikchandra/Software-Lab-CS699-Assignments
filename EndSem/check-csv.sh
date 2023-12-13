#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file-to-check>" 1>&2
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "File $1 does not exist" 1>&2
    exit 2
fi

ncols=$(./num-cols.sh "$FILE")

awk -F, '{print NF}' "$FILE" | grep -v "$ncols" >/dev/null
res=$?

if [ $res -eq 0 ]; then
    echo "malformed"
    exit 3
else
    echo $ncols
    exit 0
fi
