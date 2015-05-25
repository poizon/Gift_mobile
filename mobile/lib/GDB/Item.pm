package GDB::Item;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items',

    columns => [
        id        => { type => 'serial', not_null => 1 },
        type      => { type => 'character', length => 1 },
        cat       => { type => 'integer' },
        descript  => { type => 'text', length => 65535 },
        price     => { type => 'numeric', precision => 10, scale => 2 },
        old_price => { type => 'numeric', precision => 10, scale => 2 },
        action    => { type => 'character', length => 1 },
        popular   => { type => 'character', length => 1 },
        new_item  => { type => 'character', length => 1 },
    ],

    primary_key_columns => [ 'id' ],
);

1;

