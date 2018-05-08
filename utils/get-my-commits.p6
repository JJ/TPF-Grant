#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my @commits = qx/git log --format="%aE|%cI"/.split("\n");
    my %commits-month;
    @commits.pop; # eliminate last empty thing
    for @commits.reverse -> $c { # Process perl month
	my ($author,$date ) = $c.split("|");
	my $month = $date ~~ /^(\d+ \- \d+)/;
        next unless $month eq ("2018-04" | "2018-05");
        if $author ~~ /jjmerelo/  {
	    %commits-month{$month}<JJ>++;
        } else {
            %commits-month{$month}<!JJ>++;
        }
    }

    say "Month, Commits, Author";
    for %commits-month.keys.sort -> $m {
        for <JJ !JJ> -> $author {
	    say "$m-01T00:00:00, %commits-month{$m}{$author}, $author";
        }                    
    }

}
