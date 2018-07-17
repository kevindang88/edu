#!/bin/csh

# Initial balances
# Need to use 'set' syntax to assign values to variables
set SAVINGS=1000
set CHECKING=1000

# C-shell doesn't have functions
# Using aliases for single-line commands
# Must escape <, >, (, ) characters from strings
alias prompt_continue echo "\<Press Enter to continue\>"
alias prompt_select6 echo "==\> Please select option \(1-6\): "

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
set valid=0
while ( 1 )
  clear
  echo "*** Welcome to Cal Poly's ATM System ***"
   
end
