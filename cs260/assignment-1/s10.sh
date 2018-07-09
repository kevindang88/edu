#!/bin/sh
if [ $# -ne 2 ]; then
  echo "Usage: s10 integer integer"
  exit
fi

operation() {
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
  prompt_continue $1 $2
}

prompt_continue() {
  valid=0
  while [ $valid -eq 0 ]; do
    cat << ENDOFSECONDMENU

(a) Do another operation with the same two integers

(b) Do another operation with two different integers

(e) Exit

ENDOFSECONDMENU
    read input
    case $input in
      a|A)
        valid=1
        operation $1 $2
        ;;
      b|B)
        valid=1
        echo -e "Enter two new integers: \c"
        read int1 int2
        operation $int1 $int2
        ;;
      e|E)
        valid=1
        exit
        ;;
      *)
        echo "Invalid choice, try again"
        ;;
    esac
  done
}

operation $1 $2
