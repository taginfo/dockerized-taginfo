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

find /osm/sources/log -mtime +7 -delete

chmod 644 /osm/data/*.*
chmod 644 /osm/download/*.*



##TAGINFO_BUILD_DIR=/osm/taginfo/var/sources
##TAGINFO_INSTALL_DIR=/osm/data
##TAGINFO_DOWNLOAD_DIR=/osm/download

# cp /osm/cfg/taginfo-config.json   /osm/taginfo-config.json   


#FILE_TAGSTATS=/osm/taginfo/tagstats/tagstats
#if [ -f $FILE_TAGSTATS  ];
#then
#   echo "------------------------------------"
#   echo "File $FILE_TAGSTATS  exists."
#   echo "------------------------------------"   
#else
#   echo "------------------------------------"
#   echo "File $FILE_TAGSTATS  does not exist."
#   cd /osm/taginfo/tagstats 
#   make clean
#   make
#   echo "------------------------------------"   
#fi

#mkdir -p /osm/cfg/joblog
#mkdir -p /osm/taginfo/var/sources/log

#mkdir -p ${TAGINFO_BUILD_DIR}
#mkdir -p ${TAGINFO_INSTALL_DIR}
#mkdir -p ${TAGINFO_INSTALL_DIR}/old
#mkdir -p ${TAGINFO_DOWNLOAD_DIR}


#chmod g+s ${TAGINFO_BUILD_DIR}
#chmod g+s ${TAGINFO_INSTALL_DIR}
#chmod g+s ${TAGINFO_INSTALL_DIR}/old
#chmod g+s ${TAGINFO_DOWNLOAD_DIR}

#chmod g+s /osm/taginfo_data/cfg/poly/
#chmod g+s /osm/taginfo_data/cfg/input/








##./update_all.sh ${TAGINFO_BUILD_DIR}
##
##cp /osm/taginfo/var/sources/log/*  /osm/cfg/joblog/
##chmod 644 /osm/cfg/joblog/*

#mv -v  ${TAGINFO_INSTALL_DIR}/taginfo-*         ${TAGINFO_INSTALL_DIR}/old/
#mv -v  ${TAGINFO_BUILD_DIR}/taginfo-*.db        ${TAGINFO_INSTALL_DIR}
#mv -v  ${TAGINFO_BUILD_DIR}/*/taginfo-*.db      ${TAGINFO_INSTALL_DIR}
#mv -v  ${TAGINFO_BUILD_DIR}/download/*          ${TAGINFO_DOWNLOAD_DIR}

###find  ${TAGINFO_INSTALL_DIR}        -maxdepth 1 -name "taginfo-*"      -type f  -exec mv {}  ${TAGINFO_INSTALL_DIR}/old/ \;
###find  ${TAGINFO_BUILD_DIR}          -maxdepth 1 -name "taginfo-*.db"   -type f  -exec mv {}  ${TAGINFO_INSTALL_DIR} \;
###find  ${TAGINFO_BUILD_DIR}/*        -maxdepth 1 -name "taginfo-*.db"   -type f  -exec mv {}  ${TAGINFO_INSTALL_DIR} \;
###find  ${TAGINFO_BUILD_DIR}/download -maxdepth 1 -name "*"              -type f  -exec mv {}  ${TAGINFO_DOWNLOAD_DIR} \;

 #  find   /osm/data -maxdepth 1 -name "taginfo-*"      -type f 

#chmod 644 ${TAGINFO_INSTALL_DIR}/*.db
#chmod 644 ${TAGINFO_DOWNLOAD_DIR}/*.db

