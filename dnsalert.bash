#!/bin/bash

if [[ $CIRCLECI == 'true' ]]
then
DIR=/home/circleci/project
else
DIR=/root/dnsalert
fi

for X in 1 2 3 4 5 6 7 8 9 10
do
dig gofundspark.com MX +short
sleep 5
done | sort -u 

return 0
