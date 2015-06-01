package GDB::ItemsImage;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items_images',

    columns => [
        id        => { type => 'serial', not_null => 1 },
        item_id   => { type => 'integer' },
        main      => { type => 'character', length => 1 },
        descript  => { type => 'varchar', length => 50 },
        image_url => { type => 'varchar', length => 50 },
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

