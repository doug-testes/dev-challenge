#!/bin/bash

RAILS_PORT=3001

wait_for() {
  host="$1"
  port="$2"
  while ! nc -z ${host} ${port}; do
#    echo "Waiting for $host $port"
    sleep 1
  done
}

wait_for postgres 5432

# Remove pids
/bin/rm -f /app/tmp/pids/server.pid \
           /app/tmp/pids/puma.pid

# Initialize Ruby on Rails
exec /app/bin/rails server -b 0.0.0.0 -p ${RAILS_PORT}