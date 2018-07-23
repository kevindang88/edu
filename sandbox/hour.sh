#!/bin/sh
# hour.sh
i=1
until [ $i -gt 24 ]; do
  case $i in
    1|2|3|4|5|6|7|8|9|10|11):
      echo "Good morning"
      ;;
    12):
      echo "Lunch time"
      ;;
    13|14|15|16|17):
      echo "Siesta time"
      ;;
    18|19|20|21|22|23|24):
      echo "Good night"
      ;;
  esac
  i=`expr $i + 1`
done
