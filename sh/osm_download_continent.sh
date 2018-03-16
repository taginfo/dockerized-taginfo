#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

cd /osm/import
/tools/download-geofabrik update
/tools/download-geofabrik download $CONTINENT_LONG
# osmium add-locations-to-ways  --ignore-missing-nodes  -v -O -i sparse_file_array -n -o ${CONTINENT_LONG}.ltw.osm.pbf  ${CONTINENT_LONG}.osm.pbf 

ls -la 

echo "Download OK"