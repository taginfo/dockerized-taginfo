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
#/tools/download-geofabrik update
cp /tools/geofabrik.yml  /osm/data/kml/

echo "Parsing metafile"
cat geofabrik.yml | yq -r '."elements" | .[] | .id ' | grep -v "^us$" | grep -Ev "^$" > geofabrik.txt
awk '{ print "/tools/download-geofabrik download -k  "  $0  }' geofabrik.txt > polydown.txt
cat polydown.txt | bash -


# sed -i 's/ext: poly/ext: kml/g'   geofabrik.yml
# sed -i 's/loc: .poly/loc: .kml/g' geofabrik.yml
# awk '{ print "/tools/download-geofabrik download -p  "  $0  }' geofabrik.txt > polydown.txt
# cat polydown.txt | bash -
# for j in *.poly; do mv -- "$j" "${j%.poly}.kml"; done
