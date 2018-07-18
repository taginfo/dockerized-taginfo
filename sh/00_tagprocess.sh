#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset



ln -sf /osm/cfg/img/dbackground.png     /osm/taginfo/web/public/img/mapbg/dbackground.png   
ln -sf /osm/cfg/img/dflag.png           /osm/taginfo/web/public/img/logo/dflag.png
ln -sf /osm/cfg/img/dlogo.png           /osm/taginfo/web/public/img/logo/taginfo.png  
ln -sf /osm/cfg/taginfo-config.json     /osm/taginfo-config.json                     


mkdir -p /osm/data/old



cd /osm/taginfo/sources

if [ -f "/osm/data/taginfo-history.db" ]
then
    cp /osm/data/taginfo-history.db /osm/sources
fi

/osm/taginfo/sources/update_all.sh /osm/sources

if [ -f "/osm/data/taginfo-history.db" ]
then
    mv /osm/data/taginfo-*                                          /osm/data/old
fi


mv /osm/sources/taginfo-*.db    /osm/sources/*/taginfo-*.db     /osm/data
mv /osm/sources/download/*                                      /osm/download

# copy .xlsx files to the download directory  
cp /osm/sources/*/*.xlsx                                        /osm/download

find /osm/sources/log -mtime +7 -delete

chmod 644 /osm/data/*.*
chmod 644 /osm/download/*.*

