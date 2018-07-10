#!/bin/csh
if ($#argv == 0) then
  printf "Usage: s8 positive_integer positive_integer\n"
  exit
endif

if ($argv[1] == $argv[2]) then
  printf "GCD: $argv[1]\n"
  printf "LCM: $argv[1]\n"
else if ($argv[1] < $argv[2]) then
  set small = $argv[1]
  set large = $argv[2]
else
  set small = $argv[2]
  set large = $argv[1]
endif

set i = $small
set gcd = 1
while ($i > 0)
  if ($large % $i == 0 && $small % $i == 0) then
    set gcd = $i
    break
  endif
  @ i = $i - 1
end

set mult = $large
while ( 1 )
  if ( $mult % $small == 0 ) then
    set lcm = $mult
    break
  else
    @ mult = $mult + $large
  endif
end


printf "GCD: $gcd\n"
printf "LCM: $lcm\n"
