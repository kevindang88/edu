if (( $# != 1 )); then
  echo "Usage: square integer"
  exit
fi

do_square () {
  (( result = $1 * $1 ))
  return $result
}

do_square $1
echo $?
