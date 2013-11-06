#!/bin/bash

IP=$(curl -s icanhazip.com) #returns current external IP

echo "$IP" #not necessary, added to verify the script was assigning value to the variable correctly

OLDIP=$(<ip.txt) #assigns the ip in the txt file to the variable

echo "$OLDIP"

if [[ $IP != $OLDIP ]]
then
	sendEmail -f fromaddress@gmail.com -t sendto@someemail.com -s smtp.gmail.com:587 -xu username@gmail.com 	-xp Password 	-u "Message for you sir" -m "New ip change "$IP""
	echo "$IP" > ip.txt #writes IP in variable to txt file

fi
