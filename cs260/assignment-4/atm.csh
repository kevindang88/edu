#!/bin/csh

# Initial balances
# Need to use 'set' syntax to assign values to variables
set SAVINGS=1000
set CHECKING=1000

# C-shell doesn't have functions
# Using aliases for single-line commands
# Must escape <, >, (, ) characters from strings
alias prompt_continue echo "\<Press Enter to continue\>"
alias prompt_select6 echo -n "==\> Please select option \(1-6\): "
alias prompt_select3 echo -n "==\> Please select option \(1-3\): "
#alias show_savings echo Savings account balance: $ $SAVINGS.00
#alias show_checking echo Checking account balance: $ $CHECKING.00
#alias show_balances "show_savings; show_checking"

# Begin initial prompt
clear
echo "*** Welcome to Cal Poly's ATM ***"
set valid=0
set failed_attempts=0
# csh while-loop syntax
while ($valid != 1)
  echo -n "Please enter your PIN: "
  # csh syntax for reading user input
  set PIN = $<
  # csh for-loop syntax
  if ($PIN == 111) then
    set valid=1
  else
    echo "Incorrect PIN."
    # csh '@' syntax for arithmetic expressions
    @ failed_attempts ++
    if ($failed_attempts >= 3) then
      echo "Too many illegal PINs. Try later again."
      exit
    endif
  endif
end

# display main menu
while ( 1 )
  clear
  echo "*** Welcome to Cal Poly's ATM System ***"
  # Using here document to display menu
  cat << ENDOFMENU
  (1) Transfer from checking account to savings account
  (2) Transfer from savings account to checking account
  (3) Savings account balance
  (4) Checking account balance
  (5) Withdraw Cash from either account
  (6) Exit
ENDOFMENU
  prompt_select6
  set reply = $<
  switch ($reply)
    case "1":
      clear
      echo "*** TRANSFER FROM CHECKING TO SAVINGS ***"
      echo -n "Enter the amount you wish to transfer: "
      set amount = $<
      if ($amount > $CHECKING) then
        echo "Insufficient funds. Transaction not completed."
        echo Checking account balance: \$$CHECKING.00
      else
          @ CHECKING -= $amount
          @ SAVINGS += $amount
          echo "Transaction complete."
          echo Checking account balance:  \$$CHECKING.00
          echo Savings account balance:  \$$SAVINGS.00
      endif
      prompt_continue
      set c = $<
      breaksw
    case "2":
      clear
      echo "*** TRANSFER FROM SAVINGS TO CHECKING ***"
      echo -n "Enter the amount you wish to transfer: "
      set amount = $<
      if ($amount > $SAVINGS) then
        echo "Insufficient funds. Transaction not completed."
        echo Savings account balance: \$$SAVINGS.00
      else
          @ SAVINGS -= $amount
          @ CHECKING += $amount
          echo "Transaction complete."
          echo Savings account balance:  \$$SAVINGS.00
          echo Checking account balance:  \$$CHECKING.00
      endif
      prompt_continue
      set c = $<
      breaksw
    case "3":
      echo Savings account balance \$$SAVINGS.00
      prompt_continue
      set c = $<
      breaksw
    case "4":
      echo Checking account balance \$$CHECKING.00
      prompt_continue
      set c = $<
      breaksw
    case "5":
      clear
      echo "*** WITHDRAWAL ***"
      echo Savings account balance: \$$SAVINGS.00
      echo Checking account balance: \$$CHECKING.00
      cat << ENDOFMENU
(1) Savings
(2) Checking
(3) Quit
ENDOFMENU
      prompt_select3
      set reply = $<
      switch ($reply)
        case "1":
          echo "*** WITHDRAW FROM SAVINGS ***"
          echo Savings account balance: \$$SAVINGS.00
          echo -n "Enter the amount you wish to withdraw: "
          set amount = $<
          if ($amount > $SAVINGS) then 
            echo "Insufficient funds. Transaction not completed."
          else
            @ SAVINGS -= $amount
            echo "Transaction complete."
          endif
          prompt_continue
          set c = $<
          breaksw
        case "2":
          echo "*** WITHDRAW FROM CHECKING ***"
          echo Checking account balance: \$$CHECKING.00
          echo -n "Enter the amount you wish to withdraw: "
          set amount = $<
          if ($amount > $CHECKING) then
            echo "Insufficient funds. Transaction not completed."
          else
            @ CHECKING -= $amount
            echo "Transaction complete."
          endif
          prompt_continue
          set c = $<
          breaksw
        # case 3 and invalid input return to main menu
        default:
          breaksw
      endsw
      breaksw
    case "6":
      echo "Thank you for using the ATM system."
      exit
      breaksw
  endsw
end

