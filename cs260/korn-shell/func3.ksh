f ()
{
  (( returnValue = $1 * $2 ))
  return $returnValue
}
# main program.
f 3 4
result=$?
echo return value from function was $result
