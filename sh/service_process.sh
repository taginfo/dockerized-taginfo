#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

#  Start Server processing  -without download
time /osm/sh/osm_split.sh
time /osm/sh/osm_jobinit.sh

echo "Processing OK"