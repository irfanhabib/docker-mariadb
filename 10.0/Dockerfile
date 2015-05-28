# This is a Dockerfile to build a opensuse image which run mariadb
FROM opensuse:13.2
MAINTAINER Mengz You <you.mengz@yahoo.com>

ENV MARIADB_MAJOR 10.0
ENV MARIADB_VERSION 10.0.17
# Default password for root of mariadb
ENV MYSQL_ROOT_PASSWORD mysecretpassword

# Add repo for the latest mariadb
RUN zypper ar -f -r http://download.opensuse.org/repositories/server:/database/openSUSE_13.2/server:database.repo \
  && zypper -n --gpg-auto-import-keys ref

# Install packges
RUN zypper -n in --no-recommends mariadb-$MARIADB_VERSION net-tools \
  && zypper -n in libpcre1-8.37 \
  && zypper clean --all

# Config for mariadb
RUN rm -rf /var/lib/mysql \
  && mkdir -p /var/lib/mysql \
  && mkdir -p /var/log/mysql \
  && chown mysql:mysql /var/log/mysql

VOLUME ["/var/lib/mysql"]

COPY docker-entrypoint.sh /

# ENTRYPOINT
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld_safe"]
