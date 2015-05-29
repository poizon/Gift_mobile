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
    
    relationships => [
        bid => {
            class      => 'GDB::Bonus',
            column_map => { bonus_id => 'id' },
            type       => 'one to one',
        },
    ]
        
);

1;

