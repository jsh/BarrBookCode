#!/usr/bin/perl
#
# create an AWSSDKforPHP configfile that pulls in the user's AWS keys.

use warnings;
use strict;

my ( $in, $out );
my $awsdir     = "/usr/share/php/AWSSDKforPHP";
my $template   = "$awsdir/config-sample.inc.php";
my $configfile = "$awsdir/config.inc.php";

open( $in, '<', $template )
  or die "Can't read '$template'";
open( $out, '>', $configfile )
  or die "Can't write '$configfile'";

my $added_require_secretsfile = 0;

while (<$in>) {

    # comment out old AWS_KEY, AWS_SECRET_KEY defines
    s{define\('AWS_.*KEY'}{//$&};
    if ( /^\s*$/ && ( $added_require_secretsfile == 0 ) ) {

        # put in the requires
        print $out q(

      // pull in the user's AWS keys
      $home = "$_SERVER['HOME']/.awssecret.inc.php";
      require_once($home);

    );
        $added_require_secretsfile = 1;
    }
    print $out $_;
}

close $in
  or die "Can't close '$template'";

close $out
  or die "Can't close '$configfile'";

exit 0;
