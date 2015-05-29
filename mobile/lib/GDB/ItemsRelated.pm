package GDB::ItemsRelated;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'items_related',

    columns => [
        id        => { type => 'serial', not_null => 1 },
        relate_id => { type => 'integer' },
        item_id   => { type => 'integer' },
    ],

    primary_key_columns => [ 'id' ],
);

1;

