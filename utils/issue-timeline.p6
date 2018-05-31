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
my (%issues-open,%issues-closed);

my @open-issues = ( "Time,Open Issues" );
for @sorted-keys -> $time {
    my $year-month = $time ~~ /(\d ** 4 \- \d ** 2)/;
    if %events{$time} eq 'Open' {
        $open-issues++;
        %issues-open{$year-month}++;
    } else {
        $open-issues--;
        %issues-closed{$year-month}++;
    }
    @open-issues.push: "$time,$open-issues";
}
spurt("../data/issues-timeline.csv", @open-issues.join("\n"));

my @keys = (%issues-open.keys ∪ %issues-closed.keys).list;
my @issues-month=("Month,Open,Closed");
for @keys.keys.sort -> $m {
    %issues-open{$m} //= 0;
    %issues-closed{$m} //= 0;
    push @issues-month,
      "$m," ~  %issues-open{$m} ~ "," ~  %issues-closed{$m} // 0;
}
spurt( "../data/issues-month.csv", @issues-month.join("\n") );



