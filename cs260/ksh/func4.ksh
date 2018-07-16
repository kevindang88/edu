f () {
  typeset x
  (( x = $1 * $2 ))
  echo local x = $x
  return $x
}
# main program.
x=1
echo global x = $x
f 3 4
result=$?
echo return value from function was $result
echo global x = $x
