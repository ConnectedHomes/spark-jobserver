#!/bin/bash
set -e
SPARK_JOB_SERVER_VERSION=1.0
echo "SPARK_JOB_SERVER_VERSION=$SPARK_JOB_SERVER_VERSION"
DEB=spark-job-server_${SPARK_JOB_SERVER_VERSION}-${PIPELINE_NUMBER}_all.deb

diditpubli.sh -u apt -p "$APT_PASSWORD" -r release "$DEB"

if [[ -f ${DEB} ]]
then
        echo "Deleting to avoid filling up the disk"
        rm ${DEB}
fi

exit $?

