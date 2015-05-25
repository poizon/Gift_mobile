package GDB::Diler::Manager;

use strict;
use lib qw(../..);
use base qw(Rose::DB::Object::Manager);

use GDB::Diler;

sub object_class { 'GDB::Diler' }

__PACKAGE__->make_manager_methods('dilers');

1;

