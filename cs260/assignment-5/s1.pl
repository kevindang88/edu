#!/usr/bin/perl
use strict;
print "Enter a number: ";
chomp(my $number = <STDIN>);
if ($number % 2 == 0) {
  print "Even\n";
} else {
  print "Odd\n";
}
