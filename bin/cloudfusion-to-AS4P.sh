#!/bin/bash -eu
#
# convert from older, cloudfusion toolkit to AWSSDKforPHP
#   in-place conversion

die() { echo $* >&2; exit 1; }
usage="usage: $0 phpfile [phpfile ...]"

[ "$*" ] || die $usage

# point at the new toolkit
perl -i -pe "s('cloudfusion.class.php')('AWSSDKforPHP/sdk.class.php')" $*

# mark as modified, for Apache license compliance
for i in $*; do
  mark-modified.pl $i > $i.tmp &&
    cp $i.tmp $i &&
    rm $i.tmp
done
