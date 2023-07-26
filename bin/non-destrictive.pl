#!/usr/bin/env perl

use 5.030;
use strict;
use warnings;
#
#- This is the r suffix to s///.
#- It says to leave the string we first thought of alone and return the changed string.
#
#- So if you've every done  my $y= $x ;  $y =~ s/orginal/new/;
#- you can now just do $y = $x =~ s/original/new/r

my $x = "This is a string";

my $y =  $x =~ s/string/goat/r;

say "$x, $y";
