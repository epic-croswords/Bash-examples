#!/bin/bash

#set script into debug mode
set -x

#date & time stored on file to check
value=$(date)
echo "Date that script run $value"
# check the apache service is running or not

ls /var/run/httpd/httpd.pid

if [ -f /var/run/httpd/httpd.pid ]
then
	echo "this service is working great"
else
	echo "the apache service is not working"
	echo 
	echo "The Apache service is try to start"
	systemctl start httpd
	echo
	if [ $? -eq 0 ]
	then
		echo "This service is currntly running stage"
		echo
	else
		echo "This service is not able to start, kindly contact to the system admin."
fi
fi
