#!/usr/bin/env perl

use v5.14;

while (<>) {
  my ($n) = /(\d+).json/;
  say $n;
}
