#!/bin/bash

myArray=("normal" "request" "failure" "error" "warning" "alert" "notice" "note")
echo "Name: $1"
echo "Count: $2"
echo "Type: $3"
mkdir -p $HOME/mylogs
cd $HOME/mylogs
touch $1.log
re='^[0-9]+$'
if [[ $3 =~ $re ]] ; then
   echo "error: $3 is a number and not a string! Exiting." >&2; exit 1
fi
i=0
while (( ++i <= $2 ));
do
    printf "$3: ${myArray[RANDOM%7]}\n" > ./$1.log
done;
