print "1..13\n";

use Math::Business::EMA;

$e = new Math::Business::EMA or print "not ";
print "ok 1\n";

set_days $e 3;
print "ok 2\n";

for(3..13) {
    $e->insert($_);
    print "ok $_\n";
}
