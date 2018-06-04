#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;


my @data;
say "author_association, closed_at, closer, created_at, created_by, state";
for glob("../data/issues/*.json") -> $file {
    next if $file ~~ /all.json/;
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    CATCH {
	default {
	    say $file.IO.slurp;
	    say .backtrace;
	}
    }
    my %this-issue;
    for <author_association created_at state closed_at> -> $key {
	%this-issue{$key} = $data{$key} ?? $data{$key} !! "";
    }
    %this-issue<created_by> =  $data<user><login>;
    %this-issue<closer> = $data<closed_by> ?? $data<closed_by><login> !! "";

    my @values;
    for %this-issue.keys.sort -> $k {
	@values.push: %this-issue{$k};
    }
    say @values.join(", ");
    
}
