if (( $# != 2 )); then
  echo "Usage: s8 positive_int positive_int"
  exit
fi

if (( $1 == $2 )); then
  echo "GCD: $1"
  echo "LCM: $1"
elif (( $1 < $2 )); then
  (( small = $1 ))
  (( large = $2 ))
else
  (( small = $2 ))
  (( large = $1 ))
fi

(( i = $small ))
while (( $i > 0 )); do
  if (( $large % $i == 0 && $small % $i == 0 )); then
    (( gcd = $i ))
    break;
  fi
  (( i = $i - 1 ))
done

(( mult = $large ))
while (( 1 )); do
  if (( $mult % $small == 0 )); then
    (( lcm = $mult ))
    break;
  else
    (( mult = $mult + $large ))
  fi
done

echo "GCD: $gcd"
echo "LCM: $lcm"
