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


osmium_parameter=' --index-type=dense_mmap_array '
if [ "$CONTINENT" = "aq" ]; then
  osmium_parameter=' '
fi
if [ "$CONTINENT" = "ca" ]; then
  osmium_parameter=' '
fi
if [ "$CONTINENT" = "af" ]; then
  osmium_parameter=' '
fi

osmium add-locations-to-ways \
    --progress \
    --verbose \
    --ignore-missing-nodes \
    --keep-untagged-nodes \
    ${osmium_parameter} \
    -O -o /osm/import/${CONTINENT_LONG}.addloc2ways.osm.pbf \
    /osm/import/${CONTINENT_LONG}.osm.pbf

rm -rf /osm/import/${CONTINENT_LONG}.osm.pbf.backup
rm -rf /osm/import/${CONTINENT_LONG}.osm.pbf.md5

mv /osm/import/${CONTINENT_LONG}.osm.pbf             /osm/import/${CONTINENT_LONG}.osm.pbf.backup
mv /osm/import/${CONTINENT_LONG}.addloc2ways.osm.pbf /osm/import/${CONTINENT_LONG}.osm.pbf
ls -la

echo "Download OK"