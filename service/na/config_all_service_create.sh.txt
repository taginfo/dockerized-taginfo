# generated : 2019-12-29:15:51  // template : ./setup/service_create.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 


 docker-compose up --no-start taginfo-na-bm
 docker-compose up --no-start taginfo-na-ca
 docker-compose up --no-start taginfo-na-fr-pm
 docker-compose up --no-start taginfo-na-gl
 docker-compose up --no-start taginfo-na-mx
 docker-compose up --no-start taginfo-na-us
 
# generated : 2019-12-29:15:51