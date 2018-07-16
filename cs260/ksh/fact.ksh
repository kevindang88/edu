factorial ()
{
  if (( $1 <= 1 ))
  then
    return 1
  else 
    typeset tmp
    typeset result
    (( tmp = $1 - 1 ))
    factorial $tmp
    (( result = $? * $1 ))
    return $result
  fi
}
