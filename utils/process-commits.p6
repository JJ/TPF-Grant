#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my @commits = qx/git log --format="%aE|%cI"/.map( { .split("|")} );
    say @commits;

}
