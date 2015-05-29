package GDB::ItemsRelated::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::ItemsRelated;

sub object_class { 'GDB::ItemsRelated' }

__PACKAGE__->make_manager_methods('items_related');

1;

