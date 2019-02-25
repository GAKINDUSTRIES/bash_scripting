#!/bin/bash
#
# A simple guessing game
# Author: Guillermo Kuster

####################################################
####################################################
# Until statement

# until [[ $condition ]]; do
#  statements
# done

####################################################
####################################################

# Get a random number  < 100
target=$(($RANDOM % 100))

# Initialize the user's guess
guess=

until [[ $guess -eq $target ]]; do
  read -p "Take a guess:" guess
  if [[ $guess -lt $target ]]; then
    echo "Higher"
  elif [[ $guess -gt $target ]]; then
    echo "Lower!"
  else
    echo
    echo "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"
    echo "🎉 Your found it! 😁 🎉"
    echo "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"
  fi
done

exit 0
