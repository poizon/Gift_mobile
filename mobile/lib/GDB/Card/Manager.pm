package GDB::Card::Manager;

use strict;
#use Data::Dumper;
use base qw(Rose::DB::Object::Manager);
use lib qw(../..);
use GDB::Card;

sub object_class { 'GDB::Card' }

__PACKAGE__->make_manager_methods('card');

#sub  get_card_max {
#    my ($class, %args) = @_;
#    print Dumper(%args);
#    my $db = GDB::DB::Object::AutoBase2->init_db;
#    my $sth = $db->dbh->prepare( qq{SELECT IFNULL(MAX(packet_id)+1,1) FROM giftec_site.card} );
#    $sth->execute;
#    my @t = $sth->fetchrow_array;
#    $sth->finish;
#    return $t[1];
#}

1;

