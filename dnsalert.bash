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
sleep 0
done | sort -u > $$

cat $$ | grep "0 gofundspark-com.mail.protection.outlook.com."


# Test for a good entry

if [[ $? -ne 0 ]]
  then
  rm $$
  exit 1
  fi

# Test for old records

cat $$ | grep -v "0 gofundspark-com.mail.protection.outlook.com."

if [[ $? -eq 0 ]]
  then
  rm $$
  exit 2
  fi

rm $$
