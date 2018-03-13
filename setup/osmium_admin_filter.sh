#! /bin/bash
set -o errexit
set -o pipefail
set -o nounset


ls -la /osm/import_admin/planet.osm.pbf

osmium cat -v  --no-progress /osm/import_admin/planet.osm.pbf -t way -t relation -f opl | grep -E 'ISO3166-1=|ISO3166-2=' | grep admin_level= | grep boundary=administrative |  cut  -d ' ' -f1 >  /osm/import_admin/planet_ids.txt

ls -la /osm/import_admin/planet_ids.txt
head   /osm/import_admin/planet_ids.txt
rm -f  /osm/import_admin/admin23456iso.osm.pbf

osmium getid -v  --fsync --verbose-ids --no-progress /osm/import_admin/planet.osm.pbf -i /osm/import_admin/planet_ids.txt  --add-referenced --overwrite -o /osm/import_admin/admin23456iso.osm.pbf || true

ls -la /osm/import_admin/admin23456iso.osm.pbf