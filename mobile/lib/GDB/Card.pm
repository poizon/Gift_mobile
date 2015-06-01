package GDB::Card;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'card',

    columns => [
        id        => { type => 'serial', not_null => 1 },
        packet_id => { type => 'integer' },
        item_id   => { type => 'integer' },
        qty       => { type => 'numeric', precision => 10, scale => '0' },
        status    => { type => 'character', length => 1 },
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

