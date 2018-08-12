#!/usr/bin/env perl

use v5.14;

# Use with ls -alt ../data/issues | grep jul | perl get-from-dir.pl > not-downloaded.dat

while (<>) {
  my ($n) = /(\d+).json/;
  say $n;
}
