#!/bin/bash -x
#
#!/bin/bash -x ----> Using -x option, prints every single value that executes
#                   It's useful to debug the code
#                   You can also add set -x and set +x  to debug a specific portion of the code
#                       set -x
#                       some code I want to debug
#                       ....
#                       ..
#                       set +x

# Simple scripting example that shows how to use if statement
# Author: Guillermo Kuster

# get the date
date=$(date)

# get the topic
topic=$1

#filename to write to
filename="${topic}.txt"


# Ask user for input
read -p "Your note: " note

if [[ $note ]]; then
  echo $date: $note >> "$filename"
  echo "Note saved at $filename"
else
  echo "No input; note wasn't saved"
fi

