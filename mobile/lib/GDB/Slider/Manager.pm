package GDB::Slider::Manager;

use strict;
use lib qw(../..);
use base qw(Rose::DB::Object::Manager);

use GDB::Slider;

sub object_class { 'GDB::Slider' }

__PACKAGE__->make_manager_methods('sliders');

1;

