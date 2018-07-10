#!/bin/mksh
echo -e "Enter a number: \c"
read number
if [ `expr $number % 2` -eq 0 ]
then
  echo "even"
else
  echo "odd"
fi
