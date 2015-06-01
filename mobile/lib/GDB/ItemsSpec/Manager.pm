package GDB::ItemsSpec::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::ItemsSpec;

sub object_class { 'GDB::ItemsSpec' }

__PACKAGE__->make_manager_methods('items_specs');

1;

