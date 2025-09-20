package File;
use Modern::Perl;
use Exporter qw(import);

our @EXPORT_OK = qw(read_input);

sub read_input {
    my $filename = shift;
    open my $fh, '<', $filename or die "Can't open $filename: $!";
    chomp( my @lines = <$fh> );    # chomp can be used in assignements
    close $fh;
    return @lines;
}

1;

