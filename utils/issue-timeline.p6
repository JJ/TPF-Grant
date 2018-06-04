#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;
use Data::Dump::Tree;

my $names = ().SetHash;
my %links;
my %type;
my %events;
for glob("../data/issues/*.json") -> $file {
    next if $file ~~ /all.json/;
    my $issue;
    with $file ~~ /(\d+) \.json / {
        $issue = ~$0;
    }
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    CATCH {
	default {
	    say $file.IO.slurp;
	    say .backtrace;
	}
    }
    %events{ $data<created_at> } = ['Open',$issue];
    if $data<closed_at> {
        %events{ $data<closed_at> } = ['Close',$issue];
    }
}

my @event-keys = %events.keys;
my @sorted-keys = @event-keys.map( { DateTime.new( $^ð ) } ).sort ;

my $open-issues = 0;
my (%issues-open,%issues-closed);

my @open-issues = ( "Time,Open Issues,Average Age" );
my %open-so-far;
for @sorted-keys -> $time {
    my $total-age;
    my $average-age;
    if +%open-so-far.keys > 0 {
        for %open-so-far.keys -> $issue {
            $total-age += $time - %open-so-far{$issue};
        }
        $average-age = ($total-age / +%open-so-far.keys)/86400;
    } else {
        $average-age = 0;
    }

    my $year-month = $time ~~ /(\d ** 4 \- \d ** 2)/;
    my $issue = %events{$time}[1];
    say "Issue # ", $issue, " , ", %events{$time};
    if %events{$time}[0] eq 'Open' {
        $open-issues++;
        %issues-open{$year-month}++;
        %open-so-far{$issue} = $time;
    } else {
        $open-issues--;
        %issues-closed{$year-month}++;
        %open-so-far{$issue}:delete;
        say %open-so-far.elems;
    }
    @open-issues.push: "$time,$open-issues,$average-age";
}
spurt("../data/issues-timeline.csv", @open-issues.join("\n"));

my $keys = %issues-open.keys ∪ %issues-closed.keys;
my @issues-month=("Month,Open,Closed");
for $keys.keys.sort -> $m {
    %issues-open{$m} //= 0;
    %issues-closed{$m} //= 0;
    push @issues-month,
      "$m," ~  %issues-open{$m} ~ "," ~  %issues-closed{$m} // 0;
}
spurt( "../data/issues-month.csv", @issues-month.join("\n") );



