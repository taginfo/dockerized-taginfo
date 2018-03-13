#! /bin/sh

ln -sf /osm/cfg/img/dbackground.png     /osm/taginfo/web/public/img/mapbg/dbackground.png   
ln -sf /osm/cfg/img/dflag.png           /osm/taginfo/web/public/img/logo/dflag.png
ln -sf /osm/cfg/img/dlogo.png           /osm/taginfo/web/public/img/logo/taginfo.png  
ln -sf /osm/cfg/taginfo-config.json     /osm/taginfo-config.json                     

cd /osm/taginfo/web

echo "-------------------------------------------------------------"
echo "                                                             "
echo "     external ip:   localhost:$MAPPED_PORT                   " 
echo "                    127.0.0.1:$MAPPED_PORT                   "
echo "                                                             "
echo "-------------------------------------------------------------"

cat /etc/hosts | grep $HOSTNAME
echo "---------------------------"
./taginfo.rb 4567