#!/usr/bin/env perl6

use v6;


my $content = "../data/issues-table.md".IO.slurp;
my @issues = $content.split(/\n/);
my $month = $*ARGS[0] // "2018-04";
my %issues;
for @issues.grep( /$month/) -> $issue {
    my @items = $issue.split( /\s+\|\s*/);
    %issues{@items[0]} = [ @items[1], @items[2] ];
}

say %issues.kv[0].perl;
my @sorted-keys = %issues.keys.sort( { Date.new( %issues{$^a}[1] )
				       <=> Date.new( %issues{$^b}[1] ) });

for @sorted-keys -> $k {
    say "$k | %issues{$k}[0] | %issues{$k}[1] | ";
}
