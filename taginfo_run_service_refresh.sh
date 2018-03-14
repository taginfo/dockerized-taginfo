#!/bin/bash


set -o errexit
set -o pipefail
set -o nounset

CONTINENT_LONG=$1
CONTINENT=$2
PORT=$3


tpwd=`pwd`
wget https://download.geofabrik.de/${CONTINENT_LONG}-latest.osm.pbf.md5  -O ${tpwd}/import/${CONTINENT_LONG}_upstream.md5
cat ${tpwd}/import/${CONTINENT_LONG}_upstream.md5


if [ ! -f ${tpwd}/import/${CONTINENT_LONG}_processed.md5 ]; then
    echo "first install " > ${tpwd}/import/${CONTINENT_LONG}_processed.md5
fi


file1=`cat ${tpwd}/import/${CONTINENT_LONG}_processed.md5`
file2=`cat ${tpwd}/import/${CONTINENT_LONG}_upstream.md5`

echo "-----------------------"
echo "processed::    ${file1}"
echo "upstream ::    ${file2}"
echo "-----------------------"

if [ "$file1" = "$file2" ]
then
    echo "MD5Sum Files have the same content, no upstream changes "
else
    echo "Different MD5sum files ... "
    rm -f  ${tpwd}/import/${CONTINENT_LONG}.osm.pbf
    cd ${tpwd}/service/${CONTINENT} && ./service_job.sh && cd ${tpwd}
    cp ${tpwd}/import/${CONTINENT_LONG}_upstream.md5 ${tpwd}/import/${CONTINENT_LONG}_processed.md5
fi


