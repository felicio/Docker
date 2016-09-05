#!/bin/sh -ex

if [ "`basename $1`" = "sshd" ]; then
  
  # Generate missing host RSA key-pair for use in SSH protocol 2 connections.
  ssh-keygen -A

  # Check the validity of the configuration file.
  sshd -T > /var/log/sshd_test.log
 
  exec "$@"

fi

exec "$@"
