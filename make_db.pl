#!/usr/bin/perl -w

use common::sense;
use Rose::DB::Object::Loader;

my $loader = 
    Rose::DB::Object::Loader->new(
      db_dsn       => 'dbi:mysql:dbname=giftec_site;host=qiwi.giftec.ru',
      db_username  => 'web',
      db_password  => 'web',
      db_options   => { AutoCommit => 1, ChopBlanks => 1, mysql_enable_utf8 => 1 },
      class_prefix => 'GDB');
    
  $loader->make_modules(module_dir => 'd:\Dropbox\GIT\Gift_mobile\GDB');