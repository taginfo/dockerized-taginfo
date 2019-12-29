# generated : 2019-12-29:15:53  // template : ./setup/template/Makefile.jinja2

CURRENT_UID:=$(shell echo $$(id -u):$$(id -g))
export CURRENT_UID

down:
	CURRENT_UID="$$(id -u):$$(id -g)"  docker-compose down

clean:
	CURRENT_UID="$$(id -u):$$(id -g)"  docker-compose rm -f -v


taginfo-ru-ru:
	# make GDNAME=russia taginfo-ru-ru
	@echo " Start test  ru-ru :: Russia     ::     mapped local port after finishing   127.0.0.1:24001"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-ru-ru	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-ru-ru /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-ru-ru


# generated : 2019-12-29:15:53