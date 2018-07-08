#!/bin/sh
if [ $# -ne 2 ]; then
  echo "Usage: s10 integer integer"
  exit
fi

valid=0
while [ $valid -eq 0 ]; do
  cat << ENDOFMENU
Add the numbers (enter a or A)
  
Subtract the numbers (enter s or S)
  
Multiply the numbers (enter m or M)
  
Divide the numbers (enter d or D)

Exit (select e or E)

ENDOFMENU
  read input
  case $input in
    a|A)
      result=`expr $1 + $2`
      valid=1
      ;;
    s|S)
      result=`expr $1 - $2`
      valid=1
      ;;
    m|M)
      result=`expr $1 \* $2`
      valid=1
      ;;
    d|D)
      result=`expr $1 / $2`
      valid=1
      ;;
    e|E)
      exit
      ;;
    *)
      echo "Invalid choice, try again"
      ;;
  esac
  echo $result
done

echo "Do another operation the same two integers?"
