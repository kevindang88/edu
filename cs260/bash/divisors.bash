#!/bin/bash
#
declare -i testval=20
declare -i count=2

while (( $count <= $testval )); do
  (( result = $testval % $count ))
  if (( $result == 0 )); then
    echo " $testval is evenly divisible by $count"
  fi
  (( count++ ))
done

