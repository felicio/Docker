FROM alpine

RUN apk add --no-cache openssh

COPY ["etc/sshd_config", "/etc/ssh/sshd_config"]

RUN mkdir /var/run/sshd

VOLUME ["/root/.ssh/authorized_keys"]

EXPOSE 22

COPY ["docker-entrypoint.sh", "/usr/bin/"]

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
