#!/bin/bash
#set -exo pipefail

if [ -z $1 ];
then
        echo "Usage $0 <directory path>"
fi

DIR=$1

if [ ! -d $DIR ]; then
        echo "Error: $DIR is not valid or not exists"
        exit 1
fi

file_count=$(find "$DIR" -type f | wc -l)
dir_count=$(find "$DIR" -type d | wc -l)

total_size=$(du -sh "$DIR" | awk '{print $1}')


echo "total dir size is '$DIR'"
echo "file count is '$file_count'"
echo "dir count is '$dir_count'"
