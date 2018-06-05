#!/usr/bin/env perl6

use v6;

my @issues = "../data/issues-month.csv".IO.lines;
shift @issues;
my %issues;
for @issues -> $m {
    my @m = $m.split(",");
    %issues{ @m[0] } = %( open => @m[1], closed => @m[2] );
}


my @commits = "../data/commits.csv".IO.lines;

shift @commits;
my %commits;
for @commits -> $m {
    my @m = $m.split(", ");
    %commits{ @m[0].substr(0,7) } =  %( commits => @m[1], authors => @m[2] );
}

my @keys = (%issues.keys ∪ %commits.keys).keys;

say "Month, Issues, Commits";
for @keys.sort -> $k {
    say "$k, ",
      %issues{ $k }:exists ?? %issues{ $k }<open> !! 0, ", ",
      %commits{ $k }:exists ?? %commits{ $k }<commits> !! 0;
}
    

