# generated : 2019-12-29:15:14  // template : ./setup/template/Makefile.jinja2

CURRENT_UID:=$(shell echo $$(id -u):$$(id -g))
export CURRENT_UID

down:
	CURRENT_UID="$$(id -u):$$(id -g)"  docker-compose down

clean:
	CURRENT_UID="$$(id -u):$$(id -g)"  docker-compose rm -f -v


taginfo-aq-aq:
	# make GDNAME=antarctica taginfo-aq-aq
	@echo " Start test  aq-aq :: Antarctica     ::     mapped local port after finishing   127.0.0.1:12001"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-aq-aq	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-aq-aq /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-aq-aq


# generated : 2019-12-29:15:14