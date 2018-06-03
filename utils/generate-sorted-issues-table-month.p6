#!/usr/bin/env perl6

use v6;


my $content = "../report/closed-issues-all.md".IO.slurp;
my @issues = $content.split(/\n/);
my $month = @*ARGS[0] // "2018-05";
my %issues;
for @issues.grep( /$month/) -> $issue {
    my @items = $issue.split( /\s+\|\s*/);
    %issues{@items[0]} = [ @items[2], $issue ];
}

my @sorted-keys = %issues.keys.sort( { Date.new( %issues{$^a}[0] )
				       <=> Date.new( %issues{$^b}[0] ) });

for @sorted-keys -> $k {
    say %issues{$k}[1];
}
