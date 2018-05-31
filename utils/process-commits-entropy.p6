#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my @commits = qx/git log --name-only --format="→%aE"/.split("→");
    my %author-file;
    my %file-author;
    for @commits -> $c {
        my ($author,$blank,@files) = $c.split("\n");
        for @files -> $f {
	    %author-file{$author}{$f}++;
	    %file-author{$f}{$author}++;
        }
    }

    say %author-file;
    say %file-author;

    my @author-entropy = ("Author,Entropy");
    for %author-file.keys -> $author {
        my $total = 0;
        for %author-file{$author}.keys -> $file {
            $total +=  %author-file{$author}{$file};
        }
        my $entropy = 0;
        for %author-file{$author}.keys -> $file {
            my $proportion = %author-file{$author}{$file}/$total;
            $entropy -=  $proportion * log( $proportion );
        }
        push @author-entropy:  "$author,$entropy";
    }
    spurt "../data/author-entropy.csv", @author-entropy.join("");

    my @file-entropy = ("File,Entropy");
    for %file-author.keys -> $file {
        my $total = 0;
        for %file-author{$file}.keys -> $author {
            $total +=  %file-author{$file}{$author};
        }
        my $entropy = 0;
        for %file-author{$file}.keys -> $author {
            my $proportion = %file-author{$file}{$author};
            $entropy -=  $proportion * log( $proportion );
        }
        push @file-entropy:  "$file,$entropy";
    }
    spurt "../data/file-entropy.csv", @author-entropy.join("");
}

