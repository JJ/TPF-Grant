#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;
use Data::Dump::Tree;

my $names = ().SetHash;
my %links;
for glob("../data/issues/[1-9]*.json") -> $file {
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    CATCH {
	default {
	    say $file.IO.slurp;
	    say .backtrace;
	}
    }
    my $creator = $data<user><login>;
    $names ∪= $creator;
    %links{$creator} = %() if ! %links{$creator};
    if $data<closed_by> {
	my $closer = $data<closed_by><login>;
	$names ∪= $closer;
	%links{$creator}{$closer}++;
    }
}

my @nodes = $names.keys.map: {%(name => $^þ)};
my %inverse-mapping;

for @nodes.kv -> $idx, $val {
    %inverse-mapping{$val<name>} = $idx;
}

my %output = %( nodes => @nodes,
		links => [] );

for %links.kv -> $key, $links {
    for $links.kv -> $target, $value {
	%output<links>.push: %( source => %inverse-mapping{$key},
				target => %inverse-mapping{$target},
				value => $value );
    }
}

say to-json %output;


