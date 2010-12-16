#!/bin/bash -eu
# test the ec2-tool setupation

source ../../bin/gripe.sh
source ec2-tool-setup

warn == testing cw-tools setup
if mon-cmd --help; then
  warn "== cw-tools setup: SUCCESS"
else
  warn "== cw-tools setup: FAIL"
fi
echo

warn == testing ec2-tools setup
if ec2-describe-images; then
  warn "== ec2-tools setup: SUCCESS"
else
  warn "== ec2-tools setup: FAIL"
fi
echo

warn == testing elb-tools setup
if elb-describe-lbs; then
  warn "== elb-tools setup: SUCCESS"
else
  warn "== elb-tools setup: FAIL"
fi
echo
