#!/bin/bash
_cp(){
    > "$2"
    while LANG='C' IFS= read -r -d '' input; do
        printf "%s%b" "$input" '\0' >> "$2"
    done < "$1"
}

_cp "$1" "$2"
