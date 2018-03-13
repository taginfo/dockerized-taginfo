#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

CONTINENT_LONG=$1
CONTINENT=$2
START_PORT=$3
DOMAIN=$(cat DOMAIN)

docker-compose run --rm -T taginfo_dev  rm -rf /osm/service/$CONTINENT
docker-compose run -e CONTINENT_LONG=$CONTINENT_LONG  \
                -e CONTINENT=$CONTINENT \
                -e DOMAIN=$DOMAIN \
                -e START_PORT=$START_PORT \
                --rm -T \
                taginfo_dev  /osm/setup/r_admin.sh
docker-compose run --rm -T taginfo_dev mkdir -p ./hugo/quickstart/content/$CONTINENT_LONG/
docker-compose run --rm -T taginfo_dev cp  ./service/$CONTINENT/service_index.md     ./hugo/quickstart/content/$CONTINENT_LONG/index.md

