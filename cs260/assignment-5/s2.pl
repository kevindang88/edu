#!/usr/bin/perl
use strict;

my $valid = 0;
while ($valid != 1) {
  print "Are you OK? ";
  my $reply = <STDIN>;
  chomp($reply);
  if ($reply eq "y" || $reply eq "Y") {
    $valid = 1;
    print "glad to hear it\n";
  } elsif ($reply eq "n" || $reply eq "N") {
    $valid = 1;
    print "sorry that you are not feeling good\n";
  } else {
    print "in-correct choice\n";
  }
}
