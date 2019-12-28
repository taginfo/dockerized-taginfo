#! /bin/bash
set -o errexit
set -o pipefail
set -o nounset

OSMIUM_POOL_THREADS=$(nproc --ignore=4)

ls -la /osm/import_admin/planet.osm.pbf

echo "get iso codes from planet.osm.pbf"
time osmium cat -v  --no-progress /osm/import_admin/planet.osm.pbf -t way -t relation -f opl | grep -E 'ISO3166-1=|ISO3166-2=' | grep admin_level= | grep boundary=administrative |  cut  -d ' ' -f1 >  /osm/import_admin/planet_ids.txt

# add fixes node/way/relation -id ..
echo "add nodes from fixes"
osmium cat --no-progress /osm/setup/fix/*.osm.xml -f xml | grep 'type="node"' | cut -d'"' -f 4 | sed -e 's/^/n/' | sort  >> /osm/import_admin/planet_ids.txt || true
echo "add ways from fixes"
osmium cat --no-progress /osm/setup/fix/*.osm.xml -f xml | grep 'type="way"' | cut -d'"' -f 4 | sed -e 's/^/w/' | sort  >> /osm/import_admin/planet_ids.txt || true
echo "add relations from fixes"
osmium cat --no-progress /osm/setup/fix/*.osm.xml -f xml | grep 'type="relation"' | cut -d'"' -f 4 | sed -e 's/^/r/' | sort  >> /osm/import_admin/planet_ids.txt || true

echo "add extra osm ids"
cat  /osm/setup/fix/extra_planet_ids.txt >> /osm/import_admin/planet_ids.txt

ls -la /osm/import_admin/planet_ids.txt

head   /osm/import_admin/planet_ids.txt
tail   /osm/import_admin/planet_ids.txt

rm -f  /osm/import_admin/admin23456iso*.osm.pbf

echo "osmium getid ..."
time osmium getid /osm/import_admin/planet.osm.pbf \
   --add-referenced \
   --id-file /osm/import_admin/planet_ids.txt \
   --overwrite \
   --progress \
   --verbose \
   --verbose-ids \
   --output-format osm.pbf,add_metadata=false \
   --output /osm/import_admin/admin23456iso.osm.pbf || true

ls -la /osm/import_admin/admin23456iso.osm.pbf