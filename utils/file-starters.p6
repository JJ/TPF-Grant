#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my $dirs = $dir ~~ m:g{\/ (\w+) \/ (\w+) $$};
    my $prefix = $dirs ?? $dirs[0].join("-") ~ "-" !! "data-";
    my @current-files = qx/git ls-files/.split("\n");

    my %created;
    for @current-files -> $file {
        CATCH {
	    default {
	        say "Error in $file";
	        say .backtrace;
	    }
        }
        my $created = qqx/git log --diff-filter=A -- $file/;
        my $author = $created ~~ /\< (.+?) \> /;
        say $author;
        %created{$author}++;
    }

    for %created.sort: - *.value  {
       say $_.key, ", ", $_.value;
    }

}

