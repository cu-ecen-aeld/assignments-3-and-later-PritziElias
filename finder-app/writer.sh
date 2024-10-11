#!/bin/sh

if [ $# -ne 2 ]
then
    echo Please provide two arguments
    exit 1
fi

writefile=$1
writestr=$2
dir_name=$(dirname $writefile)

if [ ! -d $dir_name ]
then
    mkdir -p $dir_name
fi

echo $writestr>$writefile