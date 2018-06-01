#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my @commits = qx/git log --format="%aE|%cI"/.split("\n");
    my %commits-month;
    my %author-commits-month;
    @commits.pop; # eliminate last empty thing
    for @commits.reverse -> $c { # Process perl month
	my ($author,$date ) = $c.split("|");
	my $month = $date ~~ /^(\d+ \- \d+)/;
	%commits-month{$month}++;
	%author-commits-month{$month}{$author}++;
    }


    say "Month, Commits, Authors, Entropy";
    for %commits-month.keys.sort -> $m {
	my %commits-this-month = %author-commits-month{$m};
	my $entropy = 0;
	for %commits-this-month.keys -> $c {
	    my $proportion = %commits-this-month{$c}/%commits-month{$m};
	    $entropy += -$proportion*log($proportion);
	}
        $entropy /= +%commits-this-month.keys;
	say "$m-01T00:00:00, %commits-month{$m}, {+%commits-this-month.keys}, $entropy";
    }

}
