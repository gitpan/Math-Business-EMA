package Math::Business::EMA;

require 5.005_62;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw( ) ] );
our @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT      = qw( );
our $VERSION = '0.99';

use Carp;

return 1;

sub new { 
    bless {
        EMA => 0,
        R   => 0,
        R1  => 0,
    } 
}

sub set_days { 
    my $this = shift; 
    my $arg  = int(shift);

    croak "days must be a positive non-zero integer" if $arg <= 0;

    $this->{R}  = 2.0 / (1.0 + $arg);
    $this->{R1} = (1 - $this->{R});
}

sub insert {
    my $this = shift;
    my $arg  = shift;

    croak "You must set the number of days before you try to insert" if not $this->{R};

    $this->{EMA} = $this->{EMA} ? ( $arg * $this->{R} ) + ( $this->{EMA} * $this->{R1} ) : $arg;
}

sub query {
    my $this = shift;

    return $this->{EMA};
}

__END__

=head1 NAME

Math::Business::EMA - Perl extension for calculating EMAs

=head1 SYNOPSIS

  use Math::Business::EMA;

  my $ema = new Math::Business::EMA;

  set_days $ema 3;

  insert $ema 10;
  insert $ema 13;
  insert $ema 14;

  print "The average so far is: ", $ema->query, ".\n";

=head1 AUTHOR

Jettero Heller jettero@cpan.org

http://www.voltar.org

=head1 SEE ALSO

perl(1), Math::Business::EMA(3).

=cut
