# s3 modified to take command line arguments instead of user input
if (( $# != 1 )); then
  echo "Usage: s3m score"
  echo "Score must be between 0 and 100"
  exit
fi

(( score = $1 ))

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

