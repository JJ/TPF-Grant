#!/usr/bin/env perl6

use v6;

say "Date, State";
say "../data/travis-builds.dat".IO.lines.map( * ~~ /^(.+) \s+ '#' \d+ \s+ (\w+) \: / ).map( { $^þ[0] ~ ", ", $^þ[1] } ).join("\n").reverse;

