#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

# filter  OSM  PLANET file for admin data
echo "START: /osm/setup/osmium_admin_filter.sh"
/osm/setup/osmium_admin_filter.sh

# Import OSM admin polygons
echo "START: /osm/setup/20_import_db.sh"
/osm/setup/20_import_db.sh /osm/import_admin/admin23456iso.osm.pbf

# Download Geofabrik Polygons (kml)
echo "START: /osm/setup/geofabrik_polyimport.sh"
/osm/setup/geofabrik_polyimport.sh

# Import Geofabrik polygons to Postgis
echo "START /osm/setup/import_kml2pg.sh"
/osm/setup/import_kml2pg.sh

