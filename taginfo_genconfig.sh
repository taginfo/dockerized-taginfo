#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

CONTINENT_LONG=$1
CONTINENT=$2
START_PORT=$3
DOMAIN=$(cat DOMAIN)
ISO_FILTER=$4
ISO_SERVICE_FILTER=$5


echo ":: clean directory"
docker-compose run --rm -T taginfo_dev  rm -rf /osm/service/$CONTINENT


mkdir -p ./service/$CONTINENT/
log_file=./service/$CONTINENT/taginfo_genconfig.log
rm -f $log_file
#  backup log from here ...
exec &> >(tee -a "$log_file")

STARTTIME=$(date +%s)
STARTDATE=$(date +"%Y%m%dT%H%M")
echo "========================================="
echo "DATETIME=$STARTDATE  $STARTTIME"
echo "CONTINENT_LONG=$CONTINENT_LONG"
echo "CONTINENT=$CONTINENT"
echo "START_PORT=$START_PORT"
echo "DOMAIN=$DOMAIN"
echo "ISO_FILTER=$ISO_FILTER"
echo "ISO_SERVICE_FILTER=$ISO_SERVICE_FILTER"
echo "========================================="


echo ":: gen new configs"
docker-compose run \
                -e CONTINENT_LONG=$CONTINENT_LONG  \
                -e CONTINENT=$CONTINENT \
                -e DOMAIN=$DOMAIN \
                -e START_PORT=$START_PORT \
                -e ISO_FILTER="${ISO_FILTER}" \
                -e ISO_SERVICE_FILTER="${ISO_SERVICE_FILTER}" \
                --rm \
                -T \
                taginfo_dev  /osm/setup/r_admin.sh

echo ":: generated services"
cat ./service/$CONTINENT/service_create.sh


echo ":: don't forget copy hugo files"
#docker-compose run --rm -T taginfo_dev mkdir -p ./hugo/taginfo/content/$CONTINENT_LONG/
#docker-compose run --rm -T taginfo_dev cp  ./service/$CONTINENT/service_index.md     ./hugo/taginfo/content/$CONTINENT_LONG/index.md

