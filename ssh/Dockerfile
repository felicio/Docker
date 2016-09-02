FROM alpine

RUN apk add --no-cache openssh

COPY ["etc/sshd_config", "/etc/ssh/sshd_config"]

#VOLUME ["/home/git/.ssh/authorized_keys"]

EXPOSE 22

ENETRYPOINT ["docker-entrypoint.sh"]
#CMD ["sshd"]
