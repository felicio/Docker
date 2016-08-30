#!/bin/sh
set -e

# If the container was run only with options, assume postgres command. 
if [ "${1:0:1}" = "-" ]; then
	exec postgres "$@"
fi

if [ "$1" = "postgres" ]; then

	# Specify database cluster.
	export PGDATA=${PG_DATA_PATH=/var/lib/postgresql/db/data}
	mkdir -p `dirname ${PGDATA}`
	
	# Initiliaze PostgreSQL database and create root account with its credentials.
	pg_ctl initdb --silent -o '-A "${PG_AUTH_METHOD=md5}" --pwprompt'

	# Start database server. And replace the shell with this program.
	#exec pg_ctl start -w -o "-c listen_addresses=localhost"
	exec postgres -h localhost

fi

# Run the container as different executable other than postgres.
exec "$@"
