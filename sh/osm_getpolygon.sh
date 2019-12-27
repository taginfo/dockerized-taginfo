#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace
#  /osm/sh/osm_getpolygon.sh bp.osm.pbf r21335

output=$1
osmium_id=$2
temposm=${1}.temp.osm.xml


rm -f $temposm

# first pass - remove subarea,label,admin_centre roles
osmium getid /osm/import_admin/admin23456iso.osm.pbf -r --remove-tags -f xml ${osmium_id} | \
  egrep -v -e '<member type=".*" ref=".*" role=("admin_centre"|"label"|"subarea")/>' > $temposm

# second pass
osmium getid $temposm -r --overwrite --output=${output}  ${osmium_id} 

rm -f $temposm

chmod 644 $1
echo "End of osm_getpolygon.sh $1 $2 "
