#!/bin/csh
printf "Enter a color: "
set color = $<
switch($color)
  case "bl*":
  case "Bl*":
    printf "The sky color is $color\n"
    breaksw
  case "red":
  case "yellow":
    printf "The sun is sometimes this color.\n"
    breaksw
  default:
    printf "That color is not in any of the categories defined.\n"
    breaksw
endsw
   
