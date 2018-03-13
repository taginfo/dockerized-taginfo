#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

# data http://www.naturalearthdata.com/downloads/10m-raster-data/10m-natural-earth-1/
# Natural Earth I with Shaded Relief, Water, and Drainages

cd /osm/ne

# first time run: 2x
if [ ! -f NE1_HR_LC_SR_W_DR.zip ]; then
    echo "Download Natural Earth Raster data  "
    wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE1_HR_LC_SR_W_DR.zip
fi

unzip NE1_HR_LC_SR_W_DR.zip

rm -f ne.*
cp  ./NE1_HR_LC_SR_W_DR.prj ./ne.prj
cp  ./NE1_HR_LC_SR_W_DR.tfw ./ne.tfw
cp  ./NE1_HR_LC_SR_W_DR.tif ./ne.tif

ls -la /osm/ne/*
