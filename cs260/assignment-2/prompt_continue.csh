#!/bin/csh
# this script is called by s10.csh
set valid = 0
while ($valid == 0)
  cat << ENDOFMENU
(a) Do another operation with the same two integers
(b) Do another operation with two different integers
(e) Exit
ENDOFMENU
  set input = $<
  switch ($input)
    case "a":
    case "A":
      set valid = 1
      exec ./operation.csh $argv[1] $argv[2]
      breaksw
    case "b":
    case "B":
      set valid = 1
      printf "Enter two new integers: "
      set input = ( $< )
      exec ./operation.csh $input[1] $input[2] 
      breaksw
    case "e":
    case "E":
      exit
    default:
      printf "Invalid choice, try again\n"
      breaksw
  endsw
end
