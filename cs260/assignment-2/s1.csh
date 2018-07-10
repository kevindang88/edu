#!/bin/csh
echo "Enter a number: "
set number = $<
if ($number % 2 == 0) then
  echo "Number is even"
else
  echo "Number is odd"
endif
