#!/bin/bash -eu
# pull down the Amazon Command Line Interface tools
# needed for Chapter 7

PATH+=:$(dirname $(readlink -f $0))
source gripe.sh

# the list is these APIs:
#  - EC2
#  - CloudWatch
#  - Auto Scaling
#  - Elastic Load Balancing

list='
http://www.amazon.com/gp/redirect.html/ref=aws_rc_ec2tools?location=http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip&token=A80325AA4DAB186C80828ED5138633E3F49160D9
http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip
http://ec2-downloads.s3.amazonaws.com/AutoScaling-2010-08-01.zip
http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip
'

mkdir -p Downloads
cd Downloads

for i in $list
do
	echo "== getting $i"
	wget "$i" ||
		die "Can't get $i"
done &> OUT

mv 'ref\=aws_rc_ec2tools\?location\=http\:%2F%2Fs3.amazonaws.com%2Fec2-downloads%2Fec2-api-tools.zip\&token\=A80325AA4DAB186C80828ED5138633E3F49160D9' EC2-api-tools.zip

echo 'SUCCESS!'
rm OUT
