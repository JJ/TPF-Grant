#!/usr/bin/env perl6

use v6;
use Text::CSV;

my $csv = Text::CSV.new;
my $io = open "../data/issues.csv", :r;
my @data = $csv.getline_all($io);

dd @data;
