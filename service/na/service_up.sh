# generated : 2019-12-29:15:51  // template : ./setup/service_up.sh.jinja2

export CURRENT_UID="$(id -u):$(id -g)" 


 docker-compose start taginfo-na-bm
 docker-compose start taginfo-na-ca
 docker-compose start taginfo-na-fr-pm
 docker-compose start taginfo-na-gl
 docker-compose start taginfo-na-mx
 docker-compose start taginfo-na-us
 
# generated : 2019-12-29:15:51