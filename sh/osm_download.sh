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

/tools/download-geofabrik -v --progress  download $GDNAME
ls -la 

echo "Download OK"