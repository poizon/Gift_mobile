package GDB::Bonus::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::Bonus;

sub object_class { 'GDB::Bonus' }

__PACKAGE__->make_manager_methods('bonuses');

1;

