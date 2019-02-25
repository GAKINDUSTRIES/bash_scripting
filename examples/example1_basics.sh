#!/bin/zsh

# Simple scripting example that creates a new note
# Author: Guillermo Kuster

echo $(date): $* >> notes.txt
echo "Note saved at notes.txt"
