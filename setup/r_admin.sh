#! /bin/bash

echo "check db connection"
/osm/setup/pg_isready.sh

echo CONTINENT_LONG="$CONTINENT_LONG"
echo CONTINENT="$CONTINENT" 
echo START_PORT=$START_PORT
echo DOMAIN=$DOMAIN
echo ISO_FILTER=$ISO_FILTER
echo ISO_SERVICE_FILTER=$ISO_SERVICE_FILTER

mkdir -p /osm/service/${CONTINENT}/
#rm -rf /osm/service/${CONTINENT}/*

# import continent polygons   
/osm/setup/09_download_geofabrik_polygons.sh

##  Antarctica  -manual setup, extreme case ...
if [ "$CONTINENT" = "aq" ]; then
    psql -a   -P pager=off   -f "/osm/setup/setup_xtaginfo_antarctica.sql"
    mkdir -p /osm/service/${CONTINENT}/aq/imp/
    mkdir -p /osm/service/${CONTINENT}/aq/data/
    mkdir -p /osm/service/${CONTINENT}/aq/input/
    mkdir -p /osm/service/${CONTINENT}/aq/joblog/
    mkdir -p /osm/service/${CONTINENT}/aq/poly/

    cp /osm/setup/poly/aq-osm.poly       /osm/service/${CONTINENT}/aq/poly/osm.poly 
    cp /osm/setup/poly/aq-osm.geojson    /osm/service/${CONTINENT}/aq/poly/osm.geojson

## Others
else  
    # Posgresql postprocessing - calculating parameters for the config     
	psql -a -e -vISO_FILTER="${ISO_FILTER}"  -vISO_SERVICE_FILTER="${ISO_SERVICE_FILTER}"   -P pager=off   -f "/osm/setup/setup_xtaginfo_admin.sql"

    echo """
    --
      select iso, name_en,area_pct,name,wikidata from osm_admin2_continent_all order by iso ;
    --
    """ | psql -e > /osm/service/${CONTINENT}/available_iso.txt

    python /osm/setup/setup_polygon.py
fi

echo "------start setup_map.py ------"
python /osm/setup/setup_map.py
echo "------start setup_config.py -----"
python /osm/setup/setup_config.py
echo "------start setup_docker.py ----- "
python /osm/setup/setup_docker.py

echo "------chmod settings -----"
find ./service/${CONTINENT}/* -type d -print0 | xargs -0 chmod 0755 # for directories
find ./service/${CONTINENT}/. -type f -print0 | xargs -0 chmod 0644 # for files
chmod +x  /osm/service/${CONTINENT}/*.sh
