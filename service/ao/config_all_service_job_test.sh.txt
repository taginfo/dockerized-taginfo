#!/bin/bash

# generated : 2019-12-29:15:33  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Run testservices processing - with download (service_test_process.sh) - step by step 
#######################################


GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-au /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-au 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-cc /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-cc 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-cx /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-cx 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-fj /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-fj 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-fm /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-fm 
GDNAME="new-caledonia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-fr-nc /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-fr-nc 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-fr-tf /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-fr-tf 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-hm /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-hm 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-ki /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-ki 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-mh /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-mh 
GDNAME="australia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-nf /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-nf 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-nr /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-nr 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-nz /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-nz 
GDNAME="papua-new-guinea" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-pg /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-pg 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-pw /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-pw 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-sb /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-sb 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-tv /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-tv 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-us-gu /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-us-gu 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-us-mp /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-us-mp 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-us-um /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-us-um 
GDNAME="australia-oceania" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-ao-vu /osm/sh/service_test_process.sh && docker-compose restart taginfo-ao-vu 

# generated : 2019-12-29:15:33