#!/usr/bin/env perl6

use v6;

use lib <../../../forks/perl6/perl6-WebService-GitHub/lib>;
use WebService::GitHub;
use WebService::GitHub::Issues;
use JSON::Fast;

die 'export GH_TOKEN' unless %*ENV<GH_TOKEN>;

my $gh = WebService::GitHub::Issues.new;
my $repo = "perl6/doc";

my @issues = $gh.show( repo => $repo, state => 'all' ).Array;
spurt "../data/issues/all.json", to-json( @issues );

my @not-downloaded;
for @issues -> $issue {
    say $issue;
    die "Limit exceeded in issue ", $issue<number>, " please use auth" if !rate-limit-remaining();
    my $this-issue = $gh.single-issue( repo => $repo, issue => $issue<number> );
    CATCH {
	default {
	    say "Problems with ", $issue<number>;
	    say .Str;
            push @not-downloaded:  $issue<number>;
	    next;
	}
    }
				   
    for $this-issue.kv -> $k, $value { # merge issues
	if ( ! $issue{$k} ) {
	    $issue{$k} = $value;
	}
    }
    spurt "../data/issues/"~$issue<number>~".json", to-json( $issue );
    
}

spurt "not-downloaded.dat", @not-downloaded;

