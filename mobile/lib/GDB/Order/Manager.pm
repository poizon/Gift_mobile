package GDB::Order::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::Order;

sub object_class { 'GDB::Order' }

__PACKAGE__->make_manager_methods('orders');

1;

