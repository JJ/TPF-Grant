#!/usr/bin/env perl6

use WebService::GitHub;
use WebService::GitHub::Issues;
use JSON::Tiny;

my $gh = WebService::GitHub::Issues.new;
my @all-issues = $gh.all-issues('perl6/doc');
say to-json @all-issues;
