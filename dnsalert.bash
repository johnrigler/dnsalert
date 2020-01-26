#!/bin/bash

if [[ $CIRCLECI == 'true' ]]
then
DIR=/home/circleci/project
else
DIR=/root/dnsalert
fi

dig_mx() {

curl http://dime.cash/dig_mx.php?host="$1" 2>/dev/null

}

for X in 1 2 3 4 5 
do
dig_mx gofundspark.com
sleep 2
done | sort -u > $$

cat $$
