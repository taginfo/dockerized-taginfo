#!/bin/bash

# generated : 2019-12-29:15:51  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Download
######################################

time docker-compose  -f docker-compose-job.yml  run  --rm taginfo_download  /osm/sh/osm_download_continent.sh

#######################################
##  Run services processing - step by step 
#######################################


GDNAME="north-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-na-bm /osm/sh/service_process.sh && docker-compose restart taginfo-na-bm 
GDNAME="north-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-na-ca /osm/sh/service_process.sh && docker-compose restart taginfo-na-ca 
GDNAME="canada" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-na-fr-pm /osm/sh/service_process.sh && docker-compose restart taginfo-na-fr-pm 
GDNAME="greenland" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-na-gl /osm/sh/service_process.sh && docker-compose restart taginfo-na-gl 
GDNAME="north-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-na-mx /osm/sh/service_process.sh && docker-compose restart taginfo-na-mx 
GDNAME="north-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-na-us /osm/sh/service_process.sh && docker-compose restart taginfo-na-us 

# generated : 2019-12-29:15:51