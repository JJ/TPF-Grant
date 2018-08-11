#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;
use Data::Dump::Tree;

my $names = ().SetHash;
my %links;
my %type;
for glob("../data/issues/[1-9]*.json") -> $file {
    my $content =  $file.IO.slurp;
    my $data = from-json $content;
    CATCH {
	default {
	    say $file.IO.slurp;
	    say .backtrace;
	}
    }
    if $data<closed_by> {
	my $creator = $data<user><login>;
	%type{$creator}<creator>++;
	$names ∪= $creator;
	%links{$creator} = %() if ! %links{$creator};
	my $closer = $data<closed_by><login>;
	$names ∪= $closer;
	%links{$creator}{$closer}++;
	%type{$closer}<closer>++;
    }
}


my %creation-ratio;
for $names.keys -> $k {
    %type{$k}<creator> //= 0;
    %type{$k}<closer> //= 0;
    %creation-ratio{$k} = %type{$k}<creator>/( %type{$k}<creator> + %type{$k}<closer> );
}

my @nodes = $names.keys.map: {%(name => $^þ,
				group => %creation-ratio{$^þ} > 0.5 ?? "Creator" !! "Closer") };
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


