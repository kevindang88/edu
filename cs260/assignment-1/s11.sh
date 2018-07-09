#!/bin/sh
echo -e "Enter an integer between 1 and 10: \c"
read input

if [ $input -lt 1 -o $input -gt 10 ]; then
  echo "Invalid input"
  exit
fi

i=1
sum=0
prod=1

while [ $i -le $input ]; do
  sum=`expr $sum + $i`
  prod=`expr $prod \* $i`
  i=`expr $i + 1`
done

echo "Sum: $sum"
echo "Factorial: $prod"
