package GDB::Item::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::Item;

sub object_class { 'GDB::Item' }

__PACKAGE__->make_manager_methods('items');

1;

