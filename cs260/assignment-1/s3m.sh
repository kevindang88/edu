#!/bin/sh

# s3 modified to take command line arguments instead of user input
if [ "$1" = "" ]; then
  echo "Usage: s3m [score]"
  echo "Score must be between 0 and 100"
  exit
fi

score=$1

if [ $score -gt 100 ] || [ $score -lt 0 ]; then 
  echo "invalid score"
elif [ $score -ge 90 ]; then
  echo "you got A"
elif [ $score -ge 80 ]; then
  echo "you got B"
elif [ $score -ge 70 ]; then
  echo "you got C"
elif [ $score -ge 60 ]; then
  echo "you got D"
else
  echo "you failed"
fi
