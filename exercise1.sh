#!/bin/bash 
args=("$@")
echo Number of arguments: $#
echo 1st argument: ${args[0]}
echo 2nd argument: ${args[1]}
echo 3nd argument: ${args[2]}
echo more arguments: ${args[3]}, ${args[4]}, ${args[5]}, ${args[6]}

ArrayStatus=("normal" "request" "failure" "error" "warning" "alert" "notice" "note")
echo "Name: $1"
echo "Count: $2"
echo "Type: $3"

mkdir -p $HOME/mylogs
cd $HOME/mylogs

logfile="$1.log"
if [ -f "$logfile" ]
then
    rm ./${logfile}
    echo "Old file ${logfile} removed."
fi

touch $1.log

re='^[0-9]+$'
counter=1
# counteradditional=$(($#-3))
counterall=$(($#))
# echo $counteradditional

for i in "${args[@]}"; do

echo "🧮 Argument counter in array is $counter now"
echo "🔬 Dumping argument, it is \"$i\" now. Checking is it a numeric or not"
if [[ $counter -gt 2 && $i =~ $re ]] ; then
   echo "🔢 Error: one of additional parameters is numeric and not a string! Exiting." >&2; exit 1
fi
 for (( i = 3; i < $counterall; ++i )); do
   printf "${args[$i]}: ${ArrayStatus[RANDOM%7]}\n" >> ./$1.log
 done
counter=$((counter+1))
done
