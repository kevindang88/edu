#!/usr/bin/perl

if (@ARGV != 1) {
  print "Usage: s3m score\n";
  exit;
}

my $score = @ARGV[0];

if ($score < 0 || $score > 100) {
  print "Invalid score.\n";
  exit;
} elsif ($score >= 90) {
  print "you got A\n";
} elsif ($score >= 80) {
  print "you got B\n";
} elsif ($score >= 70) {
  print "you got C\n";
} elsif ($score >= 60) {
  print "you got D\n";
} else {
  print "you failed\n";
}
