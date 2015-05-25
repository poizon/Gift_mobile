package GDB::Diler;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'dilers',

    columns => [
        id     => { type => 'serial', not_null => 1 },
        name   => { type => 'varchar', length => 45 },
        city   => { type => 'varchar', length => 45 },
        tel    => { type => 'varchar', length => 15 },
        email  => { type => 'varchar', length => 45 },
        descript => { type => 'text', length => 65535 },
        public => { type => 'character', length => 1 },
    ],

    primary_key_columns => [ 'id' ],
);

1;

