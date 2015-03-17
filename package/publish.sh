#!/bin/bash
set -e
SPARK_JOB_SERVER_VERSION=1.0
echo "SPARK_JOB_SERVER_VERSION=$SPARK_JOB_SERVER_VERSION"

DEB=spark-job-server_${SPARK_JOB_SERVER_VERSION}-${PIPELINE_NUMBER}_all.deb
cp job-server/target/$DEB ./$DEB

publish-package.sh -r release -u bgchadmin ${DEB}

exit $?
