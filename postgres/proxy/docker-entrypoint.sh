#!/bin/sh -ex

if [ "basename $1" = "sshd"]; then
  exec "$@"
fi

exec "$@" 
