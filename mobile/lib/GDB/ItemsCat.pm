package GDB::ItemsCat;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items_cat',

    columns => [
        id       => { type => 'serial', not_null => 1 },
        sub_id   => { type => 'integer', default => '0' },
        type     => { type => 'character', length => 1 },
        descript => { type => 'varchar', length => 45 },
        chpurl   => { type => 'varchar', length => 45 },
    ],

    primary_key_columns => [ 'id' ],

    unique_key => [ 'chpurl' ],

    relationships => [
        items => {
            class      => 'GDB::Item',
            column_map => { id => 'cat' },
            type       => 'one to many',
        },
    ],
);

1;

