#!/usr/bin/perl -w
#
# insert "Modified by" notice at the end of the first big comment block
#
#   idempotent (Won't put in a second notice if there's already one there.)

use strict;

my $end_of_block_comment = '^(\s*\*)/';
my $modified_by          = 'Modified by Jeffrey S. Haemer <jeffrey.haemer@gmail.com>';
my $needs_modification   = 1;
my $usage                = "usage: $0 php-filename";

die $usage unless ( (@ARGV == 1) && $ARGV[0] =~ /\.php$/ );

while (<>) {
  $needs_modification = 0 if /$modified_by/;  # already has a notice

  if ( /$end_of_block_comment/ && $needs_modification ) {
	print "$1\n";	          # use indentation level of block-comment close
	print "$1 $modified_by\n";
	$needs_modification = 0;  # only print one notice
  }
  print;
}
