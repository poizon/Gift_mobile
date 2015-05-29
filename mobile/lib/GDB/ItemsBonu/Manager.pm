package GDB::ItemsBonu::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::ItemsBonu;

sub object_class { 'GDB::ItemsBonu' }

__PACKAGE__->make_manager_methods('items_bonus');

1;

