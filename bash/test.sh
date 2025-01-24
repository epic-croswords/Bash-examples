#!/bin/bash

echo "website list written on website.txt file"

for i `cat website.txt`;
do
    echo "list of website and there status"
    curl -IL $if | grep HTTP/1.1 | awk '{print $2}'
done
