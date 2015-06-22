package GDB::Card::Manager;

use strict;
#use Data::Dumper;
use base qw(Rose::DB::Object::Manager);
use lib qw(../..);
use GDB::Card;

sub object_class { 'GDB::Card' }

__PACKAGE__->make_manager_methods('card');

1;

