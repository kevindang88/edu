#!/bin/sh
stop=0
while [ $stop -eq 0 ]; do
  echo -e "Are you OK? \c"
  read answer
  case $answer in
    "y"|"Y")
      echo "glad to hear it"
      stop=1
      ;;
    "n"|"N")
      echo "sorry that you are not feeling good"
      stop=1
      ;;
    *)
      echo "in-correct choice"
      ;;
  esac
done 
