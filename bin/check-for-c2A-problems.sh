#!/bin/bash -eu
#
# check for various problems converting from CloudFusion to AWSSDKforPHP,
#   discussed on this web page:
#
#   http://aws.amazon.com/articles/4263?_encoding=UTF8&jiveRedirect=1

export dir=$(dirname $0)

! grep -r -f <(perl -lane 's/#.*//; print if /\S/' $dir/problem-strings) .
