#!/bin/bash

conter=2
while true
do
	echo "looping"
	echo "the value is $conter"
	conter=$(( $conter * 2 ))
	sleep 1 
	#echo "$conter"
done
