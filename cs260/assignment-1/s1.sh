echo -e "Enter a number: \c"
read number
if expr $number % 2 = 0 > /dev/null 2>&1
then
  echo The number is even
else
  echo The number is odd
fi
