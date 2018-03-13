#!/bin/bash


set -o errexit
set -o pipefail
set -o nounset

max_tries=120
tries=0
while ! pg_isready -q
do
    tries=$((tries + 1))
    if [ $tries -gt $max_tries ]; then
        echo "... Gave up , No connections with PostgreSQL  !  "
        exit 1  
    fi    
    sleep 1
done
