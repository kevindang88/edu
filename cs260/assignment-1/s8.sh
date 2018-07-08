#!/bin/sh
if [ $# -ne 2 ]; then
  echo "Usage: s8 positive_integer positive_integer"
  exit
fi

if [ $1 -eq $2 ]; then
  echo "GCD: $1"
  echo "LCM: $1"
elif [ $1 -lt $2 ]; then
  small=$1
  big=$2
else
  small=$2
  big=$1
fi

i=$small
while [ $i -gt 0 ]; do
  if [ `expr $big % $i` = 0 -a `expr $small % $i` = 0 ]; then
    gcd=$i
    break
  fi
  i=`expr $i - 1`
done

mult=$big
while [ 1 ]; do
  if [ `expr $mult % $small` = 0 ]; then
    lcm=$mult
    break
  else
    mult=`expr $mult + $big`
  fi
done

echo "GCD: $gcd"
echo "LCM: $lcm"

