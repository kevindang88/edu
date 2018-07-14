# Demonstrating ksh's 'select' command
if (( $# != 2 )); then
  echo "Usage s10 int int"
  exit
fi

operation() {
  echo "This version demonstrates ksh's 'select' command"
  (( valid = 0 ))
  while (( $valid != 1 )); do
    select op in \
      "Add"\
      "Sub"\
      "Mult"\
      "Div"\
      "Change operands"\
      "Exit"
    do
      case $op in
        "Add")
          (( result = $1 + $2 ))
          (( valid = 1 ))
          ;;
        "Sub")
          (( result = $1 - $2 ))
          (( valid = 1 ))
          ;;
        "Mult")
          (( result = $1 * $2 ))
          (( valid = 1 ))
          ;;
        "Div")
          (( result = $1 / $2 ))
          (( valid = 1 ))
          ;;
        "Change operands")
          (( valid = 1 ))
          echo -e "Enter new operands: \c"
          read n1 n2
          operation $n1 $n2
          ;;
        "Exit")
          exit
          ;;
        *)
          echo "Invalid choice, try again"
          echo "(Enter the corresponding number)"
          ;;
      esac
      echo $result
    done
  done
}

operation $1 $2
