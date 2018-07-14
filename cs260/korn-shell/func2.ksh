f ()
{
  echo parameter 1 = $1
  echo parameter list = $*
}
# main program
f 1
f cat dog goat
