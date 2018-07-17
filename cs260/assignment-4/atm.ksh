# This is the exact same code as atm.bash

# Initial balances
SAVINGS=1000
CHECKING=1000

prompt_continue() {
  read -p "<Press Enter to continue>"
}

initial_prompt() {
  clear
  echo "*** Welcome to Cal Poly's ATM ****"
  valid=0
  failed_attempts=0
  while (( valid != 1 )); do
    echo -e "Please enter your PIN: \c"
    read PIN
    if (( $PIN == 111 )); then
      valid=1
    else
      echo "Incorrect PIN."
      (( failed_attempts++ ))
      if (( failed_attempts >= 3 )); then
        echo "Too many illegal PINs. Try later again."
        exit
      fi
    fi
  done
}

display_menu() {
  valid=0
  while (( 1 )); do
    clear
    echo "*** Welcome to Cal Poly's ATM System ***"
    PS3="==> Please select option (1-6): "
    atm_options=( 
      "Transfer from checking account to savings account" \
      "Transfer from savings account to checking account" \
      "Savings account balance" \
      "Checking account balance" \
      "Withdraw Cash from either account" \
      "Exit" )
    select option in "${atm_options[@]}"; do
      case $REPLY in
        1)
          transfer CHECKING SAVINGS 
          clear; break;;
        2)
          transfer SAVINGS CHECKING
          clear; break;;
        3)
          show_account_balance SAVINGS
          prompt_continue       
          clear; break;;
        4)
          show_account_balance CHECKING
          prompt_continue 
          clear; break;;
        5)
          withdraw
          clear; break;;
        6)
          echo "Thank you for using the ATM system."
          exit;;
        *)
          clear; break;;
      esac
    done
  done
}

show_balances() {
  show_account_balance SAVINGS
  show_account_balance CHECKING
}

# Show the balance of the specified account.
# Accepts the strings "SAVINGS" or "CHECKING" as arguments.
show_account_balance() {
  account=$1
  eval balance=\$$account # indirect referencing
  echo -e "$account account balance:\t\$${balance}.00"
}

# Allows user to transfer funds from one account to the other.
# Accepts the strings "SAVINGS" and "CHECKING" as arguments.
# Usage: transfer source destination
transfer() {
  clear
  echo "*** TRANSFER FROM $1 TO $2 ***"
  show_balances
  src=$1; dst=$2
  eval src_balance=\$$src; eval dst_balance=\$$dst
  echo -e "Enter the amount you wish to transfer: \c"
  read amount
  if (( $amount > $src_balance )); then
    echo "Insufficient funds. Transaction not completed."
    show_account_balance $src
  else
    (( src_balance -= $amount ))
    (( dst_balance += $amount ))
    (( $src = $src_balance ))
    (( $dst = $dst_balance ))
    echo "Transaction complete."
    show_balances
  fi
  prompt_continue
}

withdraw() {
  echo "*** WITHDRAWAL ***"
  show_balances
  PS3="==> Please select option (1-3): "
  select option in "Savings" "Checking" "Quit"; do
    case $REPLY in
      1)
        account="SAVINGS"
        break;;
      2)
        account="CHECKING"
        break;;
      3)
        return;;
      *)
        echo "Invalid input. Try again.";;
    esac
  done
  echo "*** WITHDRAW FROM $account ***"
  eval balance=\$$account
  echo -e "Enter the amount you wish to withdraw: \c"
  read amount
  if (( $amount > $balance )); then
    echo "Insufficient funds. Transaction not completed."
  else
    (( balance -= $amount ))
    (( $account = $balance ))
    echo "Transaction complete."
  fi
  show_balances
  prompt_continue
}

# program starts here 
main() {
  initial_prompt
  display_menu
}

main

