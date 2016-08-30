#!/bin/sh
set -e

# If the container was run only with options, assume postgres command. 
if [ "${1:0:1}" = "-" ]; then
	exec postgres "$@"
fi

# Initialize PostgreSQL database and root account with its credentials.
if [ "$1" = "postgres" ]; then

	# Specify database cluster location.
	export PGDATA=/var/lib/postgres/data
	
	initdb -A "${PG_AUTH_METHOD=md5}" -D "${PGDATA=/var/lib/postgres/data}" -W
fi

# Run the container as different executable.
exec "$@"

# Failing to set password will let anyone with acces to mapped port authenticate as root user.2Gdd
#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
#    CREATE USER docker;
#    CREATE DATABASE docker;
#    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
#EOSQL
