#!/bin/csh
set i = 1
while ($i <= $#argv)
  set j = $i
  while ($j <= $#argv)
    printf "$argv[$j] "
    @ j = $j + 1
  end
  @ i = $i + 1
  printf "\n"
end
