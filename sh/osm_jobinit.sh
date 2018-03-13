#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

# first time run: 2x
if [ ! -f /osm/data/taginfo-db.db ]; then
    echo "File not found:  /osm/data/taginfo-db.db  Extra processing! "
    time /osm/sh/00_tagprocess.sh
    echo "Extra procesing OK"
fi

time /osm/sh/00_tagprocess.sh
echo "Normal proessing OK"