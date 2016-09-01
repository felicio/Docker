#!/bin/sh -e

# If the container was run only with options, assume postgres command. 
if [ "${1:0:1}" = "-" ]; then
	exec postgres "$@"
fi

if [ "$1" = "postgres" ]; then

	# Specify database cluster.
	export PGDATA=${PG_DATA_PATH="/var/lib/postgresql/db/data"}
	mkdir -p `dirname ${PGDATA}`
	
	# Initiliaze PostgreSQL database and create root account with its credentials (interactive).
	pg_ctl initdb --silent -o --pwprompt

	# Start database server. And replace the shell with this program.
	exec postgres \
		--hba_file='/etc/postgresql/pg_hba.conf' \
		--config_file='/etc/postgresql/postgresql.conf'

fi

# Run the container as different executable other than postgres.
exec "$@" 
