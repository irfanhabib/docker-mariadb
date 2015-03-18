#!/bin/bash
set -e

# read DATADIR from the MySQL config
#DATADIR="$(mysqld --verbose --help 2>/dev/null | awk '$1 == "datadir" { print $2; exit }')"

if [ ! -d "$MYSQL_DATADIR/mysql" ]; then
  if [ -z "$MYSQL_ROOT_PASSWORD" -a -z "$MYSQL_ALLOW_EMPTY_PASSWORD" ]; then
    echo >&2 'error: database is uninitialized and MYSQL_ROOT_PASSWORD not set'
    echo >&2 '  Did you forget to add -e MYSQL_ROOT_PASSWORD=... ?'
    exit 1
  fi

  echo 'Running mysql_install_db ...'
  mysql_install_db --datadir="$MYSQL_DATADIR"
  echo 'Finished mysql_install_db'

  # These statements _must_ be on individual lines, and _must_ end with
  # semicolons (no line breaks or comments are permitted).
  # TODO proper SQL escaping on ALL the things D:

#  tempSqlFile='/tmp/mysql-first-time.sql'
  cat > "$MYSQL_INIT_FILE" <<-EOSQL
DELETE FROM mysql.user ;
CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;
GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;
DROP DATABASE IF EXISTS test ;
EOSQL

  if [ "$MYSQL_DATABASE" ]; then
    echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` ;" >> "$MYSQL_INIT_FILE"
  fi

  if [ "$MYSQL_USER" -a "$MYSQL_PASSWORD" ]; then
    echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> "$MYSQL_INIT_FILE"

    if [ "$MYSQL_DATABASE" ]; then
      echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' ;" >> "$MYSQL_INIT_FILE"
    fi
  fi

  echo 'FLUSH PRIVILEGES ;' >> "$MYSQL_INIT_FILE"
fi

chown -R mysql:mysql "$MYSQL_DATADIR"

exec mysqld_safe --init-file=$MYSQL_INIT_FILE
