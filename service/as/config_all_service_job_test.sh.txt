#!/bin/bash

# generated : 2019-12-29:15:25  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Run testservices processing - with download (service_test_process.sh) - step by step 
#######################################


GDNAME="gcc-states" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-ae /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-ae 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-af /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-af 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-am /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-am 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-az /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-az 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-bd /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-bd 
GDNAME="gcc-states" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-bh /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-bh 
GDNAME="malaysia-singapore-brunei" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-bn /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-bn 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-bt /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-bt 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-cn /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-cn 
GDNAME="europe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-ge /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-ge 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-id /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-id 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-il /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-il 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-in /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-in 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-io /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-io 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-iq /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-iq 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-ir /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-ir 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-jo /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-jo 
GDNAME="japan" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-jp /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-jp 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-kg /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-kg 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-kh /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-kh 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-kp /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-kp 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-kr /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-kr 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-kw /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-kw 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-kz /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-kz 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-la /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-la 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-lb /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-lb 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-lk /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-lk 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-mm /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-mm 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-mn /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-mn 
GDNAME="maldives" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-mv /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-mv 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-my /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-my 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-np /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-np 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-om /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-om 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-ph /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-ph 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-pk /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-pk 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-qa /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-qa 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-sa /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-sa 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-sg /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-sg 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-sy /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-sy 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-th /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-th 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-tj /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-tj 
GDNAME="indonesia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-tl /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-tl 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-tm /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-tm 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-tw /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-tw 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-uz /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-uz 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-vn /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-vn 
GDNAME="asia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-as-ye /osm/sh/service_test_process.sh && docker-compose restart taginfo-as-ye 

# generated : 2019-12-29:15:25