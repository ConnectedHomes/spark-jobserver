#!/bin/bash
set -e
rm -f /etc/init.d/spark-job-server
rm -f /usr/lib/spark-job-server
rm -f /usr/share/man/man8/spark-job-server.8
rm -f /etc/logrotate.d/spark-job-server
rm -rf /opt/spark-job-server
exit $?