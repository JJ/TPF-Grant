#!/usr/bin/env perl6

use v6;


sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    my $orig-dir = $*CWD;
    chdir( $dir );
    my @commits = reverse qx/git log --format="%aE|%cI"/.split("\n");
    my @intervals100 = "Days";
    my @intervals1k = "Days";
    @commits = @commits[1..*];
    my $last100 = get-date(@commits[0]);
    my $last1k = get-date(@commits[0]);
    loop (my $i = 100; $i < @commits.elems; $i += 100 ) {
        my $this-date = get-date( @commits[$i] );
        @intervals100.push: ($this-date - $last100)/86400;
        $last100 = $this-date;
        if ( $i %% 1000 ) {
            @intervals1k.push: ($this-date - $last1k)/86400;
            $last1k = $this-date;
        }
    }

    chdir( $orig-dir);
    spurt("../data/100commit-interval.csv", join("\n",  @intervals100));
    spurt("../data/1kcommit-interval.csv", join("\n",  @intervals1k));


}

sub get-date( $commit ) {
    my ($author,$date ) = $commit.split("|");
    return DateTime.new($date).Instant;
}
