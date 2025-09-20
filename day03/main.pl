#!/usr/bin/env perl
use Modern::Perl;
use FindBin;
use lib "$FindBin::Bin/..";
use File         qw( read_input );
use Data::Dumper qw(Dumper);
use Data::Printer;

my @lines   = read_input('day03/input');
my $enabled = 1;
my $total   = 0;
for my $line (@lines) {
    my @instructions = $line =~ /mul\(\d+,\d+\)|do\(\)|don't\(\)/g;
    for my $ins (@instructions) {
        if ( $ins eq "do()" ) {
            $enabled = 1;
        }
        elsif ( $ins eq "don't()" ) {
            $enabled = 0;
        }
        elsif ( $enabled && $ins =~ /mul\((\d+),(\d+)\)/ ) {
            $total += $1 * $2;
        }
    }
}

say $total

