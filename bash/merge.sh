#!/usr/bin/env bash

function help() {
    echo "Usage: $BASH "$0" <input-file-1> [<input-file-2>...] <merged-file>"
    echo "Merge multiple files into one."
}

if [ "$#" -lt 2 ]; then
    help
    exit 1
fi

INPUT_FILES=()
OUTPUT_FILE=${@: -1}

for i in "${@: 1: $#-1}"; do
    INPUT_FILES+=("$i")
done

cat "${INPUT_FILES[@]}" > "$OUTPUT_FILE"