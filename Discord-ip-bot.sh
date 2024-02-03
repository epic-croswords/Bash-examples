#!/bin/bash

get_ip() {
	ip a | grep  inet | awk '{print $2}' | grep 192
}
IP=$(get_ip)

echo "note your ip details.."
echo $IP

DISCORD_WEBHOOK="ADD YOUR WEBHOOK HERE"
main='{
	"content": "Current ip address of your machine '$IP'"
}'

curl -H "Content-Type: application/json" -d "$main" $DISCORD_WEBHOOK
sleep 5

exit 0
