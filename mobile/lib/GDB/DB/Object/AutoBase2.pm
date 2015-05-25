package GDB::DB::Object::AutoBase2;

use base 'Rose::DB::Object';

use GDB::DB::AutoBase1;

sub init_db { GDB::DB::AutoBase1->new }

1;
