#! /bin/sh

ln -sf /osm/cfg/img/dbackground.png     /osm/taginfo/web/public/img/mapbg/dbackground.png   
ln -sf /osm/cfg/img/dflag.png           /osm/taginfo/web/public/img/logo/dflag.png
ln -sf /osm/cfg/img/dlogo.png           /osm/taginfo/web/public/img/logo/taginfo.png  
ln -sf /osm/cfg/taginfo-config.json     /osm/taginfo-config.json                     
mkdir -p /osm/taginfo/var/log

cd /osm/taginfo/web

echo "-------------------------------------------------------------"
echo "                                                             "
echo "     external ip:   localhost:$MAPPED_PORT                   " 
echo "                    127.0.0.1:$MAPPED_PORT                   "
echo "                                                             "
echo "-------------------------------------------------------------"

cat /etc/hosts | grep $HOSTNAME
echo "---------------------------"

ruby -r rbconfig -e "RbConfig::CONFIG['LIBS'].include?('jemalloc') ? puts('Ruby is compiled with jemalloc') : warn('JEMALLOC IS MISSING FROM RUBY')"

#RACK_ENV=production puma -w 2 --preload -p 4567
#RUBYOPT=--jit 
RACK_ENV=production puma -p 4567 --preload -t 0:8
#ruby ./taginfo.rb 4567 -s Puma
#ruby ./taginfo.rb 4567