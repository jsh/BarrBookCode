#!/usr/bin/perl -w

use strict;
my ($in,$out);
my $secret = "$ENV{HOME}/.awssecret";
my $phpsecret = $secret . '.inc.php';

open( $in, '<', $secret ) or
  die "Can't read '$secret'";
open( $out, '>', $phpsecret ) or
  die "Can't write '$phpsecret'";

# Grab the entire secrets file
my @keys = <$in>;
chomp @keys;
die "wrong number of lines in $ARGV" unless @keys == 2;
close $in or
  die "Can't close '$secret'";

# reformat it
$keys[0] = "define('AWS_KEY', '$keys[0]');\n";
$keys[1] = "define('AWS_SECRET_KEY', '$keys[1]');\n";

# print the php secrets file
print $out '
/*
 * This holds the values of your AWS_KEY and AWS_SECRET_KEY variables
 * It must be installed as ~/.awssecret.inc.php
 */

';

print $out @keys;
close $out or
  die "Can't close '$phpsecret'";

# fix the permissions
chmod ( 0600, $phpsecret )
  or die "Can't chmod 0600 '$phpsecret'";
