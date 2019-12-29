# generated : 2019-12-29:15:51  // template : ./setup/service_rm.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 


 docker-compose rm -f taginfo-na-bm
 docker-compose rm -f taginfo-na-ca
 docker-compose rm -f taginfo-na-fr-pm
 docker-compose rm -f taginfo-na-gl
 docker-compose rm -f taginfo-na-mx
 docker-compose rm -f taginfo-na-us
 
# generated : 2019-12-29:15:51