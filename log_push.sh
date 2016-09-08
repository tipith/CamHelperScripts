#!/bin/sh
#
# Sends all log files from /var/log into remote host.

filename=`date +%Y-%m-%d_%H:%M`_`hostname`_logs.tar.gz

sudo tar -czf ~/$filename /var/log/

ssh camserver "test -d ~/log_push || mkdir ~/log_push"
scp ~/$filename camserver:~/log_push
