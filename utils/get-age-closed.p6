#!/usr/bin/env perl6

use v6;

use Text::CSV;

my @data  = "../data/issues.csv".IO.slurp.split("\n");
shift @data; # Useless first line
my @tpf = @data.grep( /closed/ );
my %closed;
my %age;
for @tpf -> $issue {
    my @issue-data = $issue.split( /\, \s* / );
    my $age = DateTime.new( @issue-data[1])  -  DateTime.new( @issue-data[3]);
    if @issue-data[2] ~~ /JJ/ {
        %age<JJ> += $age;
        %closed<JJ>++;   
    } else {
        %age<!JJ> += $age;
        %closed<!JJ>++;
    }
}

say "Author, Closed.Issues, Avg.Age";
for %closed.keys -> $n {
    say "$n,%closed{$n},", Int(%age{$n}/(%closed{$n}*86400));
}
