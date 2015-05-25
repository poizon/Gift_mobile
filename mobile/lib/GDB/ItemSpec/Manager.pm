package GDB::ItemSpec::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::ItemSpec;

sub object_class { 'GDB::ItemSpec' }

__PACKAGE__->make_manager_methods('item_specs');

1;

