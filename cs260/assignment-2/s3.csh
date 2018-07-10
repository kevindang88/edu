#!/bin/csh
printf "Enter a score: "
set score = $<
if ($score < 0 || $score > 100) then
  printf "Invalid score.\n"
else if ($score >= 90) then
  printf "you got A\n"
else if ($score >= 80) then
  printf "you got B\n"
else if ($score >= 70) then
  printf "you got C\n"
else if ($score >= 60) then
  printf "you got D\n"
else
  printf "you failed\n"
endif
