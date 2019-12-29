# generated : 2019-12-29:15:51  // template : ./setup/template/Makefile.jinja2

CURRENT_UID:=$(shell echo $$(id -u):$$(id -g))
export CURRENT_UID

down:
	CURRENT_UID="$$(id -u):$$(id -g)"  docker-compose down

clean:
	CURRENT_UID="$$(id -u):$$(id -g)"  docker-compose rm -f -v


taginfo-na-bm:
	# make GDNAME=north-america taginfo-na-bm
	@echo " Start test  na-bm :: Bermuda     ::     mapped local port after finishing   127.0.0.1:22001"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-na-bm	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-na-bm /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-na-bm

taginfo-na-ca:
	# make GDNAME=north-america taginfo-na-ca
	@echo " Start test  na-ca :: Canada     ::     mapped local port after finishing   127.0.0.1:22002"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-na-ca	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-na-ca /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-na-ca

taginfo-na-fr-pm:
	# make GDNAME=canada taginfo-na-fr-pm
	@echo " Start test  na-fr-pm :: Saint Pierre and Miquelon     ::     mapped local port after finishing   127.0.0.1:22003"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-na-fr-pm	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-na-fr-pm /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-na-fr-pm

taginfo-na-gl:
	# make GDNAME=greenland taginfo-na-gl
	@echo " Start test  na-gl :: Greenland     ::     mapped local port after finishing   127.0.0.1:22004"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-na-gl	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-na-gl /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-na-gl

taginfo-na-mx:
	# make GDNAME=north-america taginfo-na-mx
	@echo " Start test  na-mx :: Mexico     ::     mapped local port after finishing   127.0.0.1:22005"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-na-mx	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-na-mx /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-na-mx

taginfo-na-us:
	# make GDNAME=north-america taginfo-na-us
	@echo " Start test  na-us :: United States     ::     mapped local port after finishing   127.0.0.1:22006"
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up --no-start taginfo-na-us	
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose  -f docker-compose-job.yml  run     --rm taginfo-job-na-us /osm/sh/startlocal.sh 
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up taginfo-na-us


# generated : 2019-12-29:15:51