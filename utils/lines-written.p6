#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my $dirs = $dir ~~ m:g{\/ (\w+) \/ (\w+) $$};
    my $prefix = $dirs ?? $dirs[0].join("-") ~ "-" !! "data-";
    my @current-files = qx/git ls-files/.split("\n");

    my %lines;
    for @current-files -> $file {
        CATCH {
	    default {
	        say "Error in $file";
	        say .backtrace;
	    }
        }
        next if $file ~~ /\.svg | \.png | \.ico/;
        next if $file !~~ /\w+/;
        my $blame = qqx/git blame -e $file/;
        for $blame.split("\n") -> $line {
            CATCH {
	        default {
	            say "Error in $file and $line";
	            say .backtrace;
	        }
            }
            next if $line !~~ /\w+/;
            my $person = $line ~~ /\< ( [\w | \. | \- | \+ ] +) \@ /;
            if !$person {
                say $line if !$person;
            } else {
                %lines{ ~$person[0] }++;
            }
        }

    }

    for %lines.sort: *.value  {
       say $_.key, ", ", $_.value;
    }

}

