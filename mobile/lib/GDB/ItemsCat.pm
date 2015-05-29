package GDB::ItemsCat;

use strict;
use lib qw(..);
use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items_cat',

    columns => [
        id       => { type => 'serial', not_null => 1 },
        sub_id   => { type => 'serial', default => 0 },
        type     => { type => 'character', length => 1 },
        descript => { type => 'varchar', length => 45 },
        chpurl => { type => 'varchar', length => 45 },
    ],

    primary_key_columns => [ 'id' ],
    unique_key => [ 'chpurl' ],
    
    foreign_keys => [
        cat_url => {
            class       => 'GDB::Item',
            key_columns => { id => 'cat' },
        },
    ],
     
);

1;

