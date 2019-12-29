# generated : 2019-12-29:15:51  // template : ./setup/service_down.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 


 docker-compose stop taginfo-na-bm
 docker-compose stop taginfo-na-ca
 docker-compose stop taginfo-na-fr-pm
 docker-compose stop taginfo-na-gl
 docker-compose stop taginfo-na-mx
 docker-compose stop taginfo-na-us
 
# generated : 2019-12-29:15:51