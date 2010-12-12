#!/bin/bash -eu

yum update -y
yum install git php-pear
pear channel-discover pear.amazonwebservices.com
pear install aws/sdk
git clone git://github.com/jsh/BarrBookCode.git
ln -s /usr/share/pear/AWSSDKforPHP/ /usr/share/php/AWSSDKforPHP
