let valid=0
while (( $valid != 1 )); do
  echo -e "Are you OK? \c"
  read reply
  case $reply in
    "y"|"Y")
      echo "glad to hear it"
      let valid=1
      ;;
    "n"|"N")
      echo "sorry that you are not feeling good"
      let valid=1
      ;;
    *)
      echo "in-correct choice"
      ;;
  esac
done

