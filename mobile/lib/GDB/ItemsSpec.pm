package GDB::ItemsSpec;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items_specs',

    columns => [
        id       => { type => 'serial', not_null => 1 },
        name     => { type => 'varchar', length => 100 },
        descript => { type => 'varchar', length => 150 },
        item_id  => { type => 'integer' },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        item => {
            class       => 'GDB::Item',
            key_columns => { item_id => 'id' },
        },
    ],
);

1;

