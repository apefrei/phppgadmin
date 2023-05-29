#!/bin/sh

PHP_PG_ADMIN_SERVER_DESC=${PHP_PG_ADMIN_SERVER_DESC:-PostgreSQL}
PHP_PG_ADMIN_SERVER_HOST=${PHP_PG_ADMIN_SERVER_HOST:-}
PHP_PG_ADMIN_SERVER_PORT=${PHP_PG_ADMIN_SERVER_PORT:-5432}
PHP_PG_ADMIN_SERVER_SSL_MODE=${PHP_PG_ADMIN_SERVER_SSL_MODE:-allow}
PHP_PG_ADMIN_SERVER_DEFAULT_DB=${PHP_PG_ADMIN_SERVER_DEFAULT_DB:-template1}
PHP_PG_ADMIN_SERVER_PG_DUMP_PATH=${PHP_PG_ADMIN_SERVER_PG_DUMP_PATH:-/usr/bin/pg_dump}
PHP_PG_ADMIN_SERVER_PG_DUMPALL_PATH=${PHP_PG_ADMIN_SERVER_PG_DUMPALL_PATH:-/usr/bin/pg_dumpall}

PHP_PG_ADMIN_DEFAULT_LANG=${PHP_PG_ADMIN_DEFAULT_LANG:-auto}
PHP_PG_ADMIN_AUTO_COMPLETE=${PHP_PG_ADMIN_AUTO_COMPLETE:-'default on'}
PHP_PG_ADMIN_EXTRA_LOGIN_SECURITY=${PHP_PG_ADMIN_EXTRA_LOGIN_SECURITY:-false}
PHP_PG_ADMIN_OWNED_ONLY=${PHP_PG_ADMIN_OWNED_ONLY:-false}
PHP_PG_ADMIN_SHOW_COMMENTS=${PHP_PG_ADMIN_SHOW_COMMENTS:-true}
PHP_PG_ADMIN_SHOW_ADVANCED=${PHP_PG_ADMIN_SHOW_ADVANCED:-false}
PHP_PG_ADMIN_SHOW_SYSTEM=${PHP_PG_ADMIN_SHOW_SYSTEM:-false}
PHP_PG_ADMIN_MIN_PASSWORD_LENGTH=${PHP_PG_ADMIN_MIN_PASSWORD_LENGTH:-1}
PHP_PG_ADMIN_LEFT_WIDTH=${PHP_PG_ADMIN_LEFT_WIDTH:-200}
PHP_PG_ADMIN_THEME=${PHP_PG_ADMIN_THEME:-default}
PHP_PG_ADMIN_SHOW_OIDS=${PHP_PG_ADMIN_SHOW_OIDS:-false}
PHP_PG_ADMIN_MAX_ROWS=${PHP_PG_ADMIN_MAX_ROWS:-30}
PHP_PG_ADMIN_MAX_CHARS=${PHP_PG_ADMIN_MAX_CHARS:-50}
PHP_PG_ADMIN_USE_XHTML_STRICT=${PHP_PG_ADMIN_USE_XHTML_STRICT:-false}
PHP_PG_ADMIN_HELP_BASE=${PHP_PG_ADMIN_HELP_BASE:-'http://www.postgresql.org/docs/%s/interactive/'}
PHP_PG_ADMIN_AJAX_REFRESH=${PHP_PG_ADMIN_AJAX_REFRESH:-3}


cat ${RAPTUS_ETC_DIR}/runtime/configs/phppgadmin/config.inc.php | \
    sed -e "s#{{PHP_PG_ADMIN_SERVER_DESC}}#$PHP_PG_ADMIN_SERVER_DESC#g" \
        -e "s#{{PHP_PG_ADMIN_SERVER_HOST}}#$PHP_PG_ADMIN_SERVER_HOST#g" \
        -e "s#{{PHP_PG_ADMIN_SERVER_PORT}}#$PHP_PG_ADMIN_SERVER_PORT#g" \
        -e "s#{{PHP_PG_ADMIN_SERVER_SSL_MODE}}#$PHP_PG_ADMIN_SERVER_SSL_MODE#g" \
        -e "s#{{PHP_PG_ADMIN_SERVER_DEFAULT_DB}}#$PHP_PG_ADMIN_SERVER_DEFAULT_DB#g" \
        -e "s#{{PHP_PG_ADMIN_SERVER_PG_DUMP_PATH}}#$PHP_PG_ADMIN_SERVER_PG_DUMP_PATH#g" \
        -e "s#{{PHP_PG_ADMIN_SERVER_PG_DUMPALL_PATH}}#$PHP_PG_ADMIN_SERVER_PG_DUMPALL_PATH#g" \
        -e "s#{{PHP_PG_ADMIN_DEFAULT_LANG}}#$PHP_PG_ADMIN_DEFAULT_LANG#g" \
        -e "s#{{PHP_PG_ADMIN_AUTO_COMPLETE}}#$PHP_PG_ADMIN_AUTO_COMPLETE#g" \
        -e "s#{{PHP_PG_ADMIN_EXTRA_LOGIN_SECURITY}}#$PHP_PG_ADMIN_EXTRA_LOGIN_SECURITY#g" \
        -e "s#{{PHP_PG_ADMIN_OWNED_ONLY}}#$PHP_PG_ADMIN_OWNED_ONLY#g" \
        -e "s#{{PHP_PG_ADMIN_SHOW_COMMENTS}}#$PHP_PG_ADMIN_SHOW_COMMENTS#g" \
        -e "s#{{PHP_PG_ADMIN_SHOW_ADVANCED}}#$PHP_PG_ADMIN_SHOW_ADVANCED#g" \
        -e "s#{{PHP_PG_ADMIN_SHOW_SYSTEM}}#$PHP_PG_ADMIN_SHOW_SYSTEM#g" \
        -e "s#{{PHP_PG_ADMIN_MIN_PASSWORD_LENGTH}}#$PHP_PG_ADMIN_MIN_PASSWORD_LENGTH#g" \
        -e "s#{{PHP_PG_ADMIN_LEFT_WIDTH}}#$PHP_PG_ADMIN_LEFT_WIDTH#g" \
        -e "s#{{PHP_PG_ADMIN_THEME}}#$PHP_PG_ADMIN_THEME#g" \
        -e "s#{{PHP_PG_ADMIN_SHOW_OIDS}}#$PHP_PG_ADMIN_SHOW_OIDS#g" \
        -e "s#{{PHP_PG_ADMIN_MAX_ROWS}}#$PHP_PG_ADMIN_MAX_ROWS#g" \
        -e "s#{{PHP_PG_ADMIN_MAX_CHARS}}#$PHP_PG_ADMIN_MAX_CHARS#g" \
        -e "s#{{PHP_PG_ADMIN_USE_XHTML_STRICT}}#$PHP_PG_ADMIN_USE_XHTML_STRICT#g" \
        -e "s#{{PHP_PG_ADMIN_HELP_BASE}}#$PHP_PG_ADMIN_HELP_BASE#g" \
        -e "s#{{PHP_PG_ADMIN_AJAX_REFRESH}}#$PHP_PG_ADMIN_AJAX_REFRESH#g" \
        > ${RAPTUS_WEBROOT_DIR}/conf/config.inc.php