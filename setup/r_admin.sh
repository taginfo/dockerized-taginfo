#! /bin/bash


#cd /osm/setup
#wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip
#unzip ne_10m_admin_0_countries.zip


/osm/setup/pg_isready.sh

echo CONTINENT_LONG="$CONTINENT_LONG"
echo CONTINENT="$CONTINENT" 
echo START_PORT=$START_PORT
echo DOMAIN=$DOMAIN

mkdir -p /osm/service/${CONTINENT}/
rm -rf /osm/service/${CONTINENT}/*

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
	psql -a   -P pager=off   -f "/osm/setup/setup_xtaginfo_admin.sql"
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
