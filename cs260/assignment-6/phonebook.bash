#!/bin/bash

# Check usage and input validation
initial_check() {
  if (( $# != 1 )); then
    echo "Usage: phonebook input_file"
    exit
  elif ! [ -r $1 ]; then
    echo "File does not exist or is unreadable."
    exit
  fi
}

# Display main menu
display_menu() {
  menu_options=("List records by first name (ascending)"
  "List records by first name (descending)"
  "List records by last name (ascending)"
  "List records by last name (descending)"
  "Search for a record by last name"
  "Search for a record by birthdate"
  )
  select option in "${menu_options[@]}"; do
    case $REPLY in
      1) ;;
      2) ;;
      3) ;;
      4) ;;
      5) ;;
      6) ;;
      7) ;;
    esac
  done
}

# Program starts here
main() {
  initial_check
  display_menu

}

main $BASH_ARGV
