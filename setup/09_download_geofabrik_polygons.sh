#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

cd ./import_admin

echo CONTINENT_LONG=$CONTINENT_LONG
echo CONTINENT=$CONTINENT 

rm -f  *.kml 

function import {
 continent=$1
 echo "-------- ${continent} ----------- "
 wget http://download.geofabrik.de/${continent}.kml
 ogr2ogr -f "PostgreSQL" PG:"dbname=$PGDATABASE user=$PGUSER" ${continent}.kml -nln KMLX_CONTINENT -overwrite
 echo "=================================="
}

import $CONTINENT_LONG
cd ..