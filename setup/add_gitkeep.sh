#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

CONTINENT=$1
ISO=$2

mkdir -p /osm/service/${CONTINENT}/${ISO}/data/
mkdir -p /osm/service/${CONTINENT}/${ISO}/download/
mkdir -p /osm/service/${CONTINENT}/${ISO}/img/
mkdir -p /osm/service/${CONTINENT}/${ISO}/input/
mkdir -p /osm/service/${CONTINENT}/${ISO}/joblog/
mkdir -p /osm/service/${CONTINENT}/${ISO}/poly/
mkdir -p /osm/service/${CONTINENT}/${ISO}/sources/
    
touch /osm/service/${CONTINENT}/${ISO}/data/.gitkeep
touch /osm/service/${CONTINENT}/${ISO}/download/.gitkeep
touch /osm/service/${CONTINENT}/${ISO}/input/.gitkeep
touch /osm/service/${CONTINENT}/${ISO}/joblog/.gitkeep
touch /osm/service/${CONTINENT}/${ISO}/poly/.gitkeep
touch /osm/service/${CONTINENT}/${ISO}/sources/.gitkeep

