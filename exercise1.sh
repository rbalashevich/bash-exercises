#!/bin/bash
args=("$@")
echo Number of arguments: $#
echo 1st argument: ${args[0]}
echo 2nd argument: ${args[1]}
echo 3nd argument: ${args[2]}
echo more arguments: ${args[3]}, ${args[4]}, ${args[5]}, ${args[6]}

myArray1=(${args[3]} ${args[4]} ${args[5]} ${args[6]})
myArray2=("normal" "request" "failure" "error" "warning" "alert" "notice" "note")
echo "Name: $1"
echo "Count: $2"
echo "Type: $3"

mkdir -p $HOME/mylogs
cd $HOME/mylogs
touch $1.log

re='^[0-9]+$'
if [[ $3 =~ $re && $4 =~ $re && $5 =~ $re && $6 =~ $re ]] ; then
   echo "error: one of additional parameters is a number and not a string! Exiting." >&2; exit 1
fi

for (( i = 1; i <= $2; ++i )); do
  printf "$i) ${myArray1["$[RANDOM % ${#myArray1[@]}]"]}: ${myArray2[RANDOM%7]}\n" >> ./$1.log
done
  printf "\n" >> ./$1.log
