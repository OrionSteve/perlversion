#!/usr/bin/env perl
# Add use 5.030 to allow the use of features added since 5.8
use 5.030;
use strict;
use warnings;
# I recently saw one of the perl devolpers say we should be using Data::Print, not Data::Dumper.
use Data::Dumper;
# Even though it's available, as it's still experimental we have to explicitly enable it.
# It is no longer experimental at 5.36, so it's fine to use it.
use feature 'signatures';
# This suppesses the corresponding warning.
no warnings 'experimental::signatures';    ## no critic  
# perlcritic be default prohibits Subroutine Prototypes, but it really means the old style (do perldoc perlsub 
# for more details).
## no critic (Subroutines::ProhibitSubroutinePrototypes 

#
#- I've wrapped the subs in an eval to catch the cases were it fails.
#

#
#- Simple case - one argument exactly.
#- We could have an arbritary number of args.
#- Note there is no typing here. We are clearly expectinng something that could be a string
#- and it might be a hash ref for example.
#
sub my_sub($x) {
    say "My Sub: $x" ;
}

eval { my_sub("Ok")};
if ($@) {
    say $@;
}
#
#- This won't as no arg
#
eval { my_sub()};
if ($@) {
    say $@;
}

# 
#- This won't as too many args.
eval { my_sub("One", "two")};
if ($@) {
    say $@;
}


#
#- defaults are specified in the natural way.
#
sub my_default_sub($x = 'default') {
    say "My Defaulted: $x";
}


#
#- This should work.
#

#
#- This works and uses the passed parameter
#
eval { my_default_sub("One")};
if ($@) {
    say $@;
}

#
#- We don't pass a parameter so it uses the default
#
eval { my_default_sub()};
if ($@) {
    say $@;
}

#
#- You can pass an array or hash as the final parameter
#- Here we are expecting a hash, so it will complain if the are an odd number of 
#- elements in it.
sub my_slurpy_sub($x, %hash) {
    say "My Slurpy: $x";
    say Dumper \%hash;
}


#
#- We pass one "normal" parameter
#- The rest is considered as the empty hash.
#
eval { my_slurpy_sub("One")};
if ($@) {
    say $@;
}

#
#- We pass two - this fails as "Two" can't be a hash.
#
eval { my_slurpy_sub("One", "Two")};
if ($@) {
    say $@;
}

#
# The 'array' ("Two", "Three") is convereted to a hash 
#
eval { my_slurpy_sub("One", "Two", "Three")};
if ($@) {
    say $@;
}

#
#- and here we use the => notation. This is the same as the previous version.
#
eval { my_slurpy_sub("One", "key" => "Value")};
if ($@) {
    say $@;
}


