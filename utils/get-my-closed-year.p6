#!/usr/bin/env perl6

use v6;

use Text::CSV;

my $csv = Text::CSV.new;
my $io  = open "../data/issues.csv", :r, chomp => False;
my @data = $csv.getline_all($io);

my @tpf = @data.grep( /closed/ );
my %closed;
for @tpf -> @issue {
    my $year = ( @issue[3] ~~ /\s+(\d+) \- \d+/ );
    if @issue[2] ~~ /JJ/ {
        %closed{~$year[0]}++;
    }
}

say "year, issues";
for %closed.keys.sort -> $y {
    say "$y, %closed{$y}";
}
