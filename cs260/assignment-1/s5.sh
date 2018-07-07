echo -e "Enter a color: \c"
read color

case $color in
  "bl*"|"Bl*")
    echo "The sky color is $color"
    ;;
esac
