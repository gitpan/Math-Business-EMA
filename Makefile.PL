# vi:set syntax=perl:

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'Math::Business::EMA',
    'VERSION_FROM' => 'EMA.pm',
    'PREREQ_PM'    => { Gtk => 0 },
);
