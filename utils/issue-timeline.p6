#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;
use Data::Dump::Tree;

my $names = ().SetHash;
my %links;
my %type;
my @opens;
my @closes;
for glob("../data/issues/[1-9]*.json") -> $file {
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    CATCH {
	default {
	    say $file.IO.slurp;
	    say .backtrace;
	}
    }
    @opens.push: $data<created_at>;
    if $data<closed_at> {
        @closes.push: $data<closed_at>;
    }
}

say @closes;
my @sorted-closes = @closes.map( { Date.new( $^ð.split("T")[0] ) } ).sort ;
say @sorted-closes;



