#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;
use Data::Dump::Tree;

my $names = ().SetHash;
my %links;
my %type;
my %events;
for glob("../data/issues/[1-9]*.json") -> $file {
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    CATCH {
	default {
	    say $file.IO.slurp;
	    say .backtrace;
	}
    }
    %events{ $data<created_at> } = 'Open';
    if $data<closed_at> {
        %events{ $data<closed_at> } = 'Close';
    }
}

my @event-keys = %events.keys;
my @sorted-keys = @event-keys.map( { DateTime.new( $^ð ) } ).sort ;

my $open-issues = 0;
say "Time,Open Issues";
for @sorted-keys -> $time {
    if %events{$time} eq 'Open' {
        $open-issues++;
    } else {
        $open-issues--;
    }
    say "$time,$open-issues";
}




