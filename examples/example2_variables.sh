#!/bin/zsh
#
#!/bin/zsh -x ----> Using -x option, prints every single value that executes
#                   It's useful to debug the code
#                   You can also add set -x and set +x  to debug a specific portion of the code
#                       set -x
#                       some code I want to debug
#                       ....
#                       ..
#                       set +x

# Interactive script that creates a note for a specific topic.
# Run it by excecute ./example2_variables.sh
# Author: Guillermo Kuster

# get the date
date=$(date)

# get the topic
topic=$1

#filename to write to
filename="${topic}.txt"


# Ask user for input
read "note?Your note: "

echo $date: $note >> "$filename"
echo "Note saved at $filename"

