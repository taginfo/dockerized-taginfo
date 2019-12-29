#!/bin/bash

# generated : 2019-12-29:15:14  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Download
######################################

time docker-compose  -f docker-compose-job.yml  run  --rm taginfo_download  /osm/sh/osm_download_continent.sh

#######################################
##  Run services processing - step by step 
#######################################


GDNAME="antarctica" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-aq-aq /osm/sh/service_process.sh && docker-compose restart taginfo-aq-aq 

# generated : 2019-12-29:15:14