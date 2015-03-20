#!/bin/bash
set -e

PIPELINE_NUMBER=$1
MANUAL_FILE=manual
echo "Building for pipeline number $PIPELINE_NUMBER"

sbt job-server/assembly

PKG=spark-job-server.$$
mkdir -p $PKG
echo "Using package directory: $PKG"

pandoc -s -T spark-job-server --variable=title:spark-job-server --variable=section:8 -f markdown -t man package/debian/MANUAL.md > package/debian/$MANUAL_FILE

mkdir -p $PKG/opt/spark-job-server

cp job-server/target/spark-job-server.jar $PKG/opt/spark-job-server

cp bin/server_start.sh $PKG/opt/spark-job-server
cp bin/server_stop.sh $PKG/opt/spark-job-server
cp package/debian/settings.sh $PKG/opt/spark-job-server
cp package/debian/service $PKG/opt/spark-job-server
cp config/log4j-server.properties $PKG/opt/spark-job-server
cp config/job-server-default.conf $PKG/opt/spark-job-server
cp package/debian/logrotate $PKG/opt/spark-job-server
mv package/debian/manual $PKG/opt/spark-job-server

cd $PKG
fpm -s dir -t deb -a all \
    --verbose \
    --name spark-job-server \
    --iteration ${PIPELINE_NUMBER} \
    --template-value date="$DATE" \
    --template-value gitCommit="$GIT_COMMIT" \
    --depends 'oracle-jre'
    --depends 'scala'
    --depends 'dse'
    --depends 'dse-libspark'
    --depends 'dse-libhadoop'
    --depends 'dse-pig'
    --depends 'dse-hive'
    --depends 'dse-libsolr'
    --depends 'dse-libsqoop'
    --depends 'dse-libmahout'
    --before-install ../package/debian/before_install.sh \
    --after-install ../package/debian/after_install.sh \
    --before-remove ../package/debian/before_remove.sh \
    --after-remove ../package/debian/after_remove.sh \
    .

cd ..

mv $PKG/spark-job-server*deb job-server/target/

rm -rf $PKG

exit $?

