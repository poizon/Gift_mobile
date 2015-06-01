package GDB::Item;

use strict;

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

    foreign_keys => [
        items_cat => {
            class       => 'GDB::ItemsCat',
            key_columns => { cat => 'id' },
        },
    ],

    relationships => [
        bonus_objs => {
            map_class => 'GDB::ItemsBonu',
            map_from  => 'item',
            map_to    => 'bonus',
            type      => 'many to many',
        },

        card => {
            class      => 'GDB::Card',
            column_map => { id => 'item_id' },
            type       => 'one to many',
        },

        items_images => {
            class      => 'GDB::ItemsImage',
            column_map => { id => 'item_id' },
            type       => 'one to many',
        },

        items_related => {
            class      => 'GDB::ItemsRelated',
            column_map => { id => 'relate_id' },
            type       => 'one to many',
        },

        items_specs => {
            class      => 'GDB::ItemsSpec',
            column_map => { id => 'item_id' },
            type       => 'one to many',
        },
    ],
);

1;

