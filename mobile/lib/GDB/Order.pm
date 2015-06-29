package GDB::Order;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'orders',

    columns => [
        id        => { type => 'serial', not_null => 1 },
        name      => { type => 'varchar', length => 45 },
        surname   => { type => 'varchar', length => 45 },
        email     => { type => 'varchar', length => 50 },
        tel       => { type => 'varchar', length => 15 },
        comment   => { type => 'text', length => 65535 },
        pay       => { type => 'varchar', length => 2 },
        packet_id => { type => 'integer' },
        status    => { type => 'character', length => 1 },
    ],

    primary_key_columns => [ 'id' ],
);

1;

