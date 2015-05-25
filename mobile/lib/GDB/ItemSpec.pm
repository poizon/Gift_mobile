package GDB::ItemSpec;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'item_specs',

    columns => [
        id       => { type => 'serial', not_null => 1 },
        name     => { type => 'varchar', length => 100 },
        descript => { type => 'varchar', length => 150 },
        item_id  => { type => 'integer' },
    ],

    primary_key_columns => [ 'id' ],
);

1;

