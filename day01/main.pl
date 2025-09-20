#!/usr/bin/perl
use Modern::Perl;
use Data::Printer;
use List::Util qw( sum );

sub read_input {
    my $filename = shift;
    open my $fh, '<', $filename or die "Can't open $filename: $!";
    chomp( my @lines = <$fh> );    # chomp can be used in assignements
    close $fh;
    return @lines;
}

sub parse_two_columns {
    my @lines = @_;
    my ( @left, @right );

    for my $line (@lines) {
        my ( $l, $r ) = split /\s+/, $line;
        push @left,  $l;
        push @right, $r;
    }

    return ( \@left, \@right );
}

my @lines = read_input('input');
my ( $left, $right ) = parse_two_columns(@lines);

my $left_sorted  = [ sort { $a <=> $b } @$left ];
my $right_sorted = [ sort { $a <=> $b } @$right ];

my $total =
  sum( map { abs( $left_sorted->[$_] - $right_sorted->[$_] ) } 0 .. $#$left );

print "Total difference: $total\n";

my %right_count;
$right_count{$_}++ for @$right;

# my $score =
#   sum map { $left->[$_] * ( $right_count{ $left->[$_] } || 0 ) } 0 .. $#$left;

my $score = sum map { $_ * ( $right_count{$_} || 0 ) } @$left;

p $score

