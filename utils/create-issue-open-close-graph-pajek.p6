#!/usr/bin/env perl6

use v6;

use IO::Glob;
use JSON::Fast;
use Data::Dump::Tree;

my $names = ().SetHash;
my %links;
my %type;
for glob("../data/issues/*.json") -> $file {
    next if $file ~~ /all/;
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

say "*Vertices ", @nodes.elems;

for @nodes.kv -> $idx, $val {
    my $n = $idx + 1;
    %inverse-mapping{$val<name>} = $n;
    say "$n \"$val<name>\" $val<group>";
}

say "*arcs";
for %links.kv -> $key, $links {
    for $links.kv -> $target, $value {
	say "%inverse-mapping{$key} %inverse-mapping{$target} $value ";
    }
}




