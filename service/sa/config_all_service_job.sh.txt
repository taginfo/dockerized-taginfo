#!/bin/bash

# generated : 2019-12-29:16:02  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Download
######################################

time docker-compose  -f docker-compose-job.yml  run  --rm taginfo_download  /osm/sh/osm_download_continent.sh

#######################################
##  Run services processing - step by step 
#######################################


GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-ar /osm/sh/service_process.sh && docker-compose restart taginfo-sa-ar 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-bo /osm/sh/service_process.sh && docker-compose restart taginfo-sa-bo 
GDNAME="brazil" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-br /osm/sh/service_process.sh && docker-compose restart taginfo-sa-br 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-ck /osm/sh/service_process.sh && docker-compose restart taginfo-sa-ck 
GDNAME="chile" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-cl /osm/sh/service_process.sh && docker-compose restart taginfo-sa-cl 
GDNAME="colombia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-co /osm/sh/service_process.sh && docker-compose restart taginfo-sa-co 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-ec /osm/sh/service_process.sh && docker-compose restart taginfo-sa-ec 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-fk /osm/sh/service_process.sh && docker-compose restart taginfo-sa-fk 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-fr-cp /osm/sh/service_process.sh && docker-compose restart taginfo-sa-fr-cp 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-fr-gf /osm/sh/service_process.sh && docker-compose restart taginfo-sa-fr-gf 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-fr-pf /osm/sh/service_process.sh && docker-compose restart taginfo-sa-fr-pf 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-gs /osm/sh/service_process.sh && docker-compose restart taginfo-sa-gs 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-gy /osm/sh/service_process.sh && docker-compose restart taginfo-sa-gy 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-nl-aw /osm/sh/service_process.sh && docker-compose restart taginfo-sa-nl-aw 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-nl-cw /osm/sh/service_process.sh && docker-compose restart taginfo-sa-nl-cw 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-nu /osm/sh/service_process.sh && docker-compose restart taginfo-sa-nu 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-pe /osm/sh/service_process.sh && docker-compose restart taginfo-sa-pe 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-pn /osm/sh/service_process.sh && docker-compose restart taginfo-sa-pn 
GDNAME="paraguay" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-py /osm/sh/service_process.sh && docker-compose restart taginfo-sa-py 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-sr /osm/sh/service_process.sh && docker-compose restart taginfo-sa-sr 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-tk /osm/sh/service_process.sh && docker-compose restart taginfo-sa-tk 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-to /osm/sh/service_process.sh && docker-compose restart taginfo-sa-to 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-us-as /osm/sh/service_process.sh && docker-compose restart taginfo-sa-us-as 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-us-um /osm/sh/service_process.sh && docker-compose restart taginfo-sa-us-um 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-uy /osm/sh/service_process.sh && docker-compose restart taginfo-sa-uy 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-ve /osm/sh/service_process.sh && docker-compose restart taginfo-sa-ve 
GDNAME="south-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-sa-ws /osm/sh/service_process.sh && docker-compose restart taginfo-sa-ws 

# generated : 2019-12-29:16:02