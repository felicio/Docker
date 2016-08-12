FROM debian:jessie
LABEL description="Git Server – SSH Protocol"

RUN apt-get update && apt-get install -y \
    git \
    openssh-server

# Restrict ssh daemon's access outside directory tree (chroot jail, sandbox)
# by creating privilige separation directory.
RUN mkdir /var/run/sshd

# Add 'git' user with restricted shell
RUN adduser --shell /usr/bin/git-shell --disabled-password --gecos "" git

# Configure SSH server.
COPY ["etc/sshd_config", "/etc/ssh/sshd_config"]

# Enbale interactive login shell.
WORKDIR /home/git
COPY ["etc/git-shell-commands", "./"]
RUN chown git:git git-shell-commands && chmod 550 git-shell-commands

# Test validity of configuration file and output effective configuration.
WORKDIR /var/log/sshd
RUN shd -T > sshd_test.log

# Mount file containing all permitted users' public keys.
VOLUME ["/home/git/.ssh/authorized_keys"]
VOLUME ["/srv/git/data"]

EXPOSE 22

# sshd re-exec requires execution with an absolute path.
CMD ["/usr/sbin/sshd", "-D"]
