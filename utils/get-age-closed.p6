#!/usr/bin/env perl6

use v6;

use Text::CSV;

my $csv = Text::CSV.new;
my $io  = open "../data/issues.csv", :r, chomp => False;
my @data = $csv.getline_all($io);
say @data.elems;
my @tpf = @data.grep( /closed/ );
my %closed;
my %age;
shift @tpf; # Eliminates first issue
for @tpf -> @issue {
    say @issue;
    my $age = DateTime.new( trim-leading(@issue[1]) ) -  DateTime.new( trim-leading(@issue[3]));
    say $age;
    if @issue[2] ~~ /JJ/ {
        %age<JJ> += $age;
        %closed<JJ>++;   
    } else {
        %age<!JJ> += $age;
        %closed<!JJ>++;
    }
}

say "Author, Closed.Issues, Avg.Age";
for %closed.keys -> $n {
    say "$n,%closed{$n},", %age{$n}/%closed{$n};
}
