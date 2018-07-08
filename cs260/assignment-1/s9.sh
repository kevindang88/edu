#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Usage: s9 integer"
fi

do_square() {
  result=`expr $1 \* $1`
  return $result
}

# Call function and pass $1 as parameter
do_square $1

# Assign return value of last called function to 'ret'
ret=$?

echo $ret
