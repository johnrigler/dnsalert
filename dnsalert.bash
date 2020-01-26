#!/bin/bash

if [[ $CIRCLECI == 'true' ]]
then
DIR=/home/circleci/project
apt-get install dnsutils
else
DIR=/root/dnsalert
fi

COUNT=$(for X in 1 2 3 4 5 6 7 8 9 10
do
dig gofundspark.com MX +short
sleep 0
done | sort -u )

let COUNT=COUNT-1

exit $COUNT 
