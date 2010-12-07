#!/bin/bash -eu

# scrub an EC2 instance
# in preparation for turning it into an AMI

## list of files to remove altogether
##   use '$HOME/...' instead of '~/...'

removes="
  $HOME/.bash_history
"

## files to truncate to zero length

truncates="
  /var/log/cron
  /var/log/maillog
  /var/log/secure
  /var/log/spooler
  /var/log/yum.log
  /var/log/httpd/error_log
  /var/log/httpd/access_log
"

## check for typos
for i in $removes; do
  [ -e $i ] || echo "no $i" 1>&2
done

for i in $truncates; do
  [ -f $i ] || echo "$i not a file" 1>&2
done

## remove the removes, truncate the truncates
rm -rf $removes
for i in $truncates; do
  : > $i
done

exit 0
