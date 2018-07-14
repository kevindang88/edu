echo -e "Enter a number: \c"
read input
if (( $input % 2 == 0 )); then
  echo even
else
  echo odd
fi
