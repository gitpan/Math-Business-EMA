#!/usr/bin/perl -w

use Gtk;         # load the Gtk-Perl module
use strict;      # a good idea for all non-trivial Perl scripts

init       Gtk;  # initialize Gtk-Perl
set_locale Gtk;  # internationalize

my $window = new Gtk::Window( "toplevel" );
my $button = new Gtk::Button( "execute" );
my $vbox   = new Gtk::VBox( 0, 0 );
my $hbox   = new Gtk::HBox( 0, 0 );
my $combo  = new Gtk::Combo;
my $pull   = new Gtk::Combo;
my $clist  =     Gtk::CList->new_with_titles("Name", "Penis size", "Foot size");
my $scroll = new Gtk::ScrolledWindow(undef, undef);

my $shown = 0;

set_policy $scroll "automatic", "always";
add        $scroll $clist;

pack_start $hbox $combo,  (1, 1, 2);
pack_start $hbox $button, (0, 0, 2); # ( I grow, It grows, I pad)

pack_start $vbox $scroll, (1, 1, 2);
pack_start $vbox $hbox,   (0, 0, 2);

set_column_width $clist 0, 50;
set_column_width $clist 1, 50;
set_column_width $clist 2, 50;

show $clist;
show $vbox;

show $button;
show $combo;
show $hbox;

border_width $window 7;
add          $window $vbox;
show         $window;

$window->signal_connect( "delete_event", \&CloseAppWindow);
$button->signal_connect( "clicked",      \&ReadInput);

main Gtk;

sub CloseAppWindow { Gtk->exit(0) }

sub ReadInput {
    my $o = $combo->entry->get_text; 
    my $t = $o;
       $t =~ s/\s+//g;
    my @a = split /\W/, $t;

    if(@a == 3) {
        if(not $shown) {
            set_usize $window 240, 200;
            show $scroll;
            $shown = 1;
        }
        for(1..10) {
            append $clist "$a[0]-$_", @a[1..$#a];
        }
    }

    push @{ $combo->{list} }, $o for(1..10);
    set_popdown_strings $combo @{ $combo->{list} };

    $combo->entry->set_text("");
}
