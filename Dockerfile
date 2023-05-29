FROM richarvey/nginx-php-fpm:latest

LABEL maintainer="Raptus AG" \
    org.label-schema.name="phppgadmin" \
    org.label-schema.vendor="raptusag" \
    org.label-schema.description="phpPgAdmin Docker image, phpPgAdmin is a web-based administration tool for PostgreSQL." \
    org.label-schema.vcs-url="https://github.com/Raptus/raptus.cnt.mgmt.pgadmin"

ENV RAPTUS_WEBROOT_DIR=/var/www \
    RAPTUS_DATA_DIR=/data \
    RAPTUS_ETC_DIR=/etc/raptus \
    RAPTUS_LOG_DIR=/var/log

ADD ./assets ${RAPTUS_ETC_DIR}

RUN apk --no-cache --update add php8-pgsql postgresql \
    && ${RAPTUS_ETC_DIR}/buildtime/install \
    && cp -ar ${RAPTUS_ETC_DIR}/etc/* /etc \
    && rm -rf /var/cache/apk/* ${RAPTUS_ETC_DIR}/etc ${RAPTUS_ETC_DIR}/buildtime
