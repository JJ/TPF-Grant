#!/usr/bin/env perl6

use v6;

use Text::CSV;

my $csv = Text::CSV.new;
my $io  = open "../data/issues.csv", :r, chomp => False;
my @data = $csv.getline_all($io);

my @tpf = @data.grep( /closed/ ).grep( { /2018\-0[3||4||5]/ } );
my %closed;
for @tpf -> @issue {
    my $month = ( @issue[1] ~~ /\s+(\d+\-\d+)/ );
    if @issue[2] ~~ /JJ/ {
        %closed{$month}<JJ>++;
    } else {
        %closed{$month}<!JJ>++;
    }
}

say "Month, Closed.Issues, Author";
for %closed.keys.sort -> $m {
    for <JJ !JJ> -> $author {
	say "$m-01T00:00:00, %closed{$m}{$author}, $author";
    }                    
}
