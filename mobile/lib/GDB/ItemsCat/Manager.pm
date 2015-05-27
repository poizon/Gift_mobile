package GDB::ItemsCat::Manager;

use strict;
use lib qw(../..);
use base qw(Rose::DB::Object::Manager);

use GDB::ItemsCat;

sub object_class { 'GDB::ItemsCat' }

__PACKAGE__->make_manager_methods('items_cat');


1;

