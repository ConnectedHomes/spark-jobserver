#!/usr/bin/env bash
INSTALL_DIR=/opt/spark-job-server/
LOG_DIR=/var/log/spark-job-server
PIDFILE=/var/run/spark-jobserver.pid

# For DataStax Enterprise with Spark enabled
SPARK_HOME=/usr/share/dse/spark
SPARK_CONF_HOME=/etc/dse/spark