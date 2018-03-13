#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

cd /osm/import
/tools/download-geofabrik update
/tools/download-geofabrik download $GDNAME
ls -la 

echo "Download OK"