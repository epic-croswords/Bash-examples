#!/bin/bash

set -x 

Users="Mahesh test test2 test3 test4 test5"

for usr in $Users
do
	echo "The user names are $usr"
#	mkdir -p /home/$Users
	#adding users
	useradd $usr
	#check the status of users
	id $usr
	sleep 5
	userdel -f $usr
done 