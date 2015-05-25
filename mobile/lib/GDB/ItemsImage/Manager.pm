package GDB::ItemsImage::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use GDB::ItemsImage;

sub object_class { 'GDB::ItemsImage' }

__PACKAGE__->make_manager_methods('items_images');

1;

