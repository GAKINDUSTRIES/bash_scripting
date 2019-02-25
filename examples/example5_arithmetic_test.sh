#!/bin/bash -x
#
# Compare file count of two directories
# Author: Guillermo Kuster

####################################################
####################################################
# Arithmetic tests

# You can only compare integer in bash scripting

# The format to compare to integer is as follow [[ arg1 OP arg2 ]]
# where OP is:
#     - eq: equality
#     - ne: not equal
#     - lt: less than
#     - gt: greater than
#     - And some other stuff, see help

# To get the length of the string in a variable use ${#var}

####################################################
####################################################

# Both arguments should be directories
if [[ ! -d $1 ]]; then
  echo "'$1' is not a directory"
  exit 1
fi

# Both arguments should be directories
if [[ ! -d $2 ]]; then
  echo "'$2' is not a directory"
  exit 1
fi

dir1="$1"
dir2="$2"

# Get number of files in directory

count_1=$(ls -A1 "$dir1" | wc -l)
count_2=$(ls -A1 "$dir2" | wc -l)

# Which one has more files

if [[ $count_1 -gt $count_2 ]]; then
  echo "${dir1} has more files than ${dir2}"
elif [[ $count_1 -lt $count_2 ]]; then
  echo "${dir2} has more files than ${dir1}"
else
  echo "${dir1} has the same amount of files than ${dir2}"
fi

exit 0
