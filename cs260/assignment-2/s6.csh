#!/bin/csh
set count = 0
while ($count <= 9)
  printf "$count "
  @ count = $count + 1
end
printf "\n"
