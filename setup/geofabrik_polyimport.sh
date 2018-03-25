#! /bin/bash
set -o errexit
set -o pipefail
set -o nounset

mkdir -p /osm/data/kml

cd  /osm/data/kml
#rm -f *.poly
rm -f *.kml
rm -f *.yml
rm -f *.txt

echo "Update download-geofabrik metafile"

cp /tools/geofabrik.yml  /osm/data/kml/

echo "Parsing metafile"
cat geofabrik.yml | yq -r '."elements" | .[] | .id ' | grep -v "^us$" | grep -Ev "^$" > geofabrik.txt
awk '{ print "/tools/download-geofabrik download -k  "  $0  }' geofabrik.txt > polydown.txt
cat polydown.txt | bash -

