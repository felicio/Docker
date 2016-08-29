FROM alpine

ENV PGDATA /var/lib/postregsql/data

RUN apk add --no-cache postgresql

# Avoid permissions problems by not setting data directory directly as mountpoint.
VOLUME ["/var/lib/postgresql"]

USER postgres
WORKDIR ["/var/lib/postgresql/postgresql/data"]

RUN initdb -A md5 

EXPOSE 5432

# Following syntax allows Shell expansion.
CMD ["sh", "-c", "postgres -D ${PGDATA}"]
