.PHONY: all

# Build using Bash script semantics.
SHELL := /bin/bash

CURRENT_UID:=$(shell echo $$(id -u):$$(id -g))
export CURRENT_UID

all: drefresh build

test: inituid build travis_geofabrik_yml testdatainit init ca-zz-genservices down rmdebugimages ca-zz-test peakcheck


status:
	echo "CURRENT_UID=$$CURRENT_UID"

drefresh:
	docker pull abiosoft/caddy
	docker pull ruby:2.7-alpine
	docker pull jwilder/nginx-proxy
	docker pull jwilder/whoami
	docker pull mdillon/postgis:11-alpine
	docker pull ubuntu:20.04

inituid:
	mkdir -p ./caddy
	mkdir -p ./dev_data
	mkdir -p ./dev_data/ca/ni/data
	mkdir -p ./hugo/taginfo
	mkdir -p ./import
	mkdir -p ./import_admin
	mkdir -p ./ne
	mkdir -p ./service

chmoddir:
	sudo chmod -R a+rw ./caddy
	sudo chmod -R a+rw ./dev_data
	sudo chmod -R a+rw ./import
	sudo chmod -R a+rw ./import_admin
	sudo chmod -R a+rw ./service


build:
	cd ./docker && docker build --build-arg host_uid=$$(id -u) --build-arg host_gid=$$(id -g) -t taginfo_job  -f taginfo_job.Dockerfile  . && cd ..
	cd ./docker && docker build --build-arg host_uid=$$(id -u) --build-arg host_gid=$$(id -g) -t taginfo_view -f taginfo_view.Dockerfile . && cd ..
	docker images | grep taginfo

dev:
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose run --rm taginfo_dev /bin/bash

dev_view:
	docker run -it --rm taginfo_view sh


cleanold:
	sudo rm  ./service/*/*/data/old/*
	sudo rm  ./service/*/*/input/area.osm.pbf
	df -h | grep /dev

down:
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose down

testdatainit:
	mkdir -p ./ne
	cp ./testdata/planet.osm.pbf  ./import_admin/
	cp ./testdata/NE1_50M_SR.zip  ./ne/
	cd ./ne && unzip -o NE1_50M_SR.zip
	cp ./ne/NE1_50M_SR/NE1_50M_SR.tif  ./ne/ne.tif
	cp ./ne/NE1_50M_SR/NE1_50M_SR.prj  ./ne/ne.prj
	cp ./ne/NE1_50M_SR/NE1_50M_SR.tfw  ./ne/ne.tfw
	ls ./ne/* -la

ca-zz-genservices:
	./taginfo_genconfig.sh  central-america    zz  30000    "where iso in ('ni','nl-sx')"        "1=1 "

ca-zz-test:
	cd ./service/zz && ./service_create.sh 	&& cd ../..
	cd ./service/zz && ./service_job.sh     && cd ../..
	cd ./service/zz && ./service_down.sh 	&& cd ../..


naturalearth:
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose run --rm -T taginfo_dev /osm/setup/natural_earth_download.sh

init:
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose run --rm -T taginfo_dev /osm/setup/init.sh

travis_geofabrik_yml:
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose run --rm -T taginfo_dev bash -c "cp /tools/geofabrik.yml /osm/import/geofabrik.yml && touch /osm/import/geofabrik.yml"



genservices:  af-genservices aq-genservices as-genservices ao-genservices ca-genservices eu-genservices na-genservices ru-genservices sa-genservices

af-genservices:
	./taginfo_genconfig.sh  africa             af  11000  "where (length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','dk')) "  "1=1 "
aq-genservices:
	./taginfo_genconfig.sh  antarctica         aq  12000  "--"                            "1=1 "
as-genservices:
	./taginfo_genconfig.sh  asia               as  14000  "where (area_pct > 0.8) and (iso not in ('ru','fr','nl')) and (length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','dk')) "  "1=1 "
ao-genservices:
	./taginfo_genconfig.sh  australia-oceania  ao  16000  "where length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','us')"  "1=1 "
ca-genservices:
	./taginfo_genconfig.sh  central-america    ca  18000  "where length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','dk')"  "1=1 "
eu-genservices:
	./taginfo_genconfig.sh  europe             eu  20000  "where (length(iso)=2 AND iso not in ('ru','fr')) or (iso in ('uk-sba','fr-metropolitan'))"  "1=1 "
na-genservices:
	./taginfo_genconfig.sh  north-america      na  22000  "where length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','dk') "   "1=1 "
ru-genservices:
	./taginfo_genconfig.sh  russia             ru  24000  "where iso in('ru')"                            "1=1 "
sa-genservices:
	./taginfo_genconfig.sh  south-america      sa  26000  "where length(iso)=2 or substr(iso,1,2) in ('fr','nl','us') "   "1=1 "


test-service:  init t-genservices down rmdebugimages

t-genservices:
	./taginfo_genconfig.sh  africa             af  11000  "where iso in ('ml','tz','ug','zm','zw','ne','ng')"  "1=1 "
	./taginfo_genconfig.sh  antarctica         aq  12000  "--"                              "1=1 "
	./taginfo_genconfig.sh  asia               as  14000  "where iso in ('az','mn','mm','lk')"   "1=1 "
	./taginfo_genconfig.sh  australia-oceania  ao  16000  "where iso in ('au','pg')"        "1=1 "
	./taginfo_genconfig.sh  central-america    ca  18000  "where iso in ('ni','cu')"        "1=1 "
	./taginfo_genconfig.sh  europe             eu  20000  "where iso in ('ee','lv','lt','pt','hu','sk','si','hr','sr','mt','rs','bg','ro','md','al','at','fr-cor','de-be','de-sn')"  "1=1 "
	./taginfo_genconfig.sh  north-america      na  22000  "where iso in ('ca-ab','mx','us-ak','us-fl')"      "1=1 "
	./taginfo_genconfig.sh  russia             ru  24000  "where iso in ('ru-kgd','ru-ros','ru-ast')"        "1=1 "
	./taginfo_genconfig.sh  south-america      sa  26000  "where iso in ('co','ar','br')"                    "1=1 "



#  10010 port reserved for Docker : https://github.com/moby/moby/issues/37507
sotm_services:
	./taginfo_genconfig.sh  africa             af  11000  "where (iso not in('bv')) and ( length(iso)=2 or substr(iso,1,2) in ('fr','es')) " "1=1 "
	./taginfo_genconfig.sh  antarctica         aq  12000  "--"                            "1=1 "
	./taginfo_genconfig.sh  asia               as  13000  "where (area_pct > 0.8) and (iso not in ('in','jp','ru','fr','nl')) and ( (length(iso)=2) or substr(iso,1,2) in ('in','jp','fr','nl','es','dk','us')) " "1=1 "
	./taginfo_genconfig.sh  australia-oceania  ao  14000  "where length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','us') "      "1=1 "
	./taginfo_genconfig.sh  central-america    ca  15000  "where length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','dk','us') " "1=1 "
	./taginfo_genconfig.sh  europe             eu  16000  "where iso not in ('fr','de') and (length(iso)=2 or substr(iso,1,2) in ('fr','nl','de') or iso in ('it-32','it-88')) "  "1=1 "
	./taginfo_genconfig.sh  north-america      na  17000  "where iso not in ('us','ca') and (length(iso)=2 or substr(iso,1,2) in ('fr','nl','es','dk','us','ca')) "  "1=1 "
	./taginfo_genconfig.sh  russia             ru  18000  "where iso like 'ru-%' and length(iso)>2 "    "1=1 "
	./taginfo_genconfig.sh  south-america      sa  19000  "where length(iso)=2 or substr(iso,1,2) in ('fr','nl','us') "  "1=1 "

runservices:
	./taginfo_run_service_refresh.sh  africa             af  11000
	./taginfo_run_service_refresh.sh  antarctica         aq  12000
	./taginfo_run_service_refresh.sh  asia               as  14000
	./taginfo_run_service_refresh.sh  australia-oceania  ao  16000
	./taginfo_run_service_refresh.sh  central-america    ca  18000
	./taginfo_run_service_refresh.sh  europe             eu  20000
	./taginfo_run_service_refresh.sh  north-america      na  22000
	./taginfo_run_service_refresh.sh  russia             ru  24000
	./taginfo_run_service_refresh.sh  south-america      sa  26000





genproxy:
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose run  --rm -T taginfo_dev  /osm/setup/genhugo.sh

startproxy:
	cd ./service/ca && docker-compose  -f docker-compose-proxy.yml  up -d && cd ../..

stopproxy:
	cd ./service/ca && docker-compose  -f docker-compose-proxy.yml  down && cd ../..


service-create:
	cd ./service/af && ./service_create.sh 	&& cd ../..
	cd ./service/ao && ./service_create.sh 	&& cd ../..
	cd ./service/aq && ./service_create.sh 	&& cd ../..
	cd ./service/as && ./service_create.sh 	&& cd ../..
	cd ./service/ca && ./service_create.sh 	&& cd ../..
	cd ./service/eu && ./service_create.sh 	&& cd ../..
	cd ./service/na && ./service_create.sh 	&& cd ../..
	cd ./service/ru && ./service_create.sh 	&& cd ../..
	cd ./service/sa && ./service_create.sh 	&& cd ../..

service-up:
	cd ./service/af && ./service_up.sh 		&& cd ../..
	cd ./service/ao && ./service_up.sh 		&& cd ../..
	cd ./service/aq && ./service_up.sh 		&& cd ../..
	cd ./service/as && ./service_up.sh 		&& cd ../..
	cd ./service/ca && ./service_up.sh 		&& cd ../..
	cd ./service/eu && ./service_up.sh 		&& cd ../..
	cd ./service/na && ./service_up.sh 		&& cd ../..
	cd ./service/ru && ./service_up.sh 		&& cd ../..
	cd ./service/sa && ./service_up.sh 		&& cd ../..

service-down:
	cd ./service/af && ./service_down.sh 	&& cd ../..
	cd ./service/ao && ./service_down.sh 	&& cd ../..
	cd ./service/aq && ./service_down.sh 	&& cd ../..
	cd ./service/as && ./service_down.sh 	&& cd ../..
	cd ./service/ca && ./service_down.sh 	&& cd ../..
	cd ./service/eu && ./service_down.sh 	&& cd ../..
	cd ./service/na && ./service_down.sh 	&& cd ../..
	cd ./service/ru && ./service_down.sh 	&& cd ../..
	cd ./service/sa && ./service_down.sh 	&& cd ../..

service-job:
	cd ./service/af && ./service_job.sh  && cd ../..
	cd ./service/ao && ./service_job.sh  && cd ../..
	cd ./service/aq && ./service_job.sh  && cd ../..
	cd ./service/as && ./service_job.sh  && cd ../..
	cd ./service/ca && ./service_job.sh  && cd ../..
	cd ./service/eu && ./service_job.sh  && cd ../..
	cd ./service/na && ./service_job.sh  && cd ../..
	cd ./service/ru && ./service_job.sh  && cd ../..
	cd ./service/sa && ./service_job.sh  && cd ../..

service-job-test:
	cd ./service/af && ./service_job_test.sh  && cd ../..
	cd ./service/ao && ./service_job_test.sh  && cd ../..
	cd ./service/aq && ./service_job_test.sh  && cd ../..
	cd ./service/as && ./service_job_test.sh  && cd ../..
	cd ./service/ca && ./service_job_test.sh  && cd ../..
	cd ./service/eu && ./service_job_test.sh  && cd ../..
	cd ./service/na && ./service_job_test.sh  && cd ../..
	cd ./service/ru && ./service_job_test.sh  && cd ../..
	cd ./service/sa && ./service_job_test.sh  && cd ../..



peakcheck:
	cat ./service/*/*/sources/log/*.log | grep peak:  	   | cut -d':' -f3 | sort -h | uniq
	cat ./service/*/*/joblog/*.log | grep "Peak"           | cut -d':' -f3 | sort -h | uniq

dockerstat:
	docker stats --format "table {{.Name}}\t {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}"


listtemposmpbf:
	ls ./service/*/*/input/*.osm.pbf

listoldtaginfo:
	ls ./service/*/*/data/old/*


compress-service:  rmtempdata rmworkdata tar-service

rmtempdata:
	rm -f ./service/*/*/input/*.osm.pbf
	rm -f ./service/*/*/data/old/*

rmworkdata:
	rm -vf ./service/*/*/sources/*.db
	rm -vf ./service/*/*/sources/*.xlsx

tar-service:
	rm -f taginfo_servicedata.tar.gz
	tar -zcvf taginfo_servicedata.tar.gz ./service/
	gzip -l taginfo_servicedata.tar.gz

untar-service:
	echo "start uncompress to ./service_new"
	mkdir -p ./service_new 
	rm -vf ./service_new/*
	tar -xzvf taginfo_servicedata.tar.gz -C service_new/
	echo "uncompressed to ./service_new  ; please rename to ./service manually"

rmdebugimages:
	rm ./service/*/*/poly/osm.geojson
	rm ./service/*/*/poly/osm.poly
	rm ./service/*/*/img/nebackground.geotif
	rm ./service/*/*/img/nebackground.png
	rm ./service/*/*/img/nebackground.png.aux.xml
	rm ./service/*/*/img/tdbackground.png
	rm ./service/*/*/img/dbackground0.png
