#!/bin/sh -e

if ["$1" = "sshd"]; then
  exec "$@"
fi

exec "$@"
