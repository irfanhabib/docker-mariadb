# This is a Dockerfile to build a opensuse image which run mariadb and phpMyAdmin
FROM opensuse:13.2

ENV MARIADB_MAJOR 10.0
ENV MARIADB_VERSION 10.0.17-1.2
# Default password for root of mariadb
ENV MYSQL_ROOT_PASSWORD mysecretpassword
ENV MYSQL_INIT_FILE /tmp/mysql_init.sql
ENV MYSQL_DATADIR /var/lib/mysql

# Add repo for the latest mariadb
RUN zypper ar -f -r http://download.opensuse.org/repositories/server:/database/openSUSE_13.2/server:database.repo \
  && zypper -n --gpg-auto-import-keys ref

# Install packges
RUN zypper -n in --no-recommends mariadb-$MARIADB_VERSION net-tools \
  && zypper clean --all

# Config for mariadb
RUN mkdir -p /var/lib/mysql \
  && mkdir -p /var/log/mysql \
  && chown mysql:mysql /var/log/mysql
#  && rm /etc/my.cnf

# ADD etc/my.cnf /etc/my.cnf

VOLUME /var/lib/mysql

COPY scripts/db-init.sh /

# ENTRYPOINT
ENTRYPOINT ["/db-init.sh"]

EXPOSE 3306
# CMD ["--init-file=$MYSQL_INIT_FILE"]
