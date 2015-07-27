#!/usr/bin/env perl
use common::sense;


my $related = '1,2,3,4,5';
foreach my $rid(split(/,/,$related)) {
    print $rid,"\n";
}