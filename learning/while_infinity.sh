#!/bin/bash

conter=0
while [ $conter -lt 5 ]
do
	echo "looping"
	echo "the value is $conter"
	conter=$(( $conter + 1 ))
done