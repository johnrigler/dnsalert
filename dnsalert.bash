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

sample_mx() {
HOST=$(echo $1 | sed 's/-/./')
for X in 1 2 3 4 5 
do
dig_mx $HOST 
sleep 0
done | sort -u  > $$

cat $$ | grep "0 $1.mail.protection.outlook.com."

# Test for a good entry

if [[ $? -ne 0 ]]
  then
  return 1
  fi

# Test for old records

cat $$ | grep -v "0 $1.mail.protection.outlook.com."

if [[ $? -eq 0 ]]
  then
  return 2
  fi

}

python mxcheck.py | while read MX
do
sample_mx $MX
RC=$?
if [[ $RC -ne 0 ]]
then
exit 1 
fi
done
