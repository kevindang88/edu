echo -e "Enter an integer between 1 and 10: \c"
read input

if (( $input < 1 || $input > 10 )); then
  echo "Invalid input"
  exit
fi

let i=1
let sum=0
let prod=1

while (( $i <= $input )); do
  (( sum = $sum + $i ))
  (( prod = $prod * $i ))
  (( i = $i + 1 ))
done

echo "Sum: $sum"
echo "Factorial: $prod"
