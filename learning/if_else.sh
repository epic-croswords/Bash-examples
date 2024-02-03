#!/bin/bash

#set -x

value=$(ifconfig | grep -v LOOPBACK | grep -ic flags)

if [ $value -eq 1 ]
then 
	echo "You have 1 ethernet card"
elif [ $value -gt 1 ] 
then
	echo "you have more that 1 ethernet card"
else
	echo "you dont have ethernet card"
fi
echo
cards=$(ifconfig | awk '{$1=$1;print}')
echo "cards that you have $cards"

echo
echo "Your script complete successfully"
echo