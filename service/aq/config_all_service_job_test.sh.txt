#!/bin/bash

# generated : 2019-12-29:15:14  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Run testservices processing - with download (service_test_process.sh) - step by step 
#######################################


GDNAME="antarctica" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-aq-aq /osm/sh/service_test_process.sh && docker-compose restart taginfo-aq-aq 

# generated : 2019-12-29:15:14