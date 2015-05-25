package GDB::Slider;

use strict;

use base qw(GDB::DB::Object::AutoBase2);

__PACKAGE__->meta->setup(
    table   => 'sliders',

    columns => [
        id         => { type => 'serial', not_null => 1 },
        image_url  => { type => 'varchar', length => 50 },
        source_url => { type => 'varchar', length => 100 },
        public     => { type => 'character', length => 1 },
        descript   => { type => 'varchar', length => 100 },
    ],

    primary_key_columns => [ 'id' ],
);

1;

