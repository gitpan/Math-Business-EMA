print "1..11\n";

use Math::Business::EMA;

$e = new Math::Business::EMA or print "not ";
print "ok 1\n";

set_days $e 3;
print "ok 2\n";

$e->query == 0 or print "not ";
print "ok 3\n";

for(4..10) {
    $e->insert($_);
    print "ok $_\n";
}

$e->query == 9.015625 or print "not ";
print "ok 11\n";
