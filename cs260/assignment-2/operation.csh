#!/bin/csh
# this script is called by s10.sch
set valid = 0
while ($valid == 0)
  cat << ENDOFMENU
Add the numbers (enter a or A)
Subtract the numbers (enter s or S)
Multiply the numbers (enter m or M)
Divide the numbers (enter d or D)
Exit (select e or E)
ENDOFMENU
  set input = $<
  switch ($input)
    case "a":
    case "A":
      @ result = $argv[1] + $argv[2]
      set valid = 1
      breaksw
    case "s":
    case "S":
      @ result = $argv[1] - $argv[2]
      set valid = 1
      breaksw
    case "m":
    case "M":
      @ result = $argv[1] * $argv[2]
      set valid = 1
      breaksw
    case "d":
    case "D":
      @ result = $argv[1] / $argv[2]
      set valid = 1
      breaksw
    case "e":
    case "E":
      exit
    default:
      printf "Invalid choice, try again\n"
  endsw
  printf "$result\n"
end

exec ./prompt_continue.csh $argv[1] $argv[2]
