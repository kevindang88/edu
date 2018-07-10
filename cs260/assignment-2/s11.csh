#!/bin/csh
printf "Enter an integer between 1 and 10: "
set input = $<
set sum = 0
set prod = 1
set i = 1
while ($i <= $input)
  @ sum = $sum + $i
  @ prod = $prod * $i
  @ i = $i + 1
end
printf "Sum: $sum\n"
printf "Product: $prod\n"
