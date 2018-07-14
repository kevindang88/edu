echo -e "Enter a score: \c"
read score
if (( $score < 0 || $score > 100 )); then
  echo "Invalid score"
  exit
elif (( $score >= 90 )); then
  echo "you got A"
elif (( $score >= 80 )); then
  echo "you got B"
elif (( $score >= 70 )); then
  echo "you got C"
elif (( $score >= 60 )); then
  echo "you got D"
else
  echo "you failed"
fi

