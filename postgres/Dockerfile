FROM ubuntu:xenial

# A seperate file for configuring environment might sound like a good idea.
ENV POSTGRES_VERSION 9.5
ENV PATH /usr/lib/postgresql/"$POSTGRES_VERSION"/bin:"$PATH"
ENV AUTH_METHOD md5
#ENV POSTGRES_DATA /var/lib/postgresql/data

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates

# Import repository's key.
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Get rid of unnecessary packages.
RUN apt-get purge --auto-remove -y \
    wget \
    ca-certificates

# Add Postres' repository maintained by The PostgreSQL Global Development Group (PGDG).
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list

# Update package lists, install PostgreSQL and create postgres account.
RUN apt-get update && apt-get install -y \
    postgresql-"$POSTGRES_VERSION"

# Rest of the commands will be interpreted by the postgres user.
USER postgres

# Create a new database role
RUN /etc/init.d/postgresql start \
    && psql -c "CREATE USER docker WITH SUPERUSER PASSWORD '247365';" \
    && createdb -O docker docker

# Allow remote connections and set an address to listen to.
RUN echo "host all all 0.0.0.0/0 ${AUTH_METHOD}" >> /var/lib/postgresql/"$POSTGRES_VERSION"/main/pg_hba.conf
RUN echo "listen_addres = '*' " >> /var/lib/postgresql/"$POSTGRES_VERSION"/main/postgresql.conf

# Create mountpoint for database files.
VOLUME ["/var/lib/postgresql"]
#VOLUME ["/var/lib/postgresql/data"]

EXPOSE 5432

# Create default database and its user.
#ENTRYPOINT [""]

CMD ["postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]
