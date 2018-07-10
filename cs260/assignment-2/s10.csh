#!/bin/csh
if ($#argv == 0) then
  printf "Usage: s10 integer integer\n"
  exit
endif

exec ./operation.csh $argv[1] $argv[2]
