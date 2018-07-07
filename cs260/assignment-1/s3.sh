#!/bin/sh
echo -e "Enter a score: \c"
read score
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
