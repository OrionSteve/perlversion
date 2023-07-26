#!/usr/bin/env perl

use 5.030;
use strict;
use warnings;
use utf8;
#
#- This is just another way of "dereferencing" an array or hash ref - it also applies to
#- other references, scalar and code.
#
#- Normally - and will be for the foreseeable future if we have hashref and we want to 
#- access the hash we wrap the hash ref in %{}. 
#- For example:   for my $key ( keys %{$hashref}) {}
#
#- The new way is the "postfix dereference" way.
#- The above becomes:  for my $key (keys $hashref->%*) {}
#- See: https://www.effectiveperlprogramming.com/2014/09/use-postfix-dereferencing/
#- for why this is a "good thing"™

my $x = {
    A => 'aa',
    B => 'bb',
};

#
#- Old style
#
foreach my $key (keys %{$x}) {
    say $x->{$key};
}
#
#- New style
#
foreach my $key (keys $x->%*) {
    say $x->{$key};
}

#
#- A function returning an array
#
foreach my $val (@{my_array()}) {
    say $val;
}
#
#- and the new way.
#
foreach my $val (my_array()->@*) {
    say $val;
}


sub my_array {
    return [qw{1 2 3 }];
}