#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;

say "Age,Label,State";
for glob("../data/issues/[1-9]*.json") -> $file {
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    my ($state,$age);
    if $data<closed_at> {
        $age = DateTime.new( $data<closed_at>)  -  DateTime.new( $data<created_at>);
        $state = 'closed';
    } else {
        $age = DateTime.now  -  DateTime.new( $data<created_at>);
        $state = 'open';
    }

    my @labels;
    if $data<labels>.elems {
        @labels =  $data<labels>.Array;
    } else {
        @labels = [ name => 'NO-LABEL'];        
    }
    
    for @labels -> $label {
        my %hash = $label.Hash;
        say "$age,{%hash<name>},$state";
    }
}


