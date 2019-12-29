#!/bin/bash

# generated : 2019-12-29:15:08  // template : ./setup/template/job.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 

#######################################
##  Download
######################################

time docker-compose  -f docker-compose-job.yml  run  --rm taginfo_download  /osm/sh/osm_download_continent.sh

#######################################
##  Run services processing - step by step 
#######################################


GDNAME="angola" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ao /osm/sh/service_process.sh && docker-compose restart taginfo-af-ao 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-bf /osm/sh/service_process.sh && docker-compose restart taginfo-af-bf 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-bi /osm/sh/service_process.sh && docker-compose restart taginfo-af-bi 
GDNAME="benin" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-bj /osm/sh/service_process.sh && docker-compose restart taginfo-af-bj 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-bv /osm/sh/service_process.sh && docker-compose restart taginfo-af-bv 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-bw /osm/sh/service_process.sh && docker-compose restart taginfo-af-bw 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-cd /osm/sh/service_process.sh && docker-compose restart taginfo-af-cd 
GDNAME="central-african-republic" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-cf /osm/sh/service_process.sh && docker-compose restart taginfo-af-cf 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-cg /osm/sh/service_process.sh && docker-compose restart taginfo-af-cg 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ci /osm/sh/service_process.sh && docker-compose restart taginfo-af-ci 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-cm /osm/sh/service_process.sh && docker-compose restart taginfo-af-cm 
GDNAME="cape-verde" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-cv /osm/sh/service_process.sh && docker-compose restart taginfo-af-cv 
GDNAME="djibouti" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-dj /osm/sh/service_process.sh && docker-compose restart taginfo-af-dj 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-dz /osm/sh/service_process.sh && docker-compose restart taginfo-af-dz 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-eg /osm/sh/service_process.sh && docker-compose restart taginfo-af-eg 
GDNAME="eritrea" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-er /osm/sh/service_process.sh && docker-compose restart taginfo-af-er 
GDNAME="spain" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-es-ce /osm/sh/service_process.sh && docker-compose restart taginfo-af-es-ce 
GDNAME="canary-islands" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-es-cn /osm/sh/service_process.sh && docker-compose restart taginfo-af-es-cn 
GDNAME="canary-islands" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-es-gc /osm/sh/service_process.sh && docker-compose restart taginfo-af-es-gc 
GDNAME="spain" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-es-ml /osm/sh/service_process.sh && docker-compose restart taginfo-af-es-ml 
GDNAME="canary-islands" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-es-tf /osm/sh/service_process.sh && docker-compose restart taginfo-af-es-tf 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-et /osm/sh/service_process.sh && docker-compose restart taginfo-af-et 
GDNAME="mayotte" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-fr-may /osm/sh/service_process.sh && docker-compose restart taginfo-af-fr-may 
GDNAME="mayotte" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-fr-yt /osm/sh/service_process.sh && docker-compose restart taginfo-af-fr-yt 
GDNAME="gabon" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ga /osm/sh/service_process.sh && docker-compose restart taginfo-af-ga 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-gh /osm/sh/service_process.sh && docker-compose restart taginfo-af-gh 
GDNAME="senegal-and-gambia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-gm /osm/sh/service_process.sh && docker-compose restart taginfo-af-gm 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-gn /osm/sh/service_process.sh && docker-compose restart taginfo-af-gn 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-gq /osm/sh/service_process.sh && docker-compose restart taginfo-af-gq 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-gw /osm/sh/service_process.sh && docker-compose restart taginfo-af-gw 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ke /osm/sh/service_process.sh && docker-compose restart taginfo-af-ke 
GDNAME="comores" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-km /osm/sh/service_process.sh && docker-compose restart taginfo-af-km 
GDNAME="liberia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-lr /osm/sh/service_process.sh && docker-compose restart taginfo-af-lr 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ls /osm/sh/service_process.sh && docker-compose restart taginfo-af-ls 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ly /osm/sh/service_process.sh && docker-compose restart taginfo-af-ly 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ma /osm/sh/service_process.sh && docker-compose restart taginfo-af-ma 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-mg /osm/sh/service_process.sh && docker-compose restart taginfo-af-mg 
GDNAME="mali" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ml /osm/sh/service_process.sh && docker-compose restart taginfo-af-ml 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-mr /osm/sh/service_process.sh && docker-compose restart taginfo-af-mr 
GDNAME="mauritius" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-mu /osm/sh/service_process.sh && docker-compose restart taginfo-af-mu 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-mw /osm/sh/service_process.sh && docker-compose restart taginfo-af-mw 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-mz /osm/sh/service_process.sh && docker-compose restart taginfo-af-mz 
GDNAME="namibia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-na /osm/sh/service_process.sh && docker-compose restart taginfo-af-na 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ne /osm/sh/service_process.sh && docker-compose restart taginfo-af-ne 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ng /osm/sh/service_process.sh && docker-compose restart taginfo-af-ng 
GDNAME="reunion" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-re /osm/sh/service_process.sh && docker-compose restart taginfo-af-re 
GDNAME="rwanda" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-rw /osm/sh/service_process.sh && docker-compose restart taginfo-af-rw 
GDNAME="seychelles" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-sc /osm/sh/service_process.sh && docker-compose restart taginfo-af-sc 
GDNAME="sudan" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-sd /osm/sh/service_process.sh && docker-compose restart taginfo-af-sd 
GDNAME="saint-helena-ascension-and-tristan-da-cunha" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-sh /osm/sh/service_process.sh && docker-compose restart taginfo-af-sh 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-sl /osm/sh/service_process.sh && docker-compose restart taginfo-af-sl 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-sn /osm/sh/service_process.sh && docker-compose restart taginfo-af-sn 
GDNAME="somalia" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-so /osm/sh/service_process.sh && docker-compose restart taginfo-af-so 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ss /osm/sh/service_process.sh && docker-compose restart taginfo-af-ss 
GDNAME="sao-tome-and-principe" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-st /osm/sh/service_process.sh && docker-compose restart taginfo-af-st 
GDNAME="swaziland" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-sz /osm/sh/service_process.sh && docker-compose restart taginfo-af-sz 
GDNAME="chad" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-td /osm/sh/service_process.sh && docker-compose restart taginfo-af-td 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-tg /osm/sh/service_process.sh && docker-compose restart taginfo-af-tg 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-tn /osm/sh/service_process.sh && docker-compose restart taginfo-af-tn 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-tz /osm/sh/service_process.sh && docker-compose restart taginfo-af-tz 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-ug /osm/sh/service_process.sh && docker-compose restart taginfo-af-ug 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-yt /osm/sh/service_process.sh && docker-compose restart taginfo-af-yt 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-za /osm/sh/service_process.sh && docker-compose restart taginfo-af-za 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-zm /osm/sh/service_process.sh && docker-compose restart taginfo-af-zm 
GDNAME="africa" docker-compose  -f docker-compose-job.yml run --rm taginfo-job-af-zw /osm/sh/service_process.sh && docker-compose restart taginfo-af-zw 

# generated : 2019-12-29:15:08