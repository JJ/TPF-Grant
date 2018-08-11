#!/usr/bin/env perl6

use v6;

# Downloads only the issue title.

use lib <../../../forks/perl6/perl6-WebService-GitHub/lib>;
use WebService::GitHub;
use WebService::GitHub::Issues;
use JSON::Tiny;

my $gh = WebService::GitHub::Issues.new;
my @all-issues = $gh.all-issues('perl6/doc');
say to-json @all-issues;
