#!/bin/bash

# generated : 2019-12-29:14:52  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Run testservices processing - with download (service_test_process.sh) - step by step 
#######################################


GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-ag /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-ag 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-ai /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-ai 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-bb /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-bb 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-bq /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-bq 
GDNAME="bahamas" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-bs /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-bs 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-bz /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-bz 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-cr /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-cr 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-cu /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-cu 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-dm /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-dm 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-do /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-do 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-fr-bl /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-fr-bl 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-fr-mf /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-fr-mf 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-fr-mq /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-fr-mq 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-gd /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-gd 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-gp /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-gp 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-gt /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-gt 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-hn /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-hn 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-ht /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-ht 
GDNAME="jamaica" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-jm /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-jm 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-kn /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-kn 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-ky /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-ky 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-lc /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-lc 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-ms /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-ms 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-ni /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-ni 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-nl-aw /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-nl-aw 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-nl-cw /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-nl-cw 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-nl-sx /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-nl-sx 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-sv /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-sv 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-tc /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-tc 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-tt /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-tt 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-vc /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-vc 
GDNAME="central-america" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ca-vg /osm/sh/service_test_process.sh && docker-compose restart taginfo-ca-vg 

# generated : 2019-12-29:14:52