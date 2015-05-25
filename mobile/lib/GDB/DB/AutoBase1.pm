package GDB::DB::AutoBase1;

use strict;

use base 'Rose::DB';

__PACKAGE__->use_private_registry;

__PACKAGE__->register_db
(
  connect_options => { AutoCommit        => 1, ChopBlanks        => 1, mysql_enable_utf8 => 1 },
  driver          => 'mysql',
  dsn             => 'dbi:mysql:dbname=giftec_site;host=qiwi.giftec.ru',
  password        => 'web',
  username        => 'web',
);

1;
