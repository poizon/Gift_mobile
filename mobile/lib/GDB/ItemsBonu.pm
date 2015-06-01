package GDB::ItemsBonu;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items_bonus',

    columns => [
        id       => { type => 'serial', not_null => 1 },
        bonus_id => { type => 'integer' },
        item_id  => { type => 'integer' },
    ],

    primary_key_columns => [ 'id' ],

    foreign_keys => [
        bonus => {
            class       => 'GDB::Bonus',
            key_columns => { bonus_id => 'id' },
        },

        item => {
            class       => 'GDB::Item',
            key_columns => { item_id => 'id' },
        },
    ],
);

1;

