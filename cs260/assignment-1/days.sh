#!/bin/sh
i=1
while [ $i -le $# ]; do
  j=$i
  while [ $j -le $# ]; do
    echo -e "${!j} \c" 
    j=`expr $j + 1`
  done
  echo
  i=`expr $i + 1`
done
