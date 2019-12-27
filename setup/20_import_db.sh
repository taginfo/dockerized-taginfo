#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

inputpbf=$1

echo "$(date) - importing: $inputpbf "

while ! pg_isready
do
    echo "$(date) - waiting for PG database to start"
    sleep 2
done

readonly PG_CONNECT="postgis://"

 echo "============ Start import_admin ================"

  /tools/latest/imposm import \
   -mapping /osm/setup/imposm_admin_mapping.yml  \
   -read $inputpbf \
   -write    \
   -optimize  \
   -srid 4326 \
   -overwritecache \
   -deployproduction \
   -connection $PG_CONNECT

psql -c ""

echo """
    -- remove not administrative boundary;
    delete from osm_admin where boundary !='administrative';
    --
    delete  from osm_admin where admin_level>=7;
    --
    delete  from osm_admin where length(iso3166_1) = 2  and admin_level>=6;

    -- remove some duplicates
    delete  from osm_admin
    where id
    in
    (
     -100000000003777250	--TW
    ,-100000000003777248	--TW
    ,-100000000000290162	--WF
    ,-100000000002470060	--RE
    ,-100000000002473088	--MQ
    ,-100000000002562137	--GP
    ,-100000000002573010	--CP
    ,-100000000002502058    -- FR guyana
    ,-100000000003781240    --  Oman , error ?
    ,-100000000003994012    --  Oman , error ?

    ,-100000000001244004   -- Bp 8
    ,-100000000001944662


    ,-100000000003501887
    ,-100000000007652578
    ,-100000000007652581
    ,-100000000007652580
    ,-100000000007652579

    ,-100000000000269701
    ,-100000000001944662
    ,-100000000007843853
    )
    ;
    --
""" | psql -e



echo """
    -- fix  Fr-metropolitan
    update osm_admin set iso3166_2='fr-metropolitan' WHERE wikidata='Q212429' ;

""" | psql -e

echo """
    -- check duplicates
    select iso3166_1,count(*) as N
    from osm_admin
    where length(iso3166_1) = 2
    group by 1
    order by N desc
    ;
    --
""" | psql -e


 echo "============ import_admin OK ================"