#!/bin/bash

IP=$(curl -s icanhazip.com)

echo "$IP"

OLDIP=$(<ip.txt)

echo "$OLDIP"

if [[ $IP != $OLDIP ]]
then
	sendEmail -f fromaddress@gmail.com -t sendto@someemail.com -s smtp.gmail.com:587 -xu username@gmail.com 	-xp Password 	-u "Message for you sir" -m "New ip change "$IP""
	echo "$IP" > ip.txt

fi