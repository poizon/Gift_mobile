package GDB::Item;

use strict;
use lib qw(..);
use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items',

    columns => [
        id        => { type => 'serial', not_null => 1 },
        type      => { type => 'character', length => 1 },
        cat       => { type => 'integer' },
        name      => { type => 'varchar', length => 100 },
        note      => { type => 'varchar', length => 100 },
        descript  => { type => 'text', length => 65535 },
        price     => { type => 'numeric', precision => 10, scale => 2 },
        old_price => { type => 'numeric', precision => 10, scale => 2 },
        action    => { type => 'character', length => 1 },
        popular   => { type => 'character', length => 1 },
        new_item  => { type => 'character', length => 1 },
        main_img  => { type => 'varchar', length => 45 },
    ],

    primary_key_columns => [ 'id' ],
    
    relationships => [
        cat_url => {
            class      => 'GDB::ItemsCat',
            column_map => { cat => 'id' },
            type       => 'one to one',
        },
    ]

);

1;

