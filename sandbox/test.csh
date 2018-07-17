#!/bin/csh
set a=5
alias show_a echo a is $a

@ a += 10
echo a is $a
show_a
