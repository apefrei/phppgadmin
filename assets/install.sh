#!/bin/sh

curl -SLO https://github.com/phppgadmin/phppgadmin/archive/master.zip
unzip master.zip
mv ./phppgadmin-master/* ${RAPTUS_WEBROOT_DIR}
mv ${RAPTUS_WEBROOT_DIR}/conf/config.inc.php-dist ${RAPTUS_WEBROOT_DIR}/conf/config.inc.php
${RAPTUS_ETC_DIR}/buildtime/phppgadmin-conf.sh
chown -R nginx:nginx ${RAPTUS_WEBROOT_DIR}

rm -rf master.zip phppgadmin-master