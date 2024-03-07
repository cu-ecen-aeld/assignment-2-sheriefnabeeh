#!/bin/bash

set -e 

filesdir=$1
searchstr=$2


if [[ -z $filesdir ]] || [ -z $searchstr ];
then
    echo "argument missing"
    exit 1
fi

if [[ ! -d $filesdir ]];
then
    echo "check the directory passed for correctness"
    exit 1
fi

NFiles=$( find $filesdir  -type f  | wc -l)
matchingLines=$( grep -r $searchstr $filesdir | wc -l)

echo "The number of files are $NFiles and the number of matching lines are $matchingLines"

exit $?


