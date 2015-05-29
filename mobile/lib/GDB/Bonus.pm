package GDB::Bonus;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'bonuses',

    columns => [
        id       => { type => 'serial', not_null => 1 },
        descript => { type => 'varchar', length => 50 },
    ],

    primary_key_columns => [ 'id' ],
    
    foreign_keys => [
        bid => {
            class       => 'GDB::ItemsBonu',
            key_columns => { id => 'bonus_id' },
        },
    ],
);

1;

