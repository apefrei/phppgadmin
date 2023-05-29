FROM richarvey/nginx-php-fpm:latest

LABEL maintainer="Raptus AG" \
    org.label-schema.name="phppgadmin" \
    org.label-schema.vendor="raptusag" \
    org.label-schema.description="phpPgAdmin Docker image, phpPgAdmin is a web-based administration tool for PostgreSQL." \
    org.label-schema.vcs-url="https://github.com/Raptus/raptus.cnt.mgmt.pgadmin"

ENV RAPTUS_WEBROOT_DIR=/var/www/html
ENV RAPTUS_DATA_DIR=/data
ENV RAPTUS_ETC_DIR=/opt/raptus
ENV RAPTUS_LOG_DIR=/var/log

ADD ./assets ${RAPTUS_ETC_DIR}
COPY sshd_config /etc/ssh/
COPY entrypoint.sh ./

# Start and enable SSH
RUN apk add openssh \
    && echo "root:Docker!" | chpasswd \
    && chmod +x ./entrypoint.sh \
    && cd /etc/ssh/ \
    && ssh-keygen -A

RUN apk --no-cache --update add postgresql
RUN chmod -R ugo+x ${RAPTUS_ETC_DIR}
RUN ${RAPTUS_ETC_DIR}/buildtime/install.sh
#RUN cp -ar ${RAPTUS_ETC_DIR}/etc/* /etc
RUN rm -rf /var/cache/apk/* ${RAPTUS_ETC_DIR}/etc ${RAPTUS_ETC_DIR}/buildtime

EXPOSE 8000 2222
ENTRYPOINT [ "./entrypoint.sh" ]