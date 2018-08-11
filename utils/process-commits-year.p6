#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my @commits = qx/git log --format="%aE|%cI"/.split("\n");
    my %commits-year;
    my %author-commits-year;
    @commits.pop; # eliminate last empty thing
    for @commits.reverse -> $c { # Process perl year
	my ($author,$date ) = $c.split("|");
	my $year = $date ~~ /^(\d+)/;
	%commits-year{$year}++;
	%author-commits-year{$year}{$author}++;
    }


    say "Year, Commits, Authors, Entropy";
    for %commits-year.keys.sort -> $m {
	my %commits-this-year = %author-commits-year{$m};
	my $entropy = 0;
	for %commits-this-year.keys -> $c {
	    my $proportion = %commits-this-year{$c}/%commits-year{$m};
	    $entropy += -$proportion*log($proportion);
	}
	say "$m-01T00:00:00, %commits-year{$m}, {+%commits-this-year.keys}, $entropy";
    }

}
