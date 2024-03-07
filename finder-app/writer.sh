#!/bin/bash

writefile=$1
writestr=$2

if [ -z $writefile ] || [ -z $writestr ]
then   
    echo "argument missing"
    exit 1
fi

out=$(mkdir -p "$(dirname "$writefile")" && touch "$writefile")

if [[ ! $out -eq 0 ]];
then 
    echo "couldn\'t create file"
    exit $out
fi

echo "$writestr" >> "$writefile" 

if (( $? == 0 ))
then
    exit 0
else
    echo "failed to write to file"
fi

