#!/bin/bash -eu
#
# convert from older, cloudfusion toolkit to AWSSDKforPHP
#   in-place conversion

perl -i -pe "s('cloudfusion.class.php')('AWSSDKforPHP/sdk.class.php')" $*
