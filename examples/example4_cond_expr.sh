#!/bin/bash
#
# This script creates a new bash script, sets permissions and more
# Author: Guillermo Kuster

# Is there an argument?
if [[ ! $1 ]]; then
  echo "Missing argument"
  exit 1
fi

scriptname=$1
bash_dir="${HOME}/dev/bash_scripting"
filename="${bash_dir}/${scriptname}"

if [[ -e filename ]]; then
  echo "File ${filename} already exists"
  exit 1
fi

# Check bash_dir exists
if [[ ! -d $bash_dir ]]; then
  if  mkdir "$bash_dir"; then
    echo "created ${bash_dir} directory"
  else
    echo "Could not create ${bash_dir}"
    exit 1
  fi
fi


# Create a script with a single line
echo '#!bin/bash' >> "$filename"
# Add executable permissions
chmod u+x "$filename"
# Open the editor
if [[ $EDITOR ]]; then
  $EDITOR $filename
else
  echo "Variable EDITOR not defined"
fi

exit 0
