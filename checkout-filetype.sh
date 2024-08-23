#!/bin/bash

set -e
set -x
set -o pipefail


for FILE in "$@"
do
        if [ -e "$FILE" ]; then
                if [ -f "$FILE" ]; then
                        echo "this is dir '$FILE'"
                elif [ -d "$FILE" ]; then
                        echo "this is dir '$FILE'"
                else
                        echo "'$FILE' might be some diffrent type such symbolic link or socket"
                fi
        else
                echo "'$FILE' doesnt exist's"
        fi
done
