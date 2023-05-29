#!/usr/bin/env sh
set -eux

BUILD_PACKAGES_DEPENDENCIES=curl
apk add --no-cache ${BUILD_PACKAGES_DEPENDENCIES}

curl -SLO https://github.com/phppgadmin/phppgadmin/archive/master.zip
unzip master.zip
mv ./phppgadmin-master/* ${RAPTUS_WEBROOT_DIR}
mv ${RAPTUS_WEBROOT_DIR}/conf/config.inc.php-dist ${RAPTUS_WEBROOT_DIR}/conf/config.inc.php
chown -R nginx:nginx ${RAPTUS_WEBROOT_DIR}

rm -rf master.zip phppgadmin-master
apk del ${BUILD_PACKAGES_DEPENDENCIES}