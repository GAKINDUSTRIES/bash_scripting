#!/bin/bash
#
# Print a specified word inside a box
# Author: Guillermo Kuster

usage () {
  cat <<END
count [-r] [-bn] [-s n] stop

Draw a box inside a given text
        -w: Word specified
        -h: Show the help message
        -t: Specify the type of box (types: [line, star, dot, hashtag])
END
}

# function to handle errors
error() {
  echo "Error $1"
  usage
  exit $2
}>&2

drawline () {
  declare line=""
  declare boxicn=$1


  for (( i = 0; i < $2; i++ )); do
    line="${line}${boxicn}"
  done
  printf "%s\n" "$line"
}

while getopts "t:w:h" opt; do
  case $opt in
    h)
      usage
      exit 0
      ;;
    w)
      declare word=${OPTARG}
      ;;
    t)
      declare type=${OPTARG}
      ;;
  esac
done

case $type in
  "line") declare char="-" ;;
  "star") declare char="*" ;;
  "dot") declare char="." ;;
  "hashtag") declare char="#" ;;
esac

declare -i len="${#word} + 4"

drawline "$char" $len
echo "$char $word $char"
drawline "$char" $len

exit 0
