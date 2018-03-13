#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

#  Start Local processing, with download , split, processing ..

time /osm/sh/osm_download.sh
time /osm/sh/osm_split.sh
time /osm/sh/osm_jobinit.sh

echo "Processing OK"