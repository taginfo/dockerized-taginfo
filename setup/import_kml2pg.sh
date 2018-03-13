#! /bin/bash
set -o errexit
set -o pipefail
set -o nounset

cd  /osm/data/kml
echo """
    drop table if exists gkml cascade;
""" | psql -e


for g in *.kml; do
    ogr2ogr -f "PostgreSQL" PG:"dbname=osm user=osm" "$g" -a_srs "EPSG:4326" -s_srs "EPSG:4326" -t_srs "EPSG:4326" -nln gkml -append
    echo """
        update gkml set name='${g%.kml}' where name is null ;
    """ | psql -e
done


echo """
    \d+ gkml
    select name from gkml;

    CREATE INDEX gkml_gix ON gkml USING GIST (wkb_geometry);
    VACUUM ANALYZE gkml;
    CLUSTER gkml USING gkml_gix;

    ;
""" | psql -e