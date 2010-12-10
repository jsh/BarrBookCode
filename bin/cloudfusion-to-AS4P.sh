#!/bin/bash -eu
#
# convert from older, cloudfusion toolkit to AWSSDKforPHP
#   in-place conversion

die() { echo $* >&2; exit 1; }
usage="usage: $0 phpfile [phpfile ...]"

[ "$*" ] || die $usage

perl -i -pe "s('cloudfusion.class.php')('AWSSDKforPHP/sdk.class.php')" $*
