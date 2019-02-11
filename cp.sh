#!/bin/bash
_cp(){
    > $2
    while IFS= read -r -d '' s || [[ $s ]]; do
          echo -n "$s" >> $2
          echo -ne '\0' >> $2
    done < $1
}

_cp $1 $2
