FROM debian:jessie
LABEL description="Git Server – Git Protocol"

RUN apt-get update && apt-get install -y \
    git

# Grant owner and group only, not others, access to data directory.
#RUN echo "umask 027" >> /etc/bash.bashrc

# Create user, with disabled password authentication and
# read-only access to data folder, that will run git daemon.
RUN adduser --disabled-password --no-create-home --gecos "" --shell /usr/bin/git-shell git-ro

# Create folder for storing repositories
WORKDIR /srv/git/data
RUN chmod 750 . && chmod g+s . && chgrp git-ro .

# Expose a mountpoint to hold external content from native host, data stores or other containers.
VOLUME ["/srv/git/data"]

# The same should count for a mapped port if a firewall is set up.
EXPOSE 9418

USER git-ro

# Allow server to restart without waiting for old connnections to time out.
CMD ["git", "daemon", "--reuseaddr", "--base-path=/srv/git/data", "/srv/git/data"]
