#!/bin/bash
ln -s /opt/spark-job-server/service /etc/init.d/spark-job-server
ln -s /opt/spark-job-server/service /usr/lib/spark-job-server
ln -s /opt/spark-job-server/manual /usr/share/man/man8/spark-job-server.8
ln -s /opt/spark-job-server/logrotate /etc/logrotate.d/spark-job-server

mkdir -p /var/log/spark-job-server
mkdir -p /var/lib/spark-job-server
