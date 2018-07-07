#!/bin/sh
echo -e "Enter a color: \c"
read color

case $color in
  bl*|Bl*)
    echo "The sky color is $color."
    ;;
  red|yellow)
    echo "The sun is sometimes this color."
    ;;
  *)
    echo "That color is not in any of the categories defined."
    ;;
esac
