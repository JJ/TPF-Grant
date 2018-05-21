#!/usr/bin/env perl6

use v6;


use IO::Glob;
use JSON::Fast;

say "Age,Label,State";
for glob("../data/issues/[1-9]*.json") -> $file {
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    with $data<closed_at> {
	if $data<closed_by><login> eq 'JJ' {
	    my $issue_number = $file ~~ /(\d+) \.json /;
	    my $date = $data<closed_at> ~~ /(\d+ \- \d+ \- \d+)/;
            my $age = DateTime.new( $data<closed_at>)  -  DateTime.new( $data<created_at>);
	    say "[$data<title>](https://github.com/perl6/doc/issues/$issue_number) |" ~
	    Int( $age/86400 ) ~ " days  | $date | ";
	}
    }
}
