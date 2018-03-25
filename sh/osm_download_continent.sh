#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

cd /osm/import

# delete geofabrik.yml metedata if older than 7 days.
find . -name "geofabrik.yml" -mtime +7  -exec rm -f {} \;
if [ ! -f geofabrik.yml ]; then
    echo "metadata: geofabrik.yml file not found, we re-generate "
    time /tools/download-geofabrik generate
fi

/tools/download-geofabrik download $CONTINENT_LONG
# osmium add-locations-to-ways  --ignore-missing-nodes  -v -O -i sparse_file_array -n -o ${CONTINENT_LONG}.ltw.osm.pbf  ${CONTINENT_LONG}.osm.pbf 

ls -la 

echo "Download OK"