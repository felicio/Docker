#!/bin/sh -ex

if [ "`basename $1`" = "sshd" ]; then
  
  # Generate missing host RSA key-pair for use in SSH protocol 2 connections.
  ssh-keygen -N "" -f /etc/ssh/ssh_host_rsa_key

  exec "$@"

fi

exec "$@" 
