#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

STARTTIME=$(date +%s)
STARTDATE=$(date +"%Y%m%dT%H%M")

log_file=/osm/cfg/joblog/job_${STARTDATE}.log
exec &> >(tee -a "$log_file")

free -m

#  Start Server processing  -without download
time /osm/sh/osm_split.sh
time /osm/sh/osm_jobinit.sh

# cleaning; because we don't have to much disk space :(
rm -f /osm/cfg/input/area.osm.pbf
rm -f /osm/data/old/taginfo-*

echo "Processing OK"