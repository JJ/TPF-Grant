#!/usr/bin/env perl6

use v6;

sub MAIN( $dir = "../../../forks/perl6/doc" ) {
    chdir( $dir );
    my @commits = qx/git log --name-only --format="→%aE"/.split("→");
    my %author-file;
    my %file-author;
    for @commits -> $c {
        my ($author,$blank,@files) = $c.split("\n");
        my $nick = $author.split("\@")[0]; 
        next if !@files;
        for @files -> $f {
	    %author-file{$nick}{$f}++;
	    %file-author{$f}{$nick}++;
        }
    }


    my @author-entropy = ("Author,Entropy");
    my @author-files = ("Author,Files");
    for %author-file.keys -> $author {
        my $total = 0;
        push @author-files, "$author, {+%author-file{$author}.keys.elems}";
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
    spurt "/tmp/author-entropy.csv", @author-entropy.join("\n");
    spurt "/tmp/author-files.csv", @author-files.join("\n");

    my @file-entropy = ("File,Entropy");
    my @file-authors = ("File,Authors");
    for %file-author.keys -> $file {
        my $total = 0;
        push @file-authors, "$file, {%file-author{$file}.keys.elems}";
        
        for %file-author{$file}.keys -> $author {
            $total +=  %file-author{$file}{$author};
        }
        my $entropy = 0;
        for %file-author{$file}.keys -> $author {
            my $proportion = %file-author{$file}{$author}/$total;
            $entropy -=  $proportion * log( $proportion );
        }
        push @file-entropy:  "$file,$entropy";
    }
    spurt "/tmp/file-entropy.csv", @file-entropy.join("\n");
    spurt "/tmp/file-authors.csv", @file-authors.join("\n");
}

