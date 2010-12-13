#!/bin/bash -eu
# test the ec2-tool installation

source ec2-tool-setup
mon-cmd --help
ec2-describe-images
elb-describe-lbs
