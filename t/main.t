# vi:syntax=perl:

use strict;
use Test;

plan tests => 6;

use Math::Business::EMA; ok 1;

my $ema = new Math::Business::EMA;

$ema->set_days(3); # r = 2.0 / (1.0 + 3) = 0.5; r1 = (1 - r) = 0.5

$ema->insert( 3 ); ok !defined($ema->query);
$ema->insert( 4 ); ok !defined($ema->query);
$ema->insert( 5 ); ok 4 == $ema->query;

$ema->insert( 6 ); ok 5 == $ema->query; # (6 * 0.5) + (4 * 0.5)
$ema->insert( 7 ); ok 6 == $ema->query; # (7 * 0.5) + (5 * 0.5)
