#!/bin/sh

# Read in two runtime arguments -> $1, $2, etc. are directly pupolated by the system
# First one -> path to a directory on the filesystem: filesdir
# Second one -> text string which will be searched for: searchstr

# Check if both arguments exist and throw an error with value 1 if not
# $# -> the number of arguments
if [ $# -ne 2 ] 
then
    echo Please supply both arguments
    exit 1
fi

filesdir=$1
searchstr=$2

#echo $filesdir
#echo $searchstr

# Check if filesdir is a directory and throw an error of value 1 if not
if ! [ -d $filesdir ]
then
    echo Given directory does not exist on the system
    exit 1
fi

# Do the according search and write the output.
num_files=$(find $filesdir -type f | wc -l)

# Count lines
num_lines=$(find $filesdir -type f | xargs grep -Hn $searchstr | wc -l)

echo The number of files are $num_files and the number of matching lines are $num_lines