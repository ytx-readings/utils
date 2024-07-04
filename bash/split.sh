#!/usr/bin/env bash

function help() {
    echo "Usage: $BASH "$0" <file-to-split>" "<output-dir>"
    echo "Split a file into multiple parts, each part at most 49 MB (slightly less than GitHub's recommended maximum file size of 50 MB)."
    echo "The split files will be put in the same output directory as the input file."
}

if [ "$#" -eq 1 ]; then
    FILE_TO_SPLIT="$1"
else
    help
    exit 1
fi

function split_file() {
    local FILE_TO_SPLIT=$1

    local PART_SIZE=49M
    local PREFIX="$(basename "$FILE_TO_SPLIT").part"

    split -d -b "$PART_SIZE" "$FILE_TO_SPLIT" "$PREFIX"
    return $?
}

split_file $@
exit $?