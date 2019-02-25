#!/bin/bash
#
# Change filename extensions
# Excecute by passing both extensions (the old and the new one)
# Author: Guillermo Kuster

####################################################
####################################################
# For statement

# for VAR in WORDS; do
#   statements
# done

# Do not quote WORDS

# $# returns the number of arguments passed to stdin

####################################################
####################################################

if [[ $# -ne 2 ]]; then
  echo "Not exactly two arguments"
fi

# *"$1" returns all the files that has the extension passed as the first argument of the function
for f in *"$1" ; do
  base=$(basename "$f" "$1")  # strip the name without the extension
  echo mv "$f" ${base}$2      # This does not do anything but works as a debug. Remove echo to make changes effectively
  mv "$f" ${base}$2
done

exit 0
