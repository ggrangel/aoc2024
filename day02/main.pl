#!/usr/bin/env perl
use Modern::Perl;
use Data::Printer;
use List::Util qw( all sum );
use FindBin;
use lib "$FindBin::Bin/..";
use File qw( read_input );

sub is_safe {
    my @report       = split /\s+/, shift;
    my $remove_index = shift;
    if ( $remove_index != -1 ) {
        splice @report, $remove_index, 1;
    }

    my @diffs = map { $report[ $_ + 1 ] - $report[$_] } 0 .. $#report - 1;

    my $all_pos     = all { $_ > 0 } @diffs;
    my $all_neg     = all { $_ < 0 } @diffs;
    my $valid_range = all { abs($_) >= 1 && abs($_) <= 3 } @diffs;

    return ( $all_pos || $all_neg ) && $valid_range;
}

my @lines = read_input('day02/input');

my $safe_count = sum map { is_safe( $_, -1 ) } @lines;

p $safe_count;

my @safe_dampeners = (0) x @lines;

for my $i ( 0 .. $#lines ) {
    my $report       = $lines[$i];
    my @report_array = split /\s+/, $report;

    for my $j ( -1 .. $#report_array ) {
        my $safe = is_safe( $report, $j );
        if ($safe) {
            $safe_dampeners[$i] = 1;
            last;
        }
    }
}

say sum @safe_dampeners;

