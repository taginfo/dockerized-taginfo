#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

mkdir -p /osm/cfg/data
mkdir -p /osm/cfg/download
mkdir -p /osm/cfg/img
mkdir -p /osm/cfg/input
mkdir -p /osm/cfg/joblog
mkdir -p /osm/cfg/poly


inputpbf=/not_exist_this_files_config_problem.osm.pbf

if   [ -f "/osm/import/${GDNAME}.osm.pbf" ]
then
    inputpbf=/osm/import/${GDNAME}.osm.pbf
    echo "Found: ${inputpbf}"

elif [ -f "/osm/import/${CONTINENT_LONG}.osm.pbf" ]
then
    inputpbf=/osm/import/${CONTINENT_LONG}.osm.pbf
    echo "Found: ${inputpbf}"

elif [ -f "/osm/import/${CONTINENT_LONG}-latest.osm.pbf" ]
then
    inputpbf=/osm/import/${CONTINENT_LONG}-latest.osm.pbf
    echo "Found: ${inputpbf}"

elif [ -f "/osm/import/planet.osm.pbf" ]
then
    inputpbf=/osm/import/planet.osm.pbf
    echo "Found: ${inputpbf}"
else 
    echo "NOT Found any OSM input file!!! ...  error"
    exit 404            
fi

echo "Backup input file osm fileinfo for audit"
osmium fileinfo ${inputpbf} > /osm/cfg/input/input_osm_fileinfo.txt

echo "Start osmium extract"
osmium extract  ${inputpbf} --overwrite  -s simple  -p /osm/cfg/poly/osm.poly -o /osm/cfg/input/area.osm.pbf

chmod 644 /osm/cfg/input/area.osm.pbf

echo "End of osm_split.sh"




