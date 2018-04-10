#!/usr/bin/env perl6

use v6;

use lib <../../../forks/perl6/perl6-WebService-GitHub/lib>;
use WebService::GitHub;
use WebService::GitHub::Issues;
use JSON::Fast;

die 'export GH_TOKEN' unless %*ENV<GH_TOKEN>;

my $gh = WebService::GitHub::Issues.new;
my $repo = "perl6/doc";
my $issues-text = "not-downloaded.dat".IO.slurp;

my @issues = ($issues-text ~~ m:g/(\d+)/).map(  *.[0].Int  );
say @issues;

for @issues -> $issue {
    say $issue;
    die "Limit exceeded in issue ", $issue, " please use auth" if !rate-limit-remaining();
    my $this-issue = $gh.single-issue( repo => $repo, issue => $issue );
    CATCH {
	default {
	    say "Problems with ", $issue;
	    say .Str;
	    next;
	}
    }
				   
    spurt "../data/issues/"~$issue~".json", to-json( $this-issue );
    
}
