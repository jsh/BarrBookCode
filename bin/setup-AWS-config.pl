#!/usr/bin/perl
#
# create an AWSSDKforPHP configfile that pulls in the user's AWS keys.

use warnings;
use strict;

my ( $in, $out );
my $public_awsdir  = "/usr/share/php/AWSSDKforPHP";
my $template       = "$public_awsdir/config-sample.inc.php";
my $private_awsdir = "$ENV{HOME}/.aws/sdk";
my $configfile     = "$private_awsdir/config.inc.php";
my $secretsfile    = "$ENV{HOME}/.awssecret";

# pull in secrets
open( $in, '<', $secretsfile )
  or die "Can't read '$secretsfile'";
my ( $AWS_KEY, $AWS_SECRET_KEY ) = <$in>;
close $in
  or die "can't close '$secretsfile'";
chomp( $AWS_KEY, $AWS_SECRET_KEY );

open( $in, '<', $template )
  or die "Can't read '$template'";
die "Can't create '$private_awsdir'"
  unless ( system("mkdir -p $private_awsdir") == 0 );
open( $out, '>', $configfile )
  or die "Can't write '$configfile'";

# copy the template to the private config file
# inserting the key values
while (<$in>) {

    # insert key values
    if (m{define\('AWS_KEY'}) {
        s/''/'$AWS_KEY'/;
    }
    if (m{define\('AWS_SECRET_KEY'}) {
        s/''/'$AWS_SECRET_KEY'/;
    }
    print $out $_;
}

close $in
  or die "Can't close '$template'";

close $out
  or die "Can't close '$configfile'";

exit 0;
