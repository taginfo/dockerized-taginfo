# generated : 2019-12-29:15:51  // template : ./setup/service_up.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 


 docker-compose restart taginfo-na-bm
 docker-compose restart taginfo-na-ca
 docker-compose restart taginfo-na-fr-pm
 docker-compose restart taginfo-na-gl
 docker-compose restart taginfo-na-mx
 docker-compose restart taginfo-na-us
 
# generated : 2019-12-29:15:51