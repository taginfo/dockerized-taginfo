#!/bin/bash

# generated : 2019-12-29:15:53  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Run testservices processing - with download (service_test_process.sh) - step by step 
#######################################


GDNAME="russia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ru-ru /osm/sh/service_test_process.sh && docker-compose restart taginfo-ru-ru 

# generated : 2019-12-29:15:53