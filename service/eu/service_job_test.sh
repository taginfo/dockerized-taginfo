#!/bin/bash

# generated : 2019-12-29:15:47  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Run testservices processing - with download (service_test_process.sh) - step by step 
#######################################


GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ad /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ad 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-al /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-al 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-at /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-at 
GDNAME="finland" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ax /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ax 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ba /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ba 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-be /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-be 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-bg /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-bg 
GDNAME="belarus" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-by /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-by 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ch /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ch 
GDNAME="cyprus" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-cy /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-cy 
GDNAME="czech-republic" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-cz /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-cz 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-de /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-de 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-dk /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-dk 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ee /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ee 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-es /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-es 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-fi /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-fi 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-fo /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-fo 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-fr-metropolitan /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-fr-metropolitan 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-gb /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-gb 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ge /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ge 
GDNAME="france" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-gg /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-gg 
GDNAME="spain" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-gi /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-gi 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-gr /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-gr 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-hr /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-hr 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-hu /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-hu 
GDNAME="ireland-and-northern-ireland" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ie /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ie 
GDNAME="isle-of-man" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-im /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-im 
GDNAME="iceland" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-is /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-is 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-it /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-it 
GDNAME="france" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-je /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-je 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-li /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-li 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-lt /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-lt 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-lu /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-lu 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-lv /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-lv 
GDNAME="provence-alpes-cote-d-azur" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-mc /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-mc 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-md /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-md 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-me /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-me 
GDNAME="macedonia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-mk /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-mk 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-mt /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-mt 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-nl /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-nl 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-no /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-no 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-pl /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-pl 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-pt /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-pt 
GDNAME="romania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ro /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ro 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-rs /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-rs 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-se /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-se 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-si /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-si 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-sk /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-sk 
GDNAME="italy" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-sm /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-sm 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-tr /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-tr 
GDNAME="ukraine" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-ua /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-ua 
GDNAME="cyprus" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-uk-sba /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-uk-sba 
GDNAME="centro" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-va /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-va 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-eu-xk /osm/sh/service_test_process.sh && docker-compose restart taginfo-eu-xk 

# generated : 2019-12-29:15:47