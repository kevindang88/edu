#!/bin/sh
echo -e "Enter two integers: \c"
read int1 int2
echo `expr $int1 + $int2`
