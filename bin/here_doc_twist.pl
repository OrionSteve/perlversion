#!/usr/bin/env perl
# Add use 5.030 to allow the use of features added since 5.8
use 5.030;

use strict;
use warnings;

 
# "say" has been around since 5.10 (2009).
# It's the same as print - but adds a c/r to the end of the line.
say my_sub();

say my_sub2();
#

sub my_sub {
    # HEREDOC "with a twist" that is a '<<~'
    # It lines up the next with the HEREDOC identifier.
    
    my $x =<<~HERE;
        -- This is aligned to the first column
        SELECT * FROM consignments 
        WHERE c.req_status = 'COMP'
        ORDER BY created
        HERE

    return $x;
}
#

sub my_sub2 {
    # HEREDOC "with a twist" that is a '<<~'
    # It lines up the next with the HEREDOC identifier.
    my $x =<<~HERE;
        -- This is 'tabbed' in 
        SELECT * FROM consignments 
        WHERE c.req_status = 'COMP'
        ORDER BY created
    HERE

    return $x;
}
