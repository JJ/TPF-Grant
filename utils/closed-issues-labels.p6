#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;

say "Age,Label";
for glob("../data/issues/[1-9]*.json") -> $file {
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    if $data<closed_at> {
        my $age = DateTime.new( $data<closed_at>)  -  DateTime.new( $data<created_at>);
        next if !$data<labels>.elems;
        my @labels =  $data<labels>.Array;
        for @labels -> $label {
            my %hash = $label.Hash;
            say "$age,{%hash<name>}";
        }
    }
}


