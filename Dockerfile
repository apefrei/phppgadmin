FROM ubuntu

# INIT
ENV DEBIAN_FRONTEND noninteractive
ENV PHP_VERSION 8.1

# TIME
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# BASIC PACKAGES
RUN apt-get update
RUN apt-get install -y nginx php php-fpm php-intl php-mysql php-xdebug php-pgsql \
                       postgresql curl gunicorn
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# LANG
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# NGINX config

# PHP Config
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/${PHP_VERSION}/fpm/php-fpm.conf

#Other
ENV RAPTUS_WEBROOT_DIR=/var/www/html
ENV RAPTUS_DATA_DIR=/data
ENV RAPTUS_OPT_DIR=/opt/raptus
ENV RAPTUS_LOG_DIR=/var/log

COPY ./assets/. ${RAPTUS_OPT_DIR}/assets/
COPY entrypoint.sh ./

RUN chmod -R og-rwx ${RAPTUS_OPT_DIR}
RUN rm -rf /var/cache/apk/* ${RAPTUS_OPT_DIR}/etc ${RAPTUS_OPT_DIR}/buildtime

# Start and enable SSH for Azure
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x ./entrypoint.sh

COPY sshd_config /etc/ssh
RUN ls -la ${RAPTUS_OPT_DIR}/assets

# Define default command.
CMD service php${PHP_VERSION}-fpm start && nginx

# Expose ports.
EXPOSE 80 443 8000 2222

ENTRYPOINT [ "./entrypoint.sh" ]